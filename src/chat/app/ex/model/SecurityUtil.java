package chat.app.ex.model;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

// 패스워드를 SHA-256 알고리즘으로 암호화
// 사용자가 입력한 패스워드 또한 암호화 하여 비교해야 한다.
public class SecurityUtil {

	public String encryptSHA256(String pwd, String salt) {
		return encryptSHA256(pwd, salt.getBytes());
	}
	
	public String encryptSHA256(String pwd, byte[] salt) {
		
		String result = "";
		
		byte[] a = pwd.getBytes();
		byte[] bytes = new byte[a.length + salt.length];
		
		System.arraycopy(a, 0, bytes, 0, a.length);
		System.arraycopy(salt, 0, bytes, a.length, salt.length);
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(bytes);
			
			byte[] byteData = md.digest();
			
			StringBuffer sb = new StringBuffer();
			for(int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i]& 0xFF)+256, 16).substring(1));
			}
			
			result = sb.toString();
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public String generateSalt() {
		SecureRandom sr = new SecureRandom();
		
		byte[] salt = new byte[8];
		sr.nextBytes(salt);
		
		StringBuffer sb = new StringBuffer();
		for(int i=0; i<salt.length; i++) {
			// byte값을 Hex값으로 바꾸기
			sb.append(String.format("%02x", salt[i]));
		}
		return sb.toString();
	}
}