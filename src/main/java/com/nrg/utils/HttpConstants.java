package com.nrg.utils;

/**
 * http请求中的一些常量
 * @author cp
 *
 */
public class HttpConstants {

	public static final String SYSTEM_ERROR_MSG = "系统错误";
	
	public static final String REQUEST_PARAMS_NULL = "请求参数为空";

	public static final String SERVICE_RESPONSE_NULL = "服务端返回结果为空";
	
	// 服务端返回成功的标志
	public static final String SERVICE_RESPONSE_SUCCESS_CODE = "AMS00000";
	
	// 服务端返回结果的标志
	public static final String SERVICE_RESPONSE_RESULT_FLAG = "returnCode";
	
	// 服务端返回结果失败的标志
	public static final String SERVICE_RESPONSE_RESULT_SUCCESSMSG = "successMsg";
	
	// 服务端返回结果失败的标志
	public static final String SERVICE_RESPONSE_RESULT_MSG = "errorMsg";
	
	// 返回给前段页面成功或失败的标志
	public static final String RESPONSE_RESULT_FLAG_ISERROR = "isError";
	
	// 执行删除操作
	public static final String OPERATION_TYPE_DELETE = "D";

	public static final String ENUM_PATH = "com.mucfc.msm.enumeration.";
	
}
