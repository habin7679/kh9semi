package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BoardAttachmentDao {

	public void insert(BoardAttachmentDto boardAttachmentDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into board_attachment(board_no, attachment_no) values(?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardAttachmentDto.getBoardNo());
		ps.setInt(2, boardAttachmentDto.getAttachmentNo());
		ps.execute();
		
		con.close();
	}
	
	public BoardAttachmentDto selectOne(int boardNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from board_attachment where board_no = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardNo);
		ResultSet rs = ps.executeQuery();
		
		BoardAttachmentDto boardAttachmentDto;
		if(rs.next()) {
			boardAttachmentDto = new BoardAttachmentDto();
			boardAttachmentDto.setBoardNo(rs.getInt("board_no"));
			boardAttachmentDto.setAttachmentNo(rs.getInt("attachment_no"));
		
		}else {
			boardAttachmentDto = null;
		}
		
		con.close();
		
		return boardAttachmentDto;
	}
	
	public boolean delete(int AttachmentNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete attachment where attachment_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, AttachmentNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	
	public boolean update(BoardAttachmentDto boardAttachmentDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update board_attachment "
								+ "set attachment_no = ? "
								+ "where board_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardAttachmentDto.getAttachmentNo());
		ps.setInt(2, boardAttachmentDto.getBoardNo());
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
}
