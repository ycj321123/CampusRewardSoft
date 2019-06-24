package com.sise.ycj.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

public class IDCardUtil {
	final static String CITY_CODE[] = { "11", "12", "13", "14", "15", "21", "22", "23", "31", "32", "33", "34", "35",
			"36", "37", "41", "42", "43", "44", "45", "46", "50", "51", "52", "53", "54", "61", "62", "63", "64", "65",
			"71", "81", "82", "91" };
	final static char[] PARITYBIT = { '1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2' };
	final static int[] POWER = { 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 };

	public final static boolean isValid(String id) {
		if (id == null)
			return false;

		int len = id.length();

		if (len != 15 && len != 18)
			return false;

		// 校验区位码

		if (!validCityCode(id.substring(0, 2)))

			return false;

		// 校验生日

		if (!validDate(id))

			return false;

		if (len == 15)

			return true;

		// 校验位数

		return validParityBit(id);
	}

	private static boolean validParityBit(String id)

	{

		char[] cs = id.toUpperCase().toCharArray();

		int power = 0;

		for (int i = 0; i < cs.length; i++)

		{

			// 最后一位可以是X

			if (i == cs.length - 1 && cs[i] == 'X')

				break;

			// 非数字

			if (cs[i] < '0' || cs[i] > '9')

				return false;

			// 加权求和

			if (i < cs.length - 1)

			{
				power += (cs[i] - '0') * POWER[i];

			}

		}

		return PARITYBIT[power % 11] == cs[cs.length - 1];
	}

	private static boolean validDate(String id) {
		try

		{
			String birth = id.length() == 15 ? "19" + id.substring(6, 12) : id.substring(6, 14);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

			Date birthDate = sdf.parse(birth);

			if (!birth.equals(sdf.format(birthDate)))

				return false;
		} catch (ParseException e)

		{

			return false;

		}

		return true;

	}

	private static boolean validCityCode(String cityCode) {
		for (String code : CITY_CODE) {
			if (code.equals(cityCode))
				return true;
		}
		return false;
	}

	final public static String id15To18(String id) {
		if (id == null || id.length() != 15)
			return null;
		if (!isValid(id))
			return null;
		String id17 = id.substring(0, 6) + "19" + id.substring(6);
		int power = 0;
		char[] cs = id17.toCharArray();
		for (int i = 0; i < cs.length; i++) {
			power += (cs[i] - '0') * POWER[i];
		}
		// 将前17位与第18位校验码拼接
		return id17 + String.valueOf(PARITYBIT[power % 11]);
	}

	public static int rand(int min, int max) {
		Random random = new Random();
		return random.nextInt(max + 1) % (max - min + 1) + min;
	}

	public final static String generateID() {
		// 地址码
		String body = CITY_CODE[rand(0, CITY_CODE.length - 1)] + "0101";
		// 出生年
		String y = String.valueOf(rand(1950, Calendar.getInstance().get(Calendar.YEAR)));
		String m = String.valueOf(rand(1, 12));
		if (m.length() == 1)
			m = "0" + m;
		String d = String.valueOf(rand(1, 28));
		if (d.length() == 1)
			d = "0" + d;
		String idx = String.valueOf(rand(1, 999));
		if (idx.length() == 1)
			idx = "00" + idx;
		else if (idx.length() == 2)
			idx = "0" + idx;
		body += y + m + d + idx;
		// 累加body部分与位置加权的积
		int power = 0;
		char[] cs = body.toCharArray();
		for (int i = 0; i < cs.length; i++) {
			power += (cs[i] - '0') * POWER[i];
		}
		// 得出校验码
		return body + String.valueOf(PARITYBIT[power % 11]);
	}
	
	public static void main(String[] args) {
		System.out.println("验证结果："+isValid("330702197108020812"));
	}
}
