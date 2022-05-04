package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ProductDao {
	public void add(ProductDto productDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into product("
				+"product_no, product_name,product_sort,product_price,"
				+ "product_stock,product_company, product_made,product_expire,"
				+ "product_event,product_kcal,product_protein,product_carbohydrate,"
				+ "product_fat,product_info,product_img"
				+ ") values("
				+"product_no_seq.nextval,?,?,?,?,? to_date(?,'YYYY-MM-DD'), to_date(?,'YYYY-DD-MM')"
				+"?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, productDto.getProduct_no());
		ps.setString(2, productDto.getProduct_name());
		ps.setString(3, productDto.getProduct_sort());
		ps.setInt(4,productDto.getProduct_price());
		ps.setInt(5, productDto.getProduct_stock());
		ps.setString(6, productDto.getProduct_company());
		ps.setString(7, productDto.getProduct_madeString());
		ps.setString(8,productDto.getProduct_expireString());
		ps.setString(9, productDto.getProduct_event());
		ps.setInt(10, productDto.getProduct_kcal());
		ps.setInt(11, productDto.getProduct_protein());
		ps.setInt(12, productDto.getProduct_carbohydrate());
		ps.setInt(13, productDto.getProduct_fat());
		ps.setString(14, productDto.getProduct_info());
		ps.setString(15, productDto.getProduct_img());
		ps.execute();
		
		con.close();			
		}
}

