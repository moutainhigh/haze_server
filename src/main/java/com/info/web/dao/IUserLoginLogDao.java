package com.info.web.dao;

import java.util.Map;

import com.info.web.pojo.UserLoginLog;


public interface IUserLoginLogDao {
	/***
	 * 查询
	 * @param params
	 * @return
	 */
	public UserLoginLog selectByParams(Map<String, String> params) ;
	
	/****
	 * 新增
	 * @param log
	 */
	public void saveUserLoginLog(UserLoginLog log) ;
	
	/***
	 * 修改
	 */
	public void updateUserLoginLog(UserLoginLog log);
}
