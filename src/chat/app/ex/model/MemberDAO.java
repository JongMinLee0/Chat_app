package chat.app.ex.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {

	// static 선언
	// Class Load ->전체에서 한번만 수행하게 된다.
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("클래스 로드 실패 : " + e.getMessage());
		}
	}

	// Single ton pattern
	private static MemberDAO dao;

	private MemberDAO() {
	}

	public static MemberDAO getInstance() {
		if (dao == null) {
			dao = new MemberDAO();
		}
		return dao;
	}

	// DB 연결에 필요한 변수 선언
	private Connection con;
	private Statement stmt;
	private ResultSet rs;

	// DB 연결을 수행하는 메소드
	private boolean connect() {
		boolean result = false;
		try {
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "chat_app", "tnthd2351"); // url
																												// 나중에
																												// 기입
			result = true;
		} catch (Exception e) {
			System.out.println("연결 실패 : " + e.getMessage());
		}
		return result;
	}

	// DB 연결을 해제하는 메소드
	private void close() {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (con != null)
				con.close();
		} catch (Exception e) {
			System.out.println("해제 실패 : " + e.getMessage());
		}
	}

	// 모든 테이블의 데이터를 읽어서 List로 리턴해주는 메소드
	public List<MemberBean> getList() {
		List<MemberBean> list = null;
		String sql = "SELECT * FROM MEMBER";

		if (this.connect()) {
			try {
				stmt = con.createStatement();
				if (stmt != null) {
					rs = stmt.executeQuery(sql);
					list = new ArrayList<MemberBean>();
					while (rs.next()) {
						MemberBean bean = new MemberBean();
						bean.setEmail(rs.getString("email"));
						bean.setPwd(rs.getString("pwd"));
						bean.setNick(rs.getString("nick"));
						list.add(bean);
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("데이터베이스 연결에 실패했습니다.");
			System.exit(0);
		}

		return list;

	}

	// CHAT_APP테이블에 데이터를 삽입하는 메서드
	public boolean InsertMember(MemberBean dto) {
		boolean result = false;
		if (this.connect()) {
			try {
				String sql = "INSERT INTO MEMBER VALUES(?,?,?)";
				PreparedStatement pstmt = con.prepareStatement(sql);

				// dto로부터 받아온 패스워드를 암호화
				SecurityUtil sec = new SecurityUtil();
				String pwd = sec.encryptSHA256(dto.getPwd(), sec.generateSalt());
				pstmt.setString(1, dto.getEmail());
				pstmt.setString(2, pwd);
				pstmt.setString(3, dto.getNick());

				int r = pstmt.executeUpdate();

				if (r > 0)
					result = true;
				con.commit();
				pstmt.close();
				this.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		} else {
			System.out.println("데이터베이스 연결실패");
			System.exit(0);
		}

		return result;
	}

	// CHAT_APP 테이블에 업데이트 해주는 메서드(회원정보를 수정할지에 따라서 결정)-> 수정한다면 닉네임정도?

}
