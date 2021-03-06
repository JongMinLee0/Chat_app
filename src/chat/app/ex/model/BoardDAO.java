package chat.app.ex.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class BoardDAO {

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("클래스 로드 실패 : " + e.getMessage());
		}
	}
	private static BoardDAO bdao;

	private BoardDAO() {

	}

	public static BoardDAO getInstance() {
		if (bdao == null) {
			bdao = new BoardDAO();
		}
		return bdao;
	}

	// DB연결에 필요한 변수 선언
	private Connection con;
	private Statement stmt;
	private ResultSet rs;
	private PreparedStatement pstmt;

	// DB연결을 수행하는 메소드
	private boolean connect() {
		boolean result = false;

		try {
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "chat_app", "tnthd2351");

			result = true;
		} catch (Exception e) {
			System.out.println("연결 실패 : " + e.getMessage());
		}

		return result;
	}

	// DB연결을 해제하는 메소드
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

	// 모든 테이블의 데이터를 읽어와 리스트로 리턴(게시글에 불러올 용도)
	public List<BoardBean> getList(HashMap<String, Integer> map) {
		List<BoardBean> list = null;
		
		// 첫 번째 value가 낮은수이고 두 번째 value가 높은 수 이다
		// 첫 번째 value부터 두 번째 value까지 뽑아온다. ex) 1~10번째 글을 가지고 온다.
		String sql = "SELECT b.* ";
        sql += "FROM(SELECT rownum as rm, a.* ";
        sql += "FROM(SELECT * FROM board ";
        sql += "ORDER BY write_date)a)b ";
        sql += "WHERE b.rm>=? and b.rm<=? ";
        sql += "ORDER BY write_date DESC";

		if (this.connect()) {
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(2, map.get("high"));
				pstmt.setInt(1, map.get("row"));
				if (pstmt != null) {
					rs = pstmt.executeQuery();
					list = new ArrayList<BoardBean>();
					while (rs.next()) {
						BoardBean bean = new BoardBean();
						bean.setTitle(rs.getString("title"));
						bean.setContent(rs.getString("content"));
						bean.setNick(rs.getString("nick"));
						bean.setDate(rs.getString("write_date"));
						bean.setClick(rs.getString("click"));
						list.add(bean);
					}
				}
			} catch (SQLException e) {
				System.out.println("데이터베이스 연결에 실패했습니다.");
				System.exit(0);
			}
		}
		return list;
	}
	
	// 게시글에 들어갔을 때 출력을 위한 메소드
	public List<BoardBean> getList() {
		List<BoardBean> list = null;
		String sql = "SELECT * FROM BOARD";

		if (this.connect()) {
			try {
				stmt = con.createStatement();
				
				if (stmt != null) {
					rs = stmt.executeQuery(sql);
					list = new ArrayList<BoardBean>();
					while (rs.next()) {
						BoardBean bean = new BoardBean();
						bean.setTitle(rs.getString("title"));
						bean.setContent(rs.getString("content"));
						bean.setNick(rs.getString("nick"));
						bean.setDate(rs.getString("write_date"));
						bean.setClick(rs.getString("click"));
						list.add(bean);
					}
				}
			} catch (SQLException e) {
				System.out.println("데이터베이스 연결에 실패했습니다.");
				System.exit(0);
			}
		}
		return list;
	}

	// Board 테이블에 데이터를 삽입하는 메소드
	public boolean InsertBoard(BoardBean dto) {
		boolean result = false;

		if (this.connect()) {
			String sql = "INSERT INTO BOARD VALUES(?,?,?,?,?)";
			try {
				PreparedStatement pstmt = con.prepareStatement(sql);

				pstmt.setString(1, dto.getTitle());
				pstmt.setString(2, dto.getContent());
				pstmt.setString(3, dto.getNick());
				pstmt.setString(4, dto.getDate());
				pstmt.setString(5, dto.getClick());
				int r = pstmt.executeUpdate();

				if (r > 0)
					result = true;
				con.commit();
				pstmt.close();
				this.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println(e.getMessage());
			}
		}else {
			System.out.println("데이터베이스 연결실패");
			System.exit(0);
		}
		return result;
	}
	
	
	//조회수를 증가시키는 메소드
	public void click(String time,int click) {
		if (this.connect()) {
			String sql = "UPDATE BOARD SET CLICK = ? WHERE WRITE_DATE = ?";
			try {
				PreparedStatement pstmt = con.prepareStatement(sql);

				pstmt.setString(1, click+"");
				pstmt.setString(2, time);
				
				int r = pstmt.executeUpdate();
				
				con.commit();
				pstmt.close();
				this.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println(e.getMessage());
			}
		}else {
			System.out.println("데이터베이스 연결실패");
			System.exit(0);
		}
	}
	
}
