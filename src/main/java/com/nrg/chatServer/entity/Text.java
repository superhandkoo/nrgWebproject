package com.nrg.chatServer.entity;

import java.io.Serializable;
import java.time.LocalDateTime;

import com.nrg.chatServer.util.DateUtil;
import com.nrg.chatServer.util.FormatUtil;

public class Text implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String userName;
    private String message;
    private String emitTime = DateUtil.now();
    private String color = "#2E2E2E";
    private String bubbleColor = "#CECECE";
    private String fontSize = "12";
    private String fontType = "黑体";
    
    
    public Text(){
    	
    }
    
    public Text(String userName, String message) {
        this.userName = userName;
        this.message = message;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = FormatUtil.formatScript(userName);
    }

    public String getMessage() {
        return FormatUtil.formatScript(message);
    }

    public void setMessage(String message) {
        this.message = FormatUtil.formatScript(message);
    }

    public String getEmitTime() {
        return emitTime;
    }

    public void setEmitTime(String emitTime) {
        this.emitTime = emitTime;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getBubbleColor() {
        return bubbleColor;
    }

    public void setBubbleColor(String bubbleColor) {
        this.bubbleColor = bubbleColor;
    }

    public String getFontSize() {
        return fontSize;
    }

    public void setFontSize(String fontSize) {
        this.fontSize = fontSize;
    }

    public String getFontType() {
        return fontType;
    }

    public void setFontType(String fontType) {
        this.fontType = fontType;
    }

    public static void main(String[] args) {
        System.out.println(LocalDateTime.now().toString().replace("T", " "));
    }
}
