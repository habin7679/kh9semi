package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ProductAttachmentDao {
	public void insert(ProductAttachmentDto productAttachmentDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into product_attachment(product_no, attachment_no) values(product_no_seq.nextval, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, productAttachmentDto.getProductNo());
		ps.setInt(2, productAttachmentDto.getAttachmentNo());
		ps.execute();
		
		con.close();
	}
	
}

