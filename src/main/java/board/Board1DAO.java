package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLSyntaxErrorException;
import java.util.ArrayList;

import org.apache.taglibs.standard.tag.common.fmt.ParseDateSupport;

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
	public ArrayList<Board1DTO> list(int start, int end) {
		String sql = "select B.* from(select rownum rn, A.* from(select * from PJ_board1 order by idgroup desc, step asc)A)B where rn between ? and ?";
		ArrayList<Board1DTO> li = new ArrayList<Board1DTO>();
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				li.add(getBoard1());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return li;
	}
	
	//BoardNum
	public ArrayList<Board1DTO> searchBnList(String val) {
		String sql = "select * from PJ_board1 where bnum = ? order by idgroup desc, step asc";
		ArrayList<Board1DTO> srbnli = new ArrayList<Board1DTO>();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, val);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				srbnli.add(getBoard1());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return srbnli;
	}
	
	//name
	public ArrayList<Board1DTO> searchNmList(String val) {
		String sql = "select * from PJ_board1 where name = ? order by idgroup desc, step asc";
		ArrayList<Board1DTO> srnmli = new ArrayList<Board1DTO>();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, val);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				srnmli.add(getBoard1());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return srnmli;
	}
	
	//title
	public ArrayList<Board1DTO> searchTtList(String val) {
		String keyword = "%" + val + "%";
		String sql = "select * from PJ_board1 where title like ? order by idgroup desc, step asc";
		//select * from PJ_board1 where title like '%1%' order by idgroup desc, step asc
		ArrayList<Board1DTO> srnmli = new ArrayList<Board1DTO>();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, keyword);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				srnmli.add(getBoard1());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return srnmli;
	}
	
	//content
	public ArrayList<Board1DTO> searchCtList(String val) {
		String keyword = "%" + val + "%";
		String sql = "select * from PJ_board1 where content like ? order by idgroup desc, step asc";
		ArrayList<Board1DTO> srnmli = new ArrayList<Board1DTO>();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, keyword);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				srnmli.add(getBoard1());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return srnmli;
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
		String sql = "select id, name from PJ_member where id=" + id;
		Board1DTO dto = new Board1DTO();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getInt("id"));
				dto.setName(rs.getString("name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public Board1DTO getReNumHit(String bnum) {
		String sql = "select bnum, hit, idgroup, step, indent from PJ_board1 where bnum=" + bnum;
		Board1DTO dto = new Board1DTO();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setBnum(rs.getInt("bnum"));
				dto.setHit(rs.getInt("hit"));
				dto.setIdgroup(rs.getInt("idgroup"));
				dto.setStep(rs.getInt("step"));
				dto.setIndent(rs.getInt("indent"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//게시글 작성
	public void insert(String id, String name, String title, String content) {
		String sql = "insert into PJ_board1(bnum, id, name, title, content, idgroup, step, indent) values(PJ_board1_seq.nextval,?,?,?,?,PJ_board1_seq.currval,0,0)";
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
	
	public Board1DTO updateContent(String bnum) {
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
	
	private void replyShap(Board1DTO dto) {
		String sql = "update PJ_board1 set step = step + 1 where idgroup = ? and step > ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getIdgroup());
			ps.setInt(2, dto.getStep());
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void reply(Board1DTO dto) {
		replyShap(dto);
		
		String sql = "insert into PJ_board1(bnum, id, name, title, content, idgroup, step, indent) values(PJ_board1_seq.nextval,?,?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getId());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getTitle());
			ps.setString(4, dto.getContent());
			
			ps.setInt(5, dto.getIdgroup());
			ps.setInt(6, dto.getStep() + 1);
			ps.setInt(7, dto.getIndent() + 1);
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getTotalPage() {
		String sql = "select count(*) from PJ_board1";
		int cnt = 0;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1); //DB에서 1값을 통해 갯수를 가져옴
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public PageCount pagingNum(int start) {
		if(start == 0) {
			start = 1;
		}
		PageCount pc = new PageCount();
		int pageNum = 10; //한 페이지당 보여질 글 개수
		int totalPage = getTotalPage(); //글 총 개수 얻어옴
		int allPage = 0; //총 페이지 개수
		allPage = totalPage / pageNum;
		if(totalPage % pageNum != 0) {
			allPage += 1; //페이지 하나 더 추가해줌
		}
		pc.setTotEndPage(allPage);
		pc.setStartPage( (start - 1) * pageNum + 1);
		pc.setEndPage(pageNum * start);
		return pc;
	}

}
