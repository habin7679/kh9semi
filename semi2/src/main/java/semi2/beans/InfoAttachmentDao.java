package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class InfoAttachmentDao {

	public void insert(InfoAttachmentDto infoAttachmentDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into info_attachment(product_no, attachment_no) values(?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, infoAttachmentDto.getProductNo());
		ps.setInt(2, infoAttachmentDto.getAttachmentNo());
		ps.execute();
		
		con.close();
	}
	public InfoAttachmentDto selectOne(int productNo) throws Exception {
        Connection con = JdbcUtils.getConnection();

        String sql = "select * from info_attachment where product_no = ?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, productNo);
        ResultSet rs = ps.executeQuery();

        InfoAttachmentDto infoAttachmentDto;
        if(rs.next()) {
           infoAttachmentDto = new InfoAttachmentDto();
            infoAttachmentDto.setProductNo(rs.getInt("product_no"));
            infoAttachmentDto.setAttachmentNo(rs.getInt("attachment_no"));

        }else {
            infoAttachmentDto = null;
        }

        con.close();

        return infoAttachmentDto;
    }
	
	public boolean delete(int attachmentNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete attachment where attachment_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, attachmentNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	
}