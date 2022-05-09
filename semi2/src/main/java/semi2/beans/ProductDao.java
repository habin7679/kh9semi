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
	
	//상품목록
    public List<ProductDto> listAll() throws Exception {
        Connection con = JdbcUtils.getConnection();

        String sql = "select * from product";
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
        productDto.setProductMade(rs.getDate("product_made"));
        productDto.setProductExpire(rs.getDate("product_expire"));
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
    //상품-사용자검색
    public List<ProductDto> listUser(String productName) throws Exception {
        Connection con = JdbcUtils.getConnection();

        String sql = "select * from product where instr(product_name, ?) > 0 order by product_name asc";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, productName);
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
        productDto.setProductMade(rs.getDate("product_made"));
        productDto.setProductExpire(rs.getDate("product_expire"));
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

        String sql = "select * from product where product_no=?";
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
            productDto.setProductMade(rs.getDate("product_made"));
            productDto.setProductExpire(rs.getDate("product_expire"));
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
    
    //상품 정보 수정
    public boolean edit(ProductDto productDto) throws Exception {
    	Connection con = JdbcUtils.getConnection();
    	
    	String sql = "update product set product_name = ?, product_sort = ?, product_price = ?, "
    			+ "product_stock = ?, product_company = ?, product_made = ?, product_expire = ?, "
    			+ "product_event = ?, product_kcal = ?, product_protein = ?, product_carbohydrate = ?, "
    			+ "product_fat = ?, product_info = ?, product_img = ? where product_no = ?";
    	
    	PreparedStatement ps = con.prepareStatement(sql);
    	ps.setString(1, productDto.getProductName());
    	ps.setString(2, productDto.getProductSort());
    	ps.setInt(3, productDto.getProductPrice());
    	ps.setInt(4, productDto.getProductStock());
    	ps.setString(5, productDto.getProductCompany());
    	ps.setDate(6, productDto.getProductMade());
    	ps.setDate(7, productDto.getProductExpire());
    	ps.setString(8, productDto.getProductEvent());
    	ps.setInt(9, productDto.getProductKcal());
    	ps.setInt(10, productDto.getProductProtein());
    	ps.setInt(11, productDto.getProductCarbohydrate());
    	ps.setInt(12, productDto.getProductFat());
    	ps.setString(13, productDto.getProductInfo());
    	ps.setString(14, productDto.getProductImg());
    	ps.setInt(15, productDto.getProductNo());
    	
    	int count = ps.executeUpdate();
    	con.close();
    	
    	return count > 0;	
    }
    
    //상품 관리자 검색
    public List<ProductDto> selectList(String type, String keyword) throws Exception {
    	Connection con = JdbcUtils.getConnection();
    	
    	String sql = "select * from product where instr(#1, ?) > 0 order by #1 asc";
    	sql = sql.replace("#1", type);
    	
    	PreparedStatement ps = con.prepareStatement(sql);
    	ps.setString(1, keyword);
    	ResultSet rs = ps.executeQuery();
    	
    	List<ProductDto> list = new ArrayList<>();
    	
    	while (rs.next()) {
			ProductDto productDto = new ProductDto();
			productDto.setProductNo(rs.getInt("product_no"));
			productDto.setProductName(rs.getString("product_name"));
			productDto.setProductSort(rs.getString("product_sort"));
			productDto.setProductPrice(rs.getInt("product_price"));
			productDto.setProductStock(rs.getInt("product_stock"));
			productDto.setProductCompany(rs.getString("product_company"));
			productDto.setProductMade(rs.getDate("product_made"));
			productDto.setProductExpire(rs.getDate("product_expire"));
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
    //상품 카테고리
    public ProductDto katgorie(String productSort) throws Exception {
        Connection con = JdbcUtils.getConnection();

        String sql = "select * from product where product_sort=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, productSort);
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
            productDto.setProductMade(rs.getDate("product_made"));
            productDto.setProductExpire(rs.getDate("product_expire"));
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
    //재고
    public boolean stockMinus(int productNo, int orderAmount) throws Exception{
        Connection con = JdbcUtils.getConnection();
        String sql = "update product set product_stock = product_stock - ? where product_no=?";
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, orderAmount);
        ps.setInt(2, productNo);

        int count = ps.executeUpdate();

        con.close();
        return count>0;
    }
    public boolean stockPlus(int productNo, int orderAmount) throws Exception{
        Connection con = JdbcUtils.getConnection();
        String sql = "update product set product_stock = product_stock + ? where product_no=?";
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, orderAmount);
        ps.setInt(2, productNo);

        int count = ps.executeUpdate();

        con.close();
        return count>0;
    }
    
    public boolean stockCheck(int productNo, int orderAmount) throws Exception{
        Connection con = JdbcUtils.getConnection();

        String sql = "select product_stock from product where product_no=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, productNo);

        ResultSet rs = ps.executeQuery();
        int stock = 0;
        if(rs.next()) {
            stock = rs.getInt("product_stock");
        }
        con.close();

        return stock >= orderAmount;
    }
    
    //삭제
	public boolean delete(int no) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete product where product_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
    
}