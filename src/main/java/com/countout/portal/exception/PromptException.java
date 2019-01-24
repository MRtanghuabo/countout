package com.countout.portal.exception;


/**
 * 拋出異常
 * @author Mr.tang
 *
 */
public class PromptException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	public PromptException(String message) {
	    super(message);
	  }
}
