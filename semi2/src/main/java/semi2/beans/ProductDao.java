package semi2.beans;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import semi2.beans.ProductDto;


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
				+"?,?,?,?,?,?,to_date(?,'YYYY-MM-DD'), to_date(?,'YYYY-MM-DD'),"
				+"?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, productDto.getProductNo());
		ps.setString(2, productDto.getProductName());
		ps.setString(3, productDto.getProductSort());
		ps.setInt(4,productDto.getProductPrice());
		ps.setInt(5, productDto.getProductStock());
		ps.setString(6, productDto.getProductCompany());
		ps.setDate(7, productDto.getProductMade());
		ps.setDate(8,productDto.getProductExpire());
		ps.setString(9, productDto.getProductEvent());
		ps.setInt(10, productDto.getProductKcal());
		ps.setInt(11, productDto.getProductProtein());
		ps.setInt(12, productDto.getProductCarbohydrate());
		ps.setInt(13, productDto.getProductFat());
		ps.setString(14, productDto.getProductInfo());
		//ps.setString(15, productDto.getProductImg());
		ps.execute();
		
		con.close();			
		}
	public int getSequence() throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql = "select product_no_seq.nextval from dual";

		PreparedStatement ps = con.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();
		rs.next();	//데이터가 1개니까 이동을 지시

		int no = rs.getInt("nextval");

		con.close();

		return no;
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
       //productDto.setProductImg(rs.getString("product_img"));

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
       // productDto.setProductImg(rs.getString("product_img"));
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
           // productDto.setProductImg(rs.getString("product_img"));
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
    public List<ProductDto> categorie(String productSort) throws Exception {
        Connection con = JdbcUtils.getConnection();

        String sql = "select * from product where product_sort=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, productSort);
        ResultSet rs = ps.executeQuery();
        ProductDto productDto = null;
        
        List<ProductDto> list  = new ArrayList<>();

        while(rs.next()) {
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
            
            list.add(productDto);
        }
        con.close();
    
        return list;
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
	
        public ProductDto selectOneCart(int productNo) throws Exception {
        	Connection con = JdbcUtils.getConnection();

        	String sql = "select * from product where product_no=?";
        	PreparedStatement ps = con.prepareStatement(sql);
        	ps.setInt(1, productNo);
        	ResultSet rs = ps.executeQuery();
        	ProductDto productDto = new ProductDto();

        	if(rs.next()) {
            		productDto.setProductName(rs.getString("product_name"));
            		productDto.setProductPrice(rs.getInt("product_price"));
        	}
        	con.close();
        	return productDto;
    }

        
      //페이징이 구현된 상품 목록 - 관리자
    	public List<ProductDto> listByPagingForAdmin(int p, int s) throws Exception{
    		int end = p * s;
    		int begin = end - (s-1);

    		Connection con = JdbcUtils.getConnection();

    		String sql = "select * from ("
    				+ "select rownum rn, TMP.* from ("
    			       + "select * from product order by product_no desc"
    			        + ") TMP"
    			+ ")where rn between ? and ?";
    		PreparedStatement ps = con.prepareStatement(sql);
    		ps.setInt(1, begin);
    		ps.setInt(2, end);
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
    	

    	//페이징이 구현된 주문 검색 - 관리자
    	public List<ProductDto> selectListByPagingForAdmin(int p, int s, String type, String keyword) throws Exception{
    		int end = p * s;
    		int begin = end - (s-1);

    		Connection con = JdbcUtils.getConnection();

    		String sql = "select * from ("
    				+ "select rownum rn, TMP.* from ("
    			       + "select * from product where instr(#1,?) > 0 order by product_no desc"
    			        + ") TMP"
    			+ ")where rn between ? and ?";

    		sql = sql.replace("#1", type);
    		PreparedStatement ps = con.prepareStatement(sql);
    		ps.setString(1, keyword);
    		ps.setInt(2, begin);
    		ps.setInt(3, end);
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

    	//페이징이 구현된 상품 목록 - 회원(신상품순)
    	public List<ProductDto> listSortLast(int p, int s) throws Exception{
    		int end = p * s;
    		int begin = end - (s-1);

    		Connection con = JdbcUtils.getConnection();

    		String sql = "select * from ("
    				+ "select rownum rn, TMP.* from ("
    			       + "select * from product order by product_no desc"
    			        + ") TMP"
    			+ ")where rn between ? and ?";
    		PreparedStatement ps = con.prepareStatement(sql);
    		ps.setInt(1, begin);
    		ps.setInt(2, end);
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
    	
    	//페이징이 구현된 상품 목록 - 회원(낮은가격순)
    	public List<ProductDto> listSortLowPrice(int p, int s) throws Exception{
    		int end = p * s;
    		int begin = end - (s-1);

    		Connection con = JdbcUtils.getConnection();

    		String sql = "select * from ("
    				+ "select rownum rn, TMP.* from ("
    			       + "select * from product order by product_price asc"
    			        + ") TMP"
    			+ ")where rn between ? and ?";
    		PreparedStatement ps = con.prepareStatement(sql);
    		ps.setInt(1, begin);
    		ps.setInt(2, end);
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

    	//페이징이 구현된 상품 목록 - 회원(높은가격순)
    	public List<ProductDto> listSortHighPrice(int p, int s) throws Exception{
    		int end = p * s;
    		int begin = end - (s-1);

    		Connection con = JdbcUtils.getConnection();

    		String sql = "select * from ("
    				+ "select rownum rn, TMP.* from ("
    			       + "select * from product order by product_price desc"
    			        + ") TMP"
    			+ ")where rn between ? and ?";
    		PreparedStatement ps = con.prepareStatement(sql);
    		ps.setInt(1, begin);
    		ps.setInt(2, end);
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
    	//페이징이 구현된 주문 검색 - 회원
    	public List<ProductDto> selectListByPaging(int p, int s, String type, String keyword) throws Exception{
    		int end = p * s;
    		int begin = end - (s-1);

    		Connection con = JdbcUtils.getConnection();

    		String sql = "select * from ("
    				+ "select rownum rn, TMP.* from ("
    			       + "select * from product where instr(#1,?) > 0 order by product_no desc"
    			        + ") TMP"
    			+ ")where rn between ? and ?";

    		sql = sql.replace("#1", type);
    		PreparedStatement ps = con.prepareStatement(sql);
    		ps.setString(1, keyword);
    		ps.setInt(2, begin);
    		ps.setInt(3, end);
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
    	
    	// 주문목록 페이지 번호 계산
    	public int countByPaging() throws Exception {
    		Connection con = JdbcUtils.getConnection();
    		String sql = "select count(*) from product";
    		PreparedStatement ps = con.prepareStatement(sql);
    		ResultSet rs = ps.executeQuery();
    		rs.next();
    		int count = rs.getInt(1);

    		con.close();
    		return count;
    	}

    	// 주문검색 페이지 번호 계산
    	public int countByPaging(String type, String keyword) throws Exception {
    		Connection con = JdbcUtils.getConnection();
    		String sql = "select count(*) from product where instr(#1,?) > 0";
    		sql = sql.replace("#1", type);
    		PreparedStatement ps = con.prepareStatement(sql);
    		ps.setString(1, keyword);

    		ResultSet rs = ps.executeQuery();
    		rs.next();
    		int count = rs.getInt(1);

    		con.close();
    		return count;
    	}
    	public int bNoExtraction(int orderNo) throws Exception{
    		Connection con = JdbcUtils.getConnection();
    		
    		String sql = "select * from buy where order_no=?";
    		
    		PreparedStatement ps = con.prepareStatement(sql);
    		
    		ps.setInt(1, orderNo);
    		
    		ResultSet rs = ps.executeQuery();
    		
    		int extraction = 0;
    		if(rs.next()) {
    			extraction = rs.getInt("buy_no");
    		}
    		con.close();
    		return extraction;
    	}
}
}