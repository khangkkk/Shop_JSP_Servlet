package my.com.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Validation {
	public static String randomString() {
		String REF = "abcdefghijkqwpouABCDEFGHIJKQRP123456789";
		Random r = new Random();
		char[] salt = new char[8];
		for (int i = 0; i < salt.length; i++) {
			salt[i] = REF.charAt(r.nextInt(REF.length()));
		}
		return new String(salt);
	}

	public static String encyptPassword(String password, String salt) {
		String pass_h = password + salt;
		try {
			// getInstance() method is called with algorithm SHA-512
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			byte[] messDigest = md.digest(pass_h.getBytes());
			// convert byte to big integer
			BigInteger bigInt = new BigInteger(1, messDigest);
			// convert big integer to hex
			String hashText = bigInt.toString(16);
			// Add preceding 0s to make it 32 bit
			while (hashText.length() < 32) {
				hashText = "0" + hashText;
			}
			return hashText;
		} catch (NoSuchAlgorithmException ex) {
			Logger.getLogger(Validation.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	public static int convert(String s) {
		int n = 0;
		try {
			n = Integer.parseInt(s);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return n;
	}
}
