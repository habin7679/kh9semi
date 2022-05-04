package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
	//상품 등록
	public void add(ProductDto productDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into product("
				+"product_no, product_name,product_sort,product_price,"
				+ "product_stock,product_company, product_made,product_expire,"
				+ "product_event,product_kcal,product_protein,product_carbohydrate,"
				+ "product_fat,product_info"
				+ ") values("
				+"product_no_seq.nextval,?,?,?,?,?,to_date(?,'YYYY-MM-DD'), to_date(?,'YYYY-MM-DD'),"
				+"?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		//ps.setInt(1, productDto.getProductNo());
		ps.setString(1, productDto.getProductName());
		ps.setString(2, productDto.getProductSort());
		ps.setInt(3,productDto.getProductPrice());
		ps.setInt(4, productDto.getProductStock());
		ps.setString(5, productDto.getProductCompany());
		ps.setDate(6, productDto.getProductMade());
		ps.setDate(7,productDto.getProductExpire());
		ps.setString(8, productDto.getProductEvent());
		ps.setInt(9, productDto.getProductKcal());
		ps.setInt(10, productDto.getProductProtein());
		ps.setInt(11, productDto.getProductCarbohydrate());
		ps.setInt(12, productDto.getProductFat());
		ps.setString(13, productDto.getProductInfo());
		//ps.setString(14, productDto.getProductImg());
		ps.execute();
		
		con.close();			
		}
	//관리자 - 상품목록 조회

    public List<ProductDto> listAll() throws Exception {
        Connection con = JdbcUtils.getConnection();

        String sql = "select * form product";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        List<ProductDto> list = new ArrayList<>();

        while(rs.next()) {
        ProductDto productDto = new ProductDto();
        productDto.setProductNo(rs.getInt("product_no"));
        productDto.setProductName(rs.getString("product_name"));
        productDto.setProductSort(rs.getString("product_sort"));
        productDto.setProductPrice(rs.getInt("product_price"));
        productDto.setProductStock(rs.getInt("product_stock"));
        productDto.setProductCompany(rs.getString("product_company"));
        productDto.setProductMadeString(rs.getString("product_made_string"));
        productDto.setProductExpireString(rs.getString("product_expire_string"));
        productDto.setProductEvent(rs.getString("product_event"));
        productDto.setProductKcal(rs.getInt("product_kcal"));
        productDto.setProductProtein(rs.getInt("product_protein"));
        productDto.setProductCarbohydrate(rs.getInt("product_carbohydrate"));
        productDto.setProductFat(rs.getInt("product_fat"));
        productDto.setProductInfo(rs.getString("product_info"));
        productDto.setProductImg(rs.getString("product_img"));

        list.add(productDto);
    }
        con.close();
        return list;
   }
    //단일조회
    public ProductDto selectOne(int productNo) throws Exception {
        Connection con = JdbcUtils.getConnection();

        String sql = "select * form product where product_no=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, productNo);
        ResultSet rs = ps.executeQuery();
        ProductDto productDto = null;

        if(rs.next()) {
            productDto = new ProductDto();
            productDto.setProductNo(rs.getInt("product_no"));
            productDto.setProductName(rs.getString("product_name"));
            productDto.setProductSort(rs.getString("product_sort"));
            productDto.setProductPrice(rs.getInt("product_price"));
            productDto.setProductStock(rs.getInt("product_stock"));
            productDto.setProductCompany(rs.getString("product_company"));
            productDto.setProductMadeString(rs.getString("product_made_string"));
            productDto.setProductExpireString(rs.getString("product_expire_string"));
            productDto.setProductEvent(rs.getString("product_event"));
            productDto.setProductKcal(rs.getInt("product_kcal"));
            productDto.setProductProtein(rs.getInt("product_protein"));
            productDto.setProductCarbohydrate(rs.getInt("product_carbohydrate"));
            productDto.setProductFat(rs.getInt("product_fat"));
            productDto.setProductInfo(rs.getString("product_info"));
            productDto.setProductImg(rs.getString("product_img"));
        }
        con.close();
        return productDto;
    }
}
