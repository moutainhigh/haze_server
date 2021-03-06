package com.info.web.util.aliyun;

import com.aliyun.openservices.ons.api.*;
import com.info.back.utils.PropertiesUtil;
import com.info.web.util.IdUtil;
import lombok.extern.slf4j.Slf4j;

import java.util.Date;
import java.util.Properties;

/**
 * 描述:
 * mq
 *
 * @author zed
 * @since 2019-02-12 1:29 PM
 */
@Slf4j
public class RocketMqUtil {
    public static void sendAiMessage(String message){
        Properties properties = new Properties();
        properties.setProperty(PropertyKeyConst.GROUP_ID, "GID_AI_MESSAGE");
        // AccessKey 阿里云身份验证，在阿里云服务器管理控制台创建
        properties.put(PropertyKeyConst.AccessKey,"LTAIU2TLHViOwb9v");
        // SecretKey 阿里云身份验证，在阿里云服务器管理控制台创建
        properties.put(PropertyKeyConst.SecretKey, "z4vKbsW3o9k2Bolt9RrmR5PDvgXSQv");
        //设置发送超时时间，单位毫秒
        properties.setProperty(PropertyKeyConst.SendMsgTimeoutMillis, "3000");
        // 设置 TCP 接入域名，到控制台的实例基本信息中查看
        properties.put(PropertyKeyConst.NAMESRV_ADDR,
                "http://MQ_INST_1144756263127949_BaeOSf5Q.mq-internet-access.mq-internet.aliyuncs.com:");

        Producer producer = ONSFactory.createProducer(properties);
        // 在发送消息前，必须调用 start 方法来启动 Producer，只需调用一次即可
        producer.start();

        //循环发送消息
        Message msg = new Message( //
                // Message 所属的 Topic
                "fish_online_ai",
                // Message Tag 可理解为 Gmail 中的标签，对消息进行再归类，方便 Consumer 指定过滤条件在 MQ 服务器过滤
                "ai_message",
                // Message Body 可以是任何二进制形式的数据， MQ 不做任何干预，
                // 需要 Producer 与 Consumer 协商好一致的序列化和反序列化方式
                message.getBytes());
        // 设置代表消息的业务关键属性，请尽可能全局唯一。
        // 以方便您在无法正常收到消息情况下，可通过阿里云服务器管理控制台查询消息并补发
        // 注意：不设置也不会影响消息正常收发
        msg.setKey(IdUtil.getUUID());

        try {
            SendResult sendResult = producer.send(msg);
            // 同步发送消息，只要不抛异常就是成功
            if (sendResult != null) {
                log.info(new Date() + " Send mq message success. Topic is:" + msg.getTopic() + " msgId is: " + sendResult.getMessageId());
            }
        }
        catch (Exception e) {
            // 消息发送失败，需要进行重试处理，可重新发送这条消息或持久化这条数据进行补偿处理
            log.error(new Date() + " Send mq message failed. Topic is:" + msg.getTopic());
            e.printStackTrace();
        }

        // 在应用退出前，销毁 Producer 对象
        // 注意：如果不销毁也没有问题
        producer.shutdown();
    }

    public static void sendMqMessage(String topic,String tag,String message){
        Properties properties = new Properties();
        properties.setProperty(PropertyKeyConst.GROUP_ID, PropertiesUtil.get("GROUP_ID"));
        // AccessKey 阿里云身份验证，在阿里云服务器管理控制台创建
        properties.put(PropertyKeyConst.AccessKey,"LTAIU2TLHViOwb9v");
        // SecretKey 阿里云身份验证，在阿里云服务器管理控制台创建
        properties.put(PropertyKeyConst.SecretKey, "z4vKbsW3o9k2Bolt9RrmR5PDvgXSQv");
        //设置发送超时时间，单位毫秒
        properties.setProperty(PropertyKeyConst.SendMsgTimeoutMillis, "3000");
        // 设置 TCP 接入域名，到控制台的实例基本信息中查看
        properties.put(PropertyKeyConst.NAMESRV_ADDR,
                "http://MQ_INST_1144756263127949_BaeOSf5Q.mq-internet-access.mq-internet.aliyuncs.com:80");

        Producer producer = ONSFactory.createProducer(properties);
        // 在发送消息前，必须调用 start 方法来启动 Producer，只需调用一次即可
        producer.start();

        //循环发送消息
        Message msg = new Message( //
                // Message 所属的 Topic
                topic,
                // Message Tag 可理解为 Gmail 中的标签，对消息进行再归类，方便 Consumer 指定过滤条件在 MQ 服务器过滤
                tag,
                // Message Body 可以是任何二进制形式的数据， MQ 不做任何干预，
                // 需要 Producer 与 Consumer 协商好一致的序列化和反序列化方式
                message.getBytes());
        // 设置代表消息的业务关键属性，请尽可能全局唯一。
        // 以方便您在无法正常收到消息情况下，可通过阿里云服务器管理控制台查询消息并补发
        // 注意：不设置也不会影响消息正常收发
        msg.setKey(IdUtil.getUUID());

        try {
            SendResult sendResult = producer.send(msg);
            // 同步发送消息，只要不抛异常就是成功
            if (sendResult != null) {
                log.info(new Date() + " Send mq message success. Topic is:" + msg.getTopic() + " msgId is: " + sendResult.getMessageId());
            }
        }
        catch (Exception e) {
            // 消息发送失败，需要进行重试处理，可重新发送这条消息或持久化这条数据进行补偿处理
            log.error(new Date() + " Send mq message failed. Topic is:" + msg.getTopic());
            e.printStackTrace();
        }

        // 在应用退出前，销毁 Producer 对象
        // 注意：如果不销毁也没有问题
        producer.shutdown();
    }
}

