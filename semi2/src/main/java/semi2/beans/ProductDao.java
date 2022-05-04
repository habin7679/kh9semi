package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	//관리자 - 상품목록 조회
	public List<MemberDto> listAll() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * form product";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<ProductDto> list = new ArrayList<>();
		ProductDto productDto = new ProductDto();
		productDto.setProductNo(rs.getInt("product_no))";
		productDto.setProdctName(rs.getInt("product_name))";
		productDto.setProdctSort(rs.getInt("product_sort))";
		productDto.setProdctPrice(rs.getInt("product_price))";
		productDto.setProdctStock(rs.getInt("product_stock))";
		productDto.setProdctCompany(rs.getInt("product_company))";
		productDto.setProdctMadeString(rs.getInt("product_made_string))";
		productDto.setProdctExpireString(rs.getInt("product_expire_string))";
		productDto.setProdctEvent(rs.getInt("product_event))";
		productDto.setProdctKcal(rs.getInt("product_kcal))";
		productDto.setProdctProtein(rs.getInt("product_protein))";
		productDto.setProdctCarbohydrate(rs.getInt("product_carbohydrate))";
		productDto.setProdctFat(rs.getInt("product_fat))";
		productDto.setProdctInfo(rs.getInt("product_info))";
		productDto.setProdctImg(rs.getInt("product_img))";
		
		list.add(MemberDto);
	}	
		con.close();
		return list;
}
	
	}

