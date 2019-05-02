package com.info.web.util.encrypt;

import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
@Slf4j
public class AESUtil {
	public final static String KEY = "!@#$%^&*(";
	public final static String KEY_USER_FROM= "123#@!456$%^";


	/**
	 * 
	 * @param content content
	 * @param password pwd
	 * @return str
	 */
	public static String encrypt(String content, String password) {
		try {
			if (StringUtils.isBlank(password)) {
				password = KEY;
			}
			KeyGenerator kgen = KeyGenerator.getInstance("AES");
			SecureRandom secureRandom = SecureRandom.getInstance("SHA1PRNG");
			secureRandom.setSeed(password.getBytes());
			kgen.init(128, secureRandom);
			SecretKey secretKey = kgen.generateKey();
			byte[] enCodeFormat = secretKey.getEncoded();
			SecretKeySpec key = new SecretKeySpec(enCodeFormat, "AES");
			Cipher cipher = Cipher.getInstance("AES");
			byte[] byteContent = content.getBytes("utf-8");
			cipher.init(Cipher.ENCRYPT_MODE, key);
			byte[] result = cipher.doFinal(byteContent);
			return ByteUtil.byteArr2HexStr(result);
		} catch (Exception e) {
			log.error("encrypt error:{}",e);
		}
		return null;
	}

//	public static void main(String[] args){
//		System.out.println(AESUtil.encrypt("856",AESUtil.KEY));
//	}

	public static String decrypt(String content, String password) {
		try {
			if (StringUtils.isBlank(password)) {
				password = KEY;
			}
			KeyGenerator kgen = KeyGenerator.getInstance("AES");
			SecureRandom secureRandom = SecureRandom.getInstance("SHA1PRNG");// 修复linux系统报错问题
			secureRandom.setSeed(password.getBytes());
			kgen.init(128, secureRandom);
			SecretKey secretKey = kgen.generateKey();
			byte[] enCodeFormat = secretKey.getEncoded();
			SecretKeySpec key = new SecretKeySpec(enCodeFormat, "AES");
			Cipher cipher = Cipher.getInstance("AES");
			cipher.init(Cipher.DECRYPT_MODE, key);
			byte[] result = cipher.doFinal(ByteUtil.hexStr2ByteArr(content));
			return new String(result, "UTF-8");
		} catch (Exception e) {
			log.error("decrypt error:{}",e);
		}
		return null;
	}

}
