package chat.app.ex.model;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

// 패스워드를 SHA-256 알고리즘으로 암호화
// 사용자가 입력한 패스워드 또한 암호화 하여 비교해야 한다.
public class SecurityUtil {

	public String encryptSHA256(String pwd) {
		String sha = "";
		try {
			MessageDigest sh = MessageDigest.getInstance("SHA-256");
			sh.update(pwd.getBytes());
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer();
			for(int i=0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i]&0xff)+0x100,16).substring(1));
			}
			sha = sb.toString();
		}catch(NoSuchAlgorithmException e) {
			//e.printStackTrace();
			System.out.println("Encrypt Error - NoSuchAlgorithmException");
			sha=null;
		}
		
		return sha;
	}
}
