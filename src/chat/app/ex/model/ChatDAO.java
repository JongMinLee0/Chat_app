package chat.app.ex.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ChatDAO {

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("클래스 로드 실패 : " + e.getMessage());
		}
	}
	
	private static ChatDAO dao;
	
	private ChatDAO() {}
	
	public static ChatDAO getInstance() {
		return dao;
	}
	
	// DB연결에 필요한 변수 선언
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
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
		
		public List<ChatBean> getList(String send){
			List<ChatBean> list = null;
			
			// sql 작성해야 한다.
			String sql = "SELECT receive, content, max(send_date) from CHAT "
					+ "WHERE send = ? GROUP BY receive";
			
			if(this.connect()) {
				try {
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, send);
					// setString 해줘야 한다.
					if(pstmt != null) {
						rs = pstmt.executeQuery();
						list = new ArrayList<ChatBean>();
						while(rs.next()) {
							ChatBean bean = new ChatBean();
							bean.setReceive(rs.getString("receive"));
							bean.setSend_date(rs.getString("send_date"));
							bean.setContent(rs.getString("content"));
							
							list.add(bean);
						}
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return list;
		}
		
		public List<ChatBean> getTotalList(String send, String receive){
			List<ChatBean> list = null;
			
			// sql 작성해야 한다.
			String sql = "SELECT * FROM CHAT WHERE (send = ? AND receive = ?) OR (send = ? AND receive = ?)";
			
			if(this.connect()) {
				try {
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, send);
					pstmt.setString(2, receive);
					pstmt.setString(3, receive);
					pstmt.setString(4, send);
					// setString 해줘야 한다.
					if(pstmt != null) {
						rs = pstmt.executeQuery();
						list = new ArrayList<ChatBean>();
						while(rs.next()) {
							ChatBean bean = new ChatBean();
							bean.setSend(rs.getString("send"));
							bean.setReceive(rs.getString("receive"));
							bean.setSend_date(rs.getString("send_date"));
							bean.setContent(rs.getString("content"));
							
							list.add(bean);
						}
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return list;
		}
		public boolean InsertChat(ChatBean dto) {
			boolean result = false;
			if(this.connect()) {
				String sql = "INSERT INTO CHAT VALUES(?,?,?,?)";
				
				try {
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, dto.getSend());
					pstmt.setString(2, dto.getReceive());
					pstmt.setString(3, dto.getSend_date());
					pstmt.setString(4, dto.getContent());
					
					int r = pstmt.executeUpdate();
					if(r > 0) {
						result = true;
					}
					con.commit();
					pstmt.close();
					this.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else {
				System.out.println("데이터베이스 연결실패");
				System.exit(0);
			}
			return result;
		}
}


