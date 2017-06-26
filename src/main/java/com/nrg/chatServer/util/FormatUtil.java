package com.nrg.chatServer.util;

import org.apache.commons.lang.StringUtils;

public class FormatUtil {
	 /**
     * 过滤脚本
     * @param contant
     * @return
     */
    public static String formatScript(String contant) {
        if(StringUtils.isEmpty(contant)) {
            return contant;
        }
        contant = contant.replace("<", "&lt;");
        contant = contant.replace(">", "&gt;");
        return contant;
    }
}
