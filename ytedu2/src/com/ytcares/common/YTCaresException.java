package com.ytcares.common;

public class YTCaresException extends Exception {
	private static final long serialVersionUID = 1L;
	private String msgType;
	private String action;
	public YTCaresException() {
		super();
	}
	
	public YTCaresException(Throwable cause) {
		super(cause);
	}
	
	public YTCaresException(String message) {
		super(message);
//		if (message.contains(".")) {
//			msgType = message.split("\\.")[0];
//		}
	}
	
	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}
	
	public String getMsgType() {
		return this.msgType;
	}
	
	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

}
