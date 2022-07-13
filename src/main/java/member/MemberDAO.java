package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DBPKG.DBConnect;

public class MemberDAO {

	Connection con; //연결된 객체 저장
	PreparedStatement ps; //명령어 전송 객체
	ResultSet rs; //결과 저장 객체
	
	public MemberDAO() {
		try {
			con = DBConnect.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("생성자 실행");
	}
	
	public int userChk(String id, String pwd) {
		System.out.println("dao id : " + id);
		System.out.println("dao pwd : " + pwd);
		
		String sql = "select * from PJ_member where id = ?";
		int result=0;
		
		try {
			ps = con.prepareStatement(sql);
			
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				System.out.println("해당 아이디는 존재합니다");
				if(pwd.equals( rs.getString("pwd"))) {
					System.out.println("로그인 성공");
					result = 1;
				} else {
					System.out.println("비밀번호 틀림");
					result = 0;
				}
			} else {
				System.out.println("아이디가 존재하지 않습니다.");
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
