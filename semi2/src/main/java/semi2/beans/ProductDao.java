package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
		ps.setInt(1, productDto.getProductNo());
		ps.setString(2, productDto.getProductName());
		ps.setString(3, productDto.getProductSort());
		ps.setInt(4,productDto.getProductPrice());
		ps.setInt(5, productDto.getProductStock());
		ps.setString(6, productDto.getProductCompany());
		ps.setString(7, productDto.getProductMadeString());
		ps.setString(8,productDto.getProductExpireString());
		ps.setString(9, productDto.getProductEvent());
		ps.setInt(10, productDto.getProductKcal());
		ps.setInt(11, productDto.getProductProtein());
		ps.setInt(12, productDto.getProductCarbohydrate());
		ps.setInt(13, productDto.getProductFat());
		ps.setString(14, productDto.getProductInfo());
		ps.setString(15, productDto.getProductImg());
		ps.execute();
		
		con.close();			
		}
	
	}

