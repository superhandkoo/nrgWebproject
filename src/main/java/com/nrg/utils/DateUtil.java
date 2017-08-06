package com.nrg.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static String currTime(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		return df.format(new Date());
	}

}
