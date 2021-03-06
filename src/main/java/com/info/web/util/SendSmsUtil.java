package com.info.web.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.info.back.utils.PropertiesUtil;
import com.info.back.utils.SmsConfigConstant;
import com.info.constant.Constant;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/**
 * 发送短信
 * @author gaoyuhai
 * 2016-6-17 下午03:50:44
 */
@Slf4j
public class SendSmsUtil {

	private static final Logger loger = LoggerFactory.getLogger(SendSmsUtil.class);
	private static String apiUrl = SmsConfigConstant.getConstant("apiurl");
	private static String massApiUrl = SmsConfigConstant.getConstant("massApiUrl");//群发
	private static String account = SmsConfigConstant.getConstant("account");
	private static String pswd = SmsConfigConstant.getConstant("pswd");
	private static String sign = SmsConfigConstant.getConstant("sign");
	private static String templateld = SmsConfigConstant.getConstant("templateld");

	private static String notify_account = SmsConfigConstant.getConstant("notify_account");
	private static String notify_pswd = SmsConfigConstant.getConstant("notify_pswd");
	private static String notify_sign = SmsConfigConstant.getConstant("notify_sign");

	public static final String templateld44641 = "44641";//打款成功通知
    public static final String templateld44639 = "44639";//借款明日到期提醒
    public static final String templateld44638 = "44638";//借款今日到期提醒
    public static final String templateld44636 = "44636";//打款成功通知
    public static final String templateld44635 = "44635";//风控验证通过
    public static final String templateld44634 = "44634";//正常还款


    /**
     * 验证码类短信
     * @param telephone
     * @param sms
     * @return
     */
	public static boolean sendSmsCL(String telephone, String sms){
		loger.info("sendSms:" + telephone + "   sms=" + sms);
        if (!"online".equals(PropertiesUtil.get("profile"))) {
            return true;
        }
        return cloudsp(telephone, templateld, sms, account, pswd, sign);
	}

	/**
	 * 通知类短信
	 * @param telephone 手机号
	 * @param content   内容
	 * @return boolean b
	 */
	public static boolean sendSmsDiyCL(String telephone, String temp, String content){
		loger.info("sendSms:" + telephone + "   sms=" + content);
        if (!"online".equals(PropertiesUtil.get("profile"))) {
            return true;
        }
        return cloudsp(telephone, temp, content, notify_account, notify_pswd, notify_sign);
    }

    private static boolean cloudsp(String telephone, String temp, String content, String accesskey, String secret, String sign) {
        try{
            //做URLEncoder - UTF-8编码
            String sm = URLEncoder.encode(content, "utf8");
            //将参数进行封装
            Map<String, Object> paramMap = new HashMap<>();
            paramMap.put("accesskey", accesskey);
            paramMap.put("secret", secret);
            paramMap.put("sign", sign);
            paramMap.put("templateId", temp);

            //单一内容时群发  将手机号用;隔开
            paramMap.put("mobile", telephone);
            paramMap.put("content", sm);
            String result = HttpUtil.sendPost(apiUrl, paramMap);
            System.out.println("result="+result);
            JSONObject jsonObject = JSON.parseObject(result);
            return jsonObject != null && jsonObject.getInteger("code") == 0;
        }catch (Exception e){
            loger.error("sendSmsCL error:{} ",e);
            return false;
        }
    }
}
