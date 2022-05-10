package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//DAO : 영속성(Persistant) 항목을 접근하는 객체. 영원히 변하지 않는 것들을 관리(DB, File)
public class AttachmentDao {
	
	//저장 위치를 지정
	public static final String path = System.getProperty("user.home") + "/git/kh9semi/semi2/src/main/webapp/image";
	
	//등록 : 번호 생성 + 등록
	public int getSequence() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select attachment_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int number = rs.getInt("nextval");//rs.getInt(1);
		
		con.close();
		
		return number;
	}
	
	public void insert(AttachmentDto attachmentDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into attachment("
								+ "attachment_no, attachment_uploadname, attachment_savename, "
								+ "attachment_type, attachment_size"
							+ ") values(?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, attachmentDto.getAttachmentNo());
		ps.setString(2, attachmentDto.getAttachmentUploadname());
		ps.setString(3, attachmentDto.getAttachmentSavename());
		ps.setString(4, attachmentDto.getAttachmentType());
		ps.setLong(5, attachmentDto.getAttachmentSize());
		ps.execute();
		
		con.close();
	}
	
	public AttachmentDto selectOne(int attachmentNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from attachment where attachment_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, attachmentNo);
		ResultSet rs = ps.executeQuery();
		
		AttachmentDto attachmentDto = null;
		if(rs.next()) {
			attachmentDto = new AttachmentDto();
			
			attachmentDto.setAttachmentNo(rs.getInt("attachment_no"));
			attachmentDto.setAttachmentUploadname(rs.getString("attachment_uploadname"));
			attachmentDto.setAttachmentSavename(rs.getString("attachment_savename"));
			attachmentDto.setAttachmentType(rs.getString("attachment_type"));
			attachmentDto.setAttachmentSize(rs.getLong("attachment_size"));
		}
		
		con.close();
		
		return attachmentDto;
	}
	
}