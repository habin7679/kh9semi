package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ProductAttachmentDao {
	public void insert(ProductAttachmentDto productAttachmentDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into product_attachment(product_no, attachment_no) values(?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, productAttachmentDto.getProductNo());
		ps.setInt(2, productAttachmentDto.getAttachmentNo());
		ps.execute();
		
		con.close();
	}
	public ProductAttachmentDto selectOne(int productNo) throws Exception {
        Connection con = JdbcUtils.getConnection();

        String sql = "select * from product_attachment where product_no = ?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, productNo);
        ResultSet rs = ps.executeQuery();

        ProductAttachmentDto productAttachmentDto;
        if(rs.next()) {
            productAttachmentDto = new ProductAttachmentDto();
            productAttachmentDto.setProductNo(rs.getInt("product_no"));
            productAttachmentDto.setAttachmentNo(rs.getInt("attachment_no"));

        }else {
            productAttachmentDto = null;
        }

        con.close();

        return productAttachmentDto;
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
	

