package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardDao {
	
	
	public List<BoardDto> selectList() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from board order by board_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardHead(rs.getString("board_head"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardTime(rs.getDate("board_time"));
			boardDto.setBoardReadcount(rs.getInt("board_readcount"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			boardDto.setBoardProductNo(rs.getInt("board_product_no"));
			
			boardDto.setBoardReplycount(rs.getInt("board_replycount"));
			
			boardDto.setGroupNo(rs.getInt("group_no"));
			boardDto.setSuperNo(rs.getInt("super_no"));
			boardDto.setDepth(rs.getInt("depth"));
			
			list.add(boardDto);
		}
		
		con.close();
		
		return list;
	}
	
	
	public List<BoardDto> selectList(String type, String keyword) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from board where instr(#1, ?) > 0 order by board_no desc";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardHead(rs.getString("board_head"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardTime(rs.getDate("board_time"));
			boardDto.setBoardReadcount(rs.getInt("board_readcount"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			boardDto.setBoardProductNo(rs.getInt("board_product_no"));
			
			boardDto.setBoardReplycount(rs.getInt("board_replycount"));
			
			boardDto.setGroupNo(rs.getInt("group_no"));
			boardDto.setSuperNo(rs.getInt("super_no"));
			boardDto.setDepth(rs.getInt("depth"));
			
			list.add(boardDto);
		}
		
		con.close();
		
		return list;
	}
	
	
	public List<BoardDto> myselectList(String type, String keyword) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from board_review where instr(board_writer, ?) > 0 order by board_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardHead(rs.getString("board_head"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardTime(rs.getDate("board_time"));
			boardDto.setBoardReadcount(rs.getInt("board_readcount"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			boardDto.setBoardProductNo(rs.getInt("board_product_no"));
			
			boardDto.setBoardReplycount(rs.getInt("board_replycount"));
			
			boardDto.setGroupNo(rs.getInt("group_no"));
			boardDto.setSuperNo(rs.getInt("super_no"));
			boardDto.setDepth(rs.getInt("depth"));
			
			list.add(boardDto);
		}
		
		con.close();
		
		return list;
	}
	
	
	
	public List<BoardDto> productselectList(int productNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from board_review where board_product_no = ? order by board_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, productNo);
		ResultSet rs = ps.executeQuery();
		
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardHead(rs.getString("board_head"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardTime(rs.getDate("board_time"));
			boardDto.setBoardReadcount(rs.getInt("board_readcount"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			boardDto.setBoardProductNo(rs.getInt("board_product_no"));
			
			boardDto.setBoardReplycount(rs.getInt("board_replycount"));
			
			boardDto.setGroupNo(rs.getInt("group_no"));
			boardDto.setSuperNo(rs.getInt("super_no"));
			boardDto.setDepth(rs.getInt("depth"));
			
			list.add(boardDto);
		}
		
		con.close();
		
		return list;
	}
	
	public List<BoardDto> productqnaselectList(int productNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from board_productqna where board_product_no = ? order by board_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, productNo);
		ResultSet rs = ps.executeQuery();
		
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardHead(rs.getString("board_head"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardTime(rs.getDate("board_time"));
			boardDto.setBoardReadcount(rs.getInt("board_readcount"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			boardDto.setBoardProductNo(rs.getInt("board_product_no"));
			
			boardDto.setBoardReplycount(rs.getInt("board_replycount"));
			
			boardDto.setGroupNo(rs.getInt("group_no"));
			boardDto.setSuperNo(rs.getInt("super_no"));
			boardDto.setDepth(rs.getInt("depth"));
			
			list.add(boardDto);
		}
		
		con.close();
		
		return list;
	}
	

	public BoardDto selectOne(int boardNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from board where board_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardNo);
		ResultSet rs = ps.executeQuery();
		
		BoardDto boardDto;
		if(rs.next()) {
			boardDto = new BoardDto();
			
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardHead(rs.getString("board_head"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardContent(rs.getString("board_content"));
			boardDto.setBoardTime(rs.getDate("board_time"));
			boardDto.setBoardReadcount(rs.getInt("board_readcount"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			boardDto.setBoardProductNo(rs.getInt("board_product_no"));
			
			boardDto.setBoardReplycount(rs.getInt("board_replycount"));
			
			boardDto.setGroupNo(rs.getInt("group_no"));
			boardDto.setSuperNo(rs.getInt("super_no"));
			boardDto.setDepth(rs.getInt("depth"));
		}
		else {
			boardDto = null;
		}
		
		con.close();
		
		return boardDto;
	}
	

	public boolean plusReadcount(int boardNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update board set board_readcount = board_readcount + 1 where board_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	



	public int getSequence() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select board_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int number = rs.getInt("nextval");
		
		con.close();
		
		return number;
	}
	
	public void insert(BoardDto boardDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into board("
								+ "board_no, board_head, board_title, board_content, board_writer, "
								+ "group_no, super_no, depth"
							+ ") "

						+ "values(?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardDto.getBoardNo());
		ps.setString(2, boardDto.getBoardHead());
		ps.setString(3, boardDto.getBoardTitle());
		ps.setString(4, boardDto.getBoardContent());
		ps.setString(5, boardDto.getBoardWriter());
		ps.setInt(6, boardDto.getGroupNo());
		ps.setInt(7, boardDto.getSuperNo());
		ps.setInt(8, boardDto.getDepth());
		ps.execute();
		
		con.close();
	}
	
	
	public void insertReview(BoardDto boardDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into board("
								+ "board_no, board_head, board_title, board_content, board_writer, board_product_no, "
								+ "group_no, super_no, depth"
							+ ") "

							+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardDto.getBoardNo());
		ps.setString(2, boardDto.getBoardHead());
		ps.setString(3, boardDto.getBoardTitle());
		ps.setString(4, boardDto.getBoardContent());
		ps.setString(5, boardDto.getBoardWriter());
		ps.setInt(6, boardDto.getBoardProductNo());
		ps.setInt(7, boardDto.getGroupNo());
		ps.setInt(8, boardDto.getSuperNo());
		ps.setInt(9, boardDto.getDepth());
		ps.execute();
		
		con.close();
	}
	
	public void insertProductqna(BoardDto boardDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into board("
								+ "board_no, board_head, board_title, board_content, board_writer, board_product_no, "
								+ "group_no, super_no, depth"
							+ ") "

							+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardDto.getBoardNo());
		ps.setString(2, boardDto.getBoardHead());
		ps.setString(3, boardDto.getBoardTitle());
		ps.setString(4, boardDto.getBoardContent());
		ps.setString(5, boardDto.getBoardWriter());
		ps.setInt(6, boardDto.getBoardProductNo());
		ps.setInt(7, boardDto.getGroupNo());
		ps.setInt(8, boardDto.getSuperNo());
		ps.setInt(9, boardDto.getDepth());
		ps.execute();
		
		con.close();
	}
	

	public boolean update(BoardDto boardDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update board "
								+ "set board_head = ?, board_title = ?, board_content = ? "
								+ "where board_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, boardDto.getBoardHead());
		ps.setString(2, boardDto.getBoardTitle());
		ps.setString(3, boardDto.getBoardContent());
		ps.setInt(4, boardDto.getBoardNo());
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	

	public boolean delete(int boardNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete board where board_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	

	public boolean updateReplycount(int boardNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update board set board_replycount = ("
									+ "select count(*) from reply where reply_target = ?"
						+ ") where board_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardNo);
		ps.setInt(2, boardNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	

	public List<BoardDto> selectListByPaging(int p, int s) throws Exception {
		
		int end = p * s;
		int begin = end - ( s - 1 ); 
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("

									+ "select * from board "
									+ "connect by prior board_no = super_no "
									+ "start with super_no = 0 "
									+ "order siblings by group_no desc, board_no asc "
								+ ") TMP"
						+ ") where rn between ? and ?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();
		
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardHead(rs.getString("board_head"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardTime(rs.getDate("board_time"));
			boardDto.setBoardReadcount(rs.getInt("board_readcount"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			
			boardDto.setBoardReplycount(rs.getInt("board_replycount"));
			
			boardDto.setGroupNo(rs.getInt("group_no"));
			boardDto.setSuperNo(rs.getInt("super_no"));
			boardDto.setDepth(rs.getInt("depth"));
			
			list.add(boardDto);
		}
		
		con.close();
		
		return list;
	}
	
	public List<BoardDto> selectListByPaging(int p, int s, String type, String keyword) throws Exception {
		
		int end = p * s;
		int begin = end - ( s - 1 ); 
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("

									+ "select * from board where instr(#1, ?) > 0 "
									+ "connect by prior board_no = super_no "
									+ "start with super_no = 0 "
									+ "order siblings by group_no desc, board_no asc "
								+ ") TMP"
						+ ") where rn between ? and ?";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		ResultSet rs = ps.executeQuery();
		
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardHead(rs.getString("board_head"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardTime(rs.getDate("board_time"));
			boardDto.setBoardReadcount(rs.getInt("board_readcount"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			
			boardDto.setBoardReplycount(rs.getInt("board_replycount"));
			
			boardDto.setGroupNo(rs.getInt("group_no"));
			boardDto.setSuperNo(rs.getInt("super_no"));
			boardDto.setDepth(rs.getInt("depth"));
			
			list.add(boardDto);
		}
		
		con.close();
		
		return list;
	}

	public List<BoardDto> selectNoticeListByPaging(int p, int s) throws Exception {
		
		int end = p * s;
		int begin = end - ( s - 1 ); 
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("

									+ "select * from board_notice "
									+ "connect by prior board_no = super_no "
									+ "start with super_no = 0 "
									+ "order siblings by group_no desc, board_no asc "
								+ ") TMP"
						+ ") where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();
		
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardHead(rs.getString("board_head"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardTime(rs.getDate("board_time"));
			boardDto.setBoardReadcount(rs.getInt("board_readcount"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			
			boardDto.setBoardReplycount(rs.getInt("board_replycount"));
			
			boardDto.setGroupNo(rs.getInt("group_no"));
			boardDto.setSuperNo(rs.getInt("super_no"));
			boardDto.setDepth(rs.getInt("depth"));
			
			list.add(boardDto);
		}
		
		con.close();
		
		return list;
	}
	
	public List<BoardDto> selectNoticeListByPaging(int p, int s, String type, String keyword) throws Exception {
		
		int end = p * s;
		int begin = end - ( s - 1 ); 
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("

									+ "select * from board_notice where instr(#1, ?) > 0 "
									+ "connect by prior board_no = super_no "
									+ "start with super_no = 0 "
									+ "order siblings by group_no desc, board_no asc "
								+ ") TMP"
						+ ") where rn between ? and ?";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		ResultSet rs = ps.executeQuery();
		
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardHead(rs.getString("board_head"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardTime(rs.getDate("board_time"));
			boardDto.setBoardReadcount(rs.getInt("board_readcount"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			
			boardDto.setBoardReplycount(rs.getInt("board_replycount"));
			
			boardDto.setGroupNo(rs.getInt("group_no"));
			boardDto.setSuperNo(rs.getInt("super_no"));
			boardDto.setDepth(rs.getInt("depth"));
			
			list.add(boardDto);
		}
		
		con.close();
		
		return list;
	}

	public List<BoardDto> selectQnaListByPaging(int p, int s) throws Exception {
		
		int end = p * s;
		int begin = end - ( s - 1 ); 
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("

									+ "select * from board_qna "
									+ "connect by prior board_no = super_no "
									+ "start with super_no = 0 "
									+ "order siblings by group_no desc, board_no asc "
								+ ") TMP"
						+ ") where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();
		
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardHead(rs.getString("board_head"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardTime(rs.getDate("board_time"));
			boardDto.setBoardReadcount(rs.getInt("board_readcount"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			
			boardDto.setBoardReplycount(rs.getInt("board_replycount"));
			
			boardDto.setGroupNo(rs.getInt("group_no"));
			boardDto.setSuperNo(rs.getInt("super_no"));
			boardDto.setDepth(rs.getInt("depth"));
			
			list.add(boardDto);
		}
		
		con.close();
		
		return list;
	}
	
	public List<BoardDto> selectQnaListByPaging(int p, int s, String type, String keyword) throws Exception {
		
		int end = p * s;
		int begin = end - ( s - 1 ); 
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("

									+ "select * from board_qna where instr(#1, ?) > 0 "
									+ "connect by prior board_no = super_no "
									+ "start with super_no = 0 "
									+ "order siblings by group_no desc, board_no asc "
								+ ") TMP"
						+ ") where rn between ? and ?";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		ResultSet rs = ps.executeQuery();
		
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardHead(rs.getString("board_head"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardTime(rs.getDate("board_time"));
			boardDto.setBoardReadcount(rs.getInt("board_readcount"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			
			boardDto.setBoardReplycount(rs.getInt("board_replycount"));
			
			boardDto.setGroupNo(rs.getInt("group_no"));
			boardDto.setSuperNo(rs.getInt("super_no"));
			boardDto.setDepth(rs.getInt("depth"));
			
			list.add(boardDto);
		}
		
		con.close();
		
		return list;
	}
	
	
	public List<BoardDto> selectProductqnaListByPaging(int p, int s) throws Exception {
		
		int end = p * s;
		int begin = end - ( s - 1 ); 
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("

									+ "select * from board_productqna "
									+ "connect by prior board_no = super_no "
									+ "start with super_no = 0 "
									+ "order siblings by group_no desc, board_no asc "
								+ ") TMP"
						+ ") where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();
		
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardHead(rs.getString("board_head"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardTime(rs.getDate("board_time"));
			boardDto.setBoardReadcount(rs.getInt("board_readcount"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			
			boardDto.setBoardReplycount(rs.getInt("board_replycount"));
			
			boardDto.setGroupNo(rs.getInt("group_no"));
			boardDto.setSuperNo(rs.getInt("super_no"));
			boardDto.setDepth(rs.getInt("depth"));
			
			list.add(boardDto);
		}
		
		con.close();
		
		return list;
	}
	
	public List<BoardDto> selectProductqnaListByPaging(int p, int s, String type, String keyword) throws Exception {
		
		int end = p * s;
		int begin = end - ( s - 1 ); 
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("

									+ "select * from board_productqna where instr(#1, ?) > 0 "
									+ "connect by prior board_no = super_no "
									+ "start with super_no = 0 "
									+ "order siblings by group_no desc, board_no asc "
								+ ") TMP"
						+ ") where rn between ? and ?";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		ResultSet rs = ps.executeQuery();
		
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardHead(rs.getString("board_head"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardTime(rs.getDate("board_time"));
			boardDto.setBoardReadcount(rs.getInt("board_readcount"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			
			boardDto.setBoardReplycount(rs.getInt("board_replycount"));
			
			boardDto.setGroupNo(rs.getInt("group_no"));
			boardDto.setSuperNo(rs.getInt("super_no"));
			boardDto.setDepth(rs.getInt("depth"));
			
			list.add(boardDto);
		}
		
		con.close();
		
		return list;
	}
	

	public List<BoardDto> selectReviewListByPaging(int p, int s) throws Exception {
		
		int end = p * s;
		int begin = end - ( s - 1 ); 
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("

									+ "select * from board_review "
									+ "connect by prior board_no = super_no "
									+ "start with super_no = 0 "
									+ "order siblings by group_no desc, board_no asc "
								+ ") TMP"
						+ ") where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();
		
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardHead(rs.getString("board_head"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardTime(rs.getDate("board_time"));
			boardDto.setBoardReadcount(rs.getInt("board_readcount"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			boardDto.setBoardProductNo(rs.getInt("board_product_no"));
			
			boardDto.setBoardReplycount(rs.getInt("board_replycount"));
			
			boardDto.setGroupNo(rs.getInt("group_no"));
			boardDto.setSuperNo(rs.getInt("super_no"));
			boardDto.setDepth(rs.getInt("depth"));
			
			list.add(boardDto);
		}
		
		con.close();
		
		return list;
	}
	
		public List<BoardDto> selectReviewListByPaging(int p, int s, String type, String keyword) throws Exception {
			
			int end = p * s;
			int begin = end - ( s - 1 ); 
			
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select * from ("
									+ "select rownum rn, TMP.* from ("

										+ "select * from board_review where instr(#1, ?) > 0 "
										+ "connect by prior board_no = super_no "
										+ "start with super_no = 0 "
										+ "order siblings by group_no desc, board_no asc "
									+ ") TMP"
							+ ") where rn between ? and ?";
			sql = sql.replace("#1", type);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, keyword);
			ps.setInt(2, begin);
			ps.setInt(3, end);
			ResultSet rs = ps.executeQuery();
			
			List<BoardDto> list = new ArrayList<>();
			while(rs.next()) {
				BoardDto boardDto = new BoardDto();
				
				boardDto.setBoardNo(rs.getInt("board_no"));
				boardDto.setBoardHead(rs.getString("board_head"));
				boardDto.setBoardTitle(rs.getString("board_title"));
				boardDto.setBoardTime(rs.getDate("board_time"));
				boardDto.setBoardReadcount(rs.getInt("board_readcount"));
				boardDto.setBoardWriter(rs.getString("board_writer"));
				boardDto.setBoardProductNo(rs.getInt("board_product_no"));
				
				boardDto.setBoardReplycount(rs.getInt("board_replycount"));
				
				boardDto.setGroupNo(rs.getInt("group_no"));
				boardDto.setSuperNo(rs.getInt("super_no"));
				boardDto.setDepth(rs.getInt("depth"));
				
				list.add(boardDto);
			}
			
			con.close();
			
			return list;
		}
		
		
		

	public List<BoardDto> selectTipListByPaging(int p, int s) throws Exception {
		
		int end = p * s;
		int begin = end - ( s - 1 ); 
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("

									+ "select * from board_tip "
									+ "connect by prior board_no = super_no "
									+ "start with super_no = 0 "
									+ "order siblings by group_no desc, board_no asc "
								+ ") TMP"
						+ ") where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();
		
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardHead(rs.getString("board_head"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardTime(rs.getDate("board_time"));
			boardDto.setBoardReadcount(rs.getInt("board_readcount"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			
			boardDto.setBoardReplycount(rs.getInt("board_replycount"));
			
			boardDto.setGroupNo(rs.getInt("group_no"));
			boardDto.setSuperNo(rs.getInt("super_no"));
			boardDto.setDepth(rs.getInt("depth"));
			
			list.add(boardDto);
		}
		
		con.close();
		
		return list;
	}
	
	public List<BoardDto> selectTipListByPaging(int p, int s, String type, String keyword) throws Exception {
		
		int end = p * s;
		int begin = end - ( s - 1 ); 
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("

									+ "select * from board_tip where instr(#1, ?) > 0 "
									+ "connect by prior board_no = super_no "
									+ "start with super_no = 0 "
									+ "order siblings by group_no desc, board_no asc "
								+ ") TMP"
						+ ") where rn between ? and ?";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		ResultSet rs = ps.executeQuery();
		
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardHead(rs.getString("board_head"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardTime(rs.getDate("board_time"));
			boardDto.setBoardReadcount(rs.getInt("board_readcount"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			
			boardDto.setBoardReplycount(rs.getInt("board_replycount"));
			
			boardDto.setGroupNo(rs.getInt("group_no"));
			boardDto.setSuperNo(rs.getInt("super_no"));
			boardDto.setDepth(rs.getInt("depth"));
			
			list.add(boardDto);
		}
		
		con.close();
		
		return list;
	}

	public List<BoardDto> selectFreeListByPaging(int p, int s) throws Exception {
		
		int end = p * s;
		int begin = end - ( s - 1 ); 
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("

									+ "select * from board_free "
									+ "connect by prior board_no = super_no "
									+ "start with super_no = 0 "
									+ "order siblings by group_no desc, board_no asc "
								+ ") TMP"
						+ ") where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();
		
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardHead(rs.getString("board_head"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardTime(rs.getDate("board_time"));
			boardDto.setBoardReadcount(rs.getInt("board_readcount"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			
			boardDto.setBoardReplycount(rs.getInt("board_replycount"));
			
			boardDto.setGroupNo(rs.getInt("group_no"));
			boardDto.setSuperNo(rs.getInt("super_no"));
			boardDto.setDepth(rs.getInt("depth"));
			
			list.add(boardDto);
		}
		
		con.close();
		
		return list;
	}
	
	public List<BoardDto> selectFreeListByPaging(int p, int s, String type, String keyword) throws Exception {
		
		int end = p * s;
		int begin = end - ( s - 1 ); 
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("

									+ "select * from board_free where instr(#1, ?) > 0 "
									+ "connect by prior board_no = super_no "
									+ "start with super_no = 0 "
									+ "order siblings by group_no desc, board_no asc "
								+ ") TMP"
						+ ") where rn between ? and ?";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		ResultSet rs = ps.executeQuery();
		
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardHead(rs.getString("board_head"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardTime(rs.getDate("board_time"));
			boardDto.setBoardReadcount(rs.getInt("board_readcount"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			
			boardDto.setBoardReplycount(rs.getInt("board_replycount"));
			
			boardDto.setGroupNo(rs.getInt("group_no"));
			boardDto.setSuperNo(rs.getInt("super_no"));
			boardDto.setDepth(rs.getInt("depth"));
			
			list.add(boardDto);
		}
		
		con.close();
		
		return list;
	}



	public int countByPaging_notice() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from board_notice";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	public int countByPaging_notice(String type, String keyword) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from board_notice where instr(#1, ?) > 0";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);		
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	public int countByPaging_free() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from board_free";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	public int countByPaging_free(String type, String keyword) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from board_free where instr(#1, ?) > 0";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);		
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	public int countByPaging_review() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from board_review";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	public int countByPaging_review(String type, String keyword) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from board_review where instr(#1, ?) > 0";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);		
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	public int countByPaging_tip() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from board_tip";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	public int countByPaging_tip(String type, String keyword) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from board_tip where instr(#1, ?) > 0";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);		
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	public int countByPaging_qna() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from board_qna";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	public int countByPaging_qna(String type, String keyword) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from board_qna where instr(#1, ?) > 0";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);		
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	public int countByPaging_productqna() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from board_qna";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	public int countByPaging_productqna(String type, String keyword) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from board_qna where instr(#1, ?) > 0";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);		
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	public int countByPaging() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from board";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	public int countByPaging(String type, String keyword) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from board where instr(#1, ?) > 0";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);		
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
}