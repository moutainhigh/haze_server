package com.info.web.common.reslult;

import java.util.Map;

import com.info.back.utils.ServiceResult;

public class JsonResult {

	public static String SUCCESS = "0";
	/**
	 * 返回代码
	 */
	private String code ;
	
	/**
	 * 提示信息
	 */
	private String msg ;

	/**
	 * 扩展信息
	 */
	private Object data ;

	private Map<String, String> paramsMap;
	
	public JsonResult(ServiceResult serviceResult){
		this.code = serviceResult.getCode();
		this.msg = serviceResult.getMsg();
	}
	
	public boolean isSuccessed(){
		return getCode().equals(SUCCESS);
	}
	
	public JsonResult(String code){
		this.code = code;
	}
	public JsonResult(){
	}
	
	public JsonResult(String code,String msg){
		this.code = code;
		this.msg  = msg;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, String> getParamsMap() {
		return paramsMap;
	}

	public void setParamsMap(Map<String, String> paramsMap) {
		this.paramsMap = paramsMap;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
}
