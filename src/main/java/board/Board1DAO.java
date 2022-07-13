package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.DBConnect;

public class Board1DAO {
	
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	//DB연결
	public Board1DAO() {
		try {
			con = DBConnect.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//게시판 전체 글 가져오기
	public ArrayList<Board1DTO> list() {
		String sql = "select * from PJ_board1";
		ArrayList<Board1DTO> li = new ArrayList<Board1DTO>();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				li.add(getBoard1());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return li;
	}
	
	//rs가 갖고있는 내용을 DTO에 저장
	private Board1DTO getBoard1() {
		Board1DTO dto = new Board1DTO();
		try {
			dto.setBnum( rs.getInt("bnum") );
			dto.setId( rs.getInt("id") );
			dto.setName( rs.getString("name"));
			dto.setTitle( rs.getString("title"));
			dto.setContent( rs.getString("content"));
			dto.setSavedate( rs.getTimestamp("savedate"));
			dto.setHit( rs.getInt("hit"));
			dto.setIdgroup( rs.getInt("idgroup"));
			dto.setStep( rs.getInt("step"));
			dto.setIndent( rs.getInt("indent"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//조회수 증가
	private void upHit(String bnum) {
		String sql = "update PJ_board1 set hit=hit+1 where bnum=" + bnum;
		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//게시글 번호를 통해 게시글 가져오기
	public Board1DTO getContent(String bnum) {
		upHit(bnum);
		
		String sql = "select * from PJ_board1 where bnum=" + bnum;
		Board1DTO dto = new Board1DTO();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				return getBoard1();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//id를 통해서 이름값 가져오기
	public Board1DTO getName(String id) {
		String sql = "select * from PJ_board1 where id=" + id;
		Board1DTO dto = new Board1DTO();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				return getBoard1();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//게시글 작성
	public void insert(String id, String name, String title, String content) {
		String sql = "insert into PJ_board1(bnum, id, name, title, content, idgroup, step, indent) values(test_board_seq.nextval,?,?,?,?,test_board_seq.currval,0,0)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, title);
			ps.setString(4, content);
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//수정
	public void update(Board1DTO dto) {
		String sql = "update PJ_board1 set name=?, title=?, content=? where bnum=?";
		try {
			ps = con.prepareStatement(sql);   
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			ps.setInt(4, dto.getBnum());
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delete(String bnum) {
		String sql = "delete from PJ_board1 where bnum = " + bnum;
		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
