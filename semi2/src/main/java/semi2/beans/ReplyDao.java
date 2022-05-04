package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReplyDao {

	public void insert(ReplyDto replyDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into reply(reply_no, reply_writer, reply_target, reply_content) "
							+ "values(reply_seq.nextval, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, replyDto.getReplyWriter());
		ps.setInt(2, replyDto.getReplyTarget());
		ps.setString(3, replyDto.getReplyContent());
		ps.execute();
		
		con.close();
	}
	
//	(주의) 댓글은 전체목록을 만들 이유가 없다
//	1. 해당 글에 대한 댓글 목록
//	2. 특정 검색어에 대한 댓글 목록
//	= 댓글 정렬은 작성순, 등록순으로 한다.
	public List<ReplyDto> selectList(int replyTarget) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from reply where reply_target = ? order by reply_no asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, replyTarget);
		ResultSet rs = ps.executeQuery();
		
		List<ReplyDto> list = new ArrayList<>();
		
		while(rs.next()) {
			ReplyDto replyDto = new ReplyDto();
			
			replyDto.setReplyNo(rs.getInt("reply_no"));
			replyDto.setReplyWriter(rs.getString("reply_writer"));
			replyDto.setReplyContent(rs.getString("reply_content"));
			replyDto.setReplyTime(rs.getDate("reply_time"));
			replyDto.setReplyTarget(rs.getInt("reply_target"));

			list.add(replyDto);
		}
		
		con.close();
		
		return list;
	}

	public List<ReplyDto> selectList(String type, String keyword) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from reply where instr(#1, ?) > 0 order by reply_no asc";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		List<ReplyDto> list = new ArrayList<>();
		
		while(rs.next()) {
			ReplyDto replyDto = new ReplyDto();
			
			replyDto.setReplyNo(rs.getInt("reply_no"));
			replyDto.setReplyWriter(rs.getString("reply_writer"));
			replyDto.setReplyContent(rs.getString("reply_content"));
			replyDto.setReplyTime(rs.getDate("reply_time"));
			replyDto.setReplyTarget(rs.getInt("reply_target"));

			list.add(replyDto);
		}
		
		con.close();
		
		return list;
	}
	
//	댓글 삭제
	public boolean delete(int replyNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete reply where reply_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, replyNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	
//	댓글 수정
	public boolean update(ReplyDto replyDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update reply set reply_content = ? where reply_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, replyDto.getReplyContent());
		ps.setInt(2, replyDto.getReplyNo());
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}

	public ReplyDto selectOne(int replyNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from reply where reply_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, replyNo);
		ResultSet rs = ps.executeQuery();
		
		ReplyDto replyDto;
		if(rs.next()) {
			replyDto = new ReplyDto();

			replyDto.setReplyNo(rs.getInt("reply_no"));
			replyDto.setReplyWriter(rs.getString("reply_writer"));
			replyDto.setReplyContent(rs.getString("reply_content"));
			replyDto.setReplyTime(rs.getDate("reply_time"));
			replyDto.setReplyTarget(rs.getInt("reply_target"));
		}
		else {
			replyDto = null;
		}
		
		con.close();
		return replyDto;
	}
	
}