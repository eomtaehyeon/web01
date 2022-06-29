package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// Data Access Object : 데이터에 접근하는 역할을 맡은 객체
public class BbsDAO {

	private Connection conn; // 자바와 DB 연결하는 객체
	private PreparedStatement pstmt; // 쿼리 준비
	private ResultSet rs; // 쿼리 실행 후 결과를 담을 객체

	public BbsDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/TEST?serverTimezone=UTC";
			// jdbc : Java DataBase Connectivity
			String dbID = "root";
			String dbPassword = "system123";

			Class.forName("com.mysql.cj.jdbc.Driver");
			// 데이터베이스 드라이버를 로드할 뿐, 연결에 대한 행동은 하지 않음
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 글쓰기 화면에서 내용작성 후에 글쓰기 버튼 누르면 실행될 함수
	// 글 id, 글의 제목, 내용, 글쓴이, 글쓴 시간, 삭제여부를 db에 저장해야 한다.
	public int write(String bbsTitle, String userID, String bbsContent ) {
		String SQL = "INSERT INTO BBS VALUES (?,?,?,?,?,?)";
		// 실행할 쿼리 (사용자가 입력한 아이디에 해당하는 비밀번호 추출)

		try {
			pstmt = conn.prepareStatement(SQL); // 문자열 쿼리 대입
			pstmt.setInt(1, getNext()); 	// id
			pstmt.setString(2, bbsTitle); 	// bbsTitle. 제목
			pstmt.setString(3, userID);	// writer 
			pstmt.setString(4, getDate());	// crDate
			pstmt.setString(5, bbsContent);	// bbsContent
			pstmt.setInt(6, 1);	// bbsAvilable
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		return -1;	// 데이터베이스 오류
	}
	public int getNext() {
		String SQL = "select max(bbsID) from BBS";
		try {
			pstmt = conn.prepareStatement(SQL); // 문자열 쿼리 대입
			rs = pstmt.executeQuery();
			System.out.println("rs.getInt(1) : " +rs.getInt(1));
			return rs.getInt(1)+1;	// 다음에 들어갈 수 = 현재 들어있는 최고 숫자

		} catch (Exception e) {
			e.printStackTrace(); 
		}
		return -1;	// 에러
		
	}
	public String getDate() {
		String SQL = "select NOW() from dual";
		try {
			pstmt = conn.prepareStatement(SQL); // 문자열 쿼리 대입
			rs = pstmt.executeQuery();
			System.out.println(1);
			return "";		//

		} catch (Exception e) {
			e.printStackTrace(); 
		}
		return "";	// 에러		
	}	


}
