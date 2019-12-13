package com.util;

import java.text.DecimalFormat;

public class FormatUtil {
	
	// static 정적 메서드
	public static String number(long number, String pattern) {
		DecimalFormat format = new DecimalFormat(pattern);
		return format.format(number);
	}

}
