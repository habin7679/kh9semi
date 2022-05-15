package semi2.beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PayingDao {
	public int getSequence() throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql = "select order_no_seq.nextval from dual";

		PreparedStatement ps = con.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();
		rs.next();	//데이터가 1개니까 이동을 지시

		int no = rs.getInt("nextval");

		con.close();

		return no;
	}
	
	public void insertNo(String memberId, int no) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into paying(order_no, member_id) values(?, ?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		ps.setString(2, memberId);
		
		ps.execute();
		con.close();
	}
	public boolean delete(PayingDto payingDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete paying where order_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, payingDto.getOrderNo());
		
		int count = ps.executeUpdate();
		
		con.close();
		return count>0;
	}
	public int totalPrice(int orderNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select sum(order_price) from orderp where order_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, orderNo);
		
		ResultSet rs = ps.executeQuery();
		int totalPrice = 0;
		if(rs.next()) {
			totalPrice = rs.getInt("sum(order_price)");
		}
		con.close();
		return totalPrice;
	}
	public boolean insertRest(PayingDto payingDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update paying set paying_total=?, paying_date=sysdate, paying_name=?, paying_phone=?, "
				+ "paying_post=?, paying_basic_address=?, paying_detail_address=?, paying_delivery_fee=?, paying_delivery_date=to_date(?, 'mm-dd hh24:mi'), "
				+ "paying_delivery_time=?, paying_payway=? where order_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, payingDto.getPayingTotal());
		ps.setString(2, payingDto.getPayingName());
		ps.setString(3, payingDto.getPayingPhone());
		ps.setInt(4, payingDto.getPayingPost());
		ps.setString(5, payingDto.getPayingBasicAddress());
		ps.setString(6, payingDto.getPayingDetailAddress());
		ps.setInt(7, payingDto.getPayingDeliveryFee());
		ps.setDate(8, payingDto.getPayingDeliveryDate());
		ps.setInt(9, payingDto.getPayingDeliveryTime());
		ps.setString(10, payingDto.getPayingPayway());
		ps.setInt(11, payingDto.getOrderNo());
		
		int count = ps.executeUpdate();
		con.close();
		return count>0;
	}
	public boolean insertRest2(PayingDto payingDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update paying set paying_total=?, paying_date=sysdate, paying_name=?, paying_phone=?, "
				+ "paying_post=?, paying_basic_address=?, paying_detail_address=?, paying_delivery_date=?, "
				+ "paying_delivery_time=?, paying_delivery_fee=? where order_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, payingDto.getPayingTotal());
		ps.setString(2, payingDto.getPayingName());
		ps.setString(3, payingDto.getPayingPhone());
		ps.setInt(4, payingDto.getPayingPost());
		ps.setString(5, payingDto.getPayingBasicAddress());
		ps.setString(6, payingDto.getPayingDetailAddress());
		ps.setDate(7, payingDto.getPayingDeliveryDate());
		ps.setInt(8, payingDto.getPayingDeliveryTime());
		ps.setInt(9, payingDto.getPayingDeliveryFee());
		ps.setInt(10, payingDto.getOrderNo());
		
		int count = ps.executeUpdate();
		con.close();
		return count>0;
	}
	public Date payingDate(int orderNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select paying_date from paying where order_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, orderNo);
		
		ResultSet rs = ps.executeQuery();
		
		Date date = null;
		if(rs.next()) {
			date = rs.getDate("paying_date");
		}
		con.close();
		return date;
	}
	public PayingDto selectOne(int orderNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from paying where order_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, orderNo);
		
		ResultSet rs = ps.executeQuery();
		
		PayingDto pDto = new PayingDto();
		if(rs.next()) {
			pDto.setPayingDate(rs.getString("paying_date"));
			pDto.setPayingName(rs.getString("paying_name"));
			pDto.setPayingPhone(rs.getString("paying_phone"));
			pDto.setPayingPost(rs.getInt("paying_post"));
			pDto.setPayingBasicAddress(rs.getString("paying_basic_address"));
			pDto.setPayingDetailAddress(rs.getString("paying_detail_address"));
			pDto.setPayingDeliveryDate(rs.getDate("paying_delivery_date"));
			pDto.setPayingDeliveryTime(rs.getInt("paying_delivery_time"));
			pDto.setPayingDeliveryFee(rs.getInt("paying_delivery_fee"));
			pDto.setPayingTotal(rs.getInt("paying_total"));
		}
		con.close();
		return pDto;
	}
	public PayingDto selectOneDate(int orderNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from paying where order_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, orderNo);
		
		ResultSet rs = ps.executeQuery();
		
		PayingDto pDto = new PayingDto();
		if(rs.next()) {
			pDto.setPayingDate(rs.getString("paying_date"));
		}
		con.close();
		return pDto;
	}
	//관리자 - 주문내역 조회
	public List<PayingDto> listAll() throws Exception {
		Connection con= JdbcUtils.getConnection();
			
		String sql = "select * from paying order by order_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
			
		List<PayingDto> list = new ArrayList<>();
			
		while(rs.next()) {
			PayingDto payingDto = new PayingDto();
			payingDto.setOrderNo(rs.getInt("order_no"));
			payingDto.setMemberId(rs.getString("member_id"));
			payingDto.setPayingTotal(rs.getInt("paying_total"));
			payingDto.setPayingDate(rs.getString("paying_date"));
			payingDto.setPayingName(rs.getString("paying_name"));
			payingDto.setPayingPhone(rs.getString("paying_phone"));
			payingDto.setPayingPost(rs.getInt("paying_post"));
			payingDto.setPayingBasicAddress(rs.getString("paying_basic_address"));
			payingDto.setPayingDetailAddress(rs.getString("paying_detail_address"));
			payingDto.setPayingDeliveryFee(rs.getInt("paying_delivery_fee"));
			payingDto.setPayingDeliveryDate(rs.getDate("paying_delivery_date"));
			payingDto.setPayingPayway(rs.getString("paying_payway"));
			payingDto.setPayingDeliveryTime(rs.getInt("paying_delivery_time"));
			
			list.add(payingDto);
			}
			con.close();
			return list;
		}
	
	//관리자 - 주문내역 검색
	public List<PayingDto> selectList(String type, String keyword) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from paying where instr(#1, ?) > 0 order by order_no desc";
		sql = sql.replace("#1", type);
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		List<PayingDto> list = new ArrayList<>();
		
		while(rs.next()) {
			PayingDto payingDto = new PayingDto();
			payingDto.setOrderNo(rs.getInt("order_no"));
			payingDto.setMemberId(rs.getString("member_id"));
			payingDto.setPayingTotal(rs.getInt("paying_total"));
			payingDto.setPayingDate(rs.getString("paying_date"));
			payingDto.setPayingName(rs.getString("paying_name"));
			payingDto.setPayingPhone(rs.getString("paying_phone"));
			payingDto.setPayingPost(rs.getInt("paying_post"));
			payingDto.setPayingBasicAddress(rs.getString("paying_basic_address"));
			payingDto.setPayingDetailAddress(rs.getString("paying_detail_address"));
			payingDto.setPayingDeliveryFee(rs.getInt("paying_delivery_fee"));
			payingDto.setPayingDeliveryDate(rs.getDate("paying_delivery_date"));
			payingDto.setPayingPayway(rs.getString("paying_payway"));
			payingDto.setPayingDeliveryTime(rs.getInt("paying_delivery_time"));
			
			list.add(payingDto);
		}
		con.close();
		
		return list;
	}
	//페이징이 구현된 주문 목록
		public List<PayingDto> listAllByPaging(int p, int s) throws Exception{
			int end = p * s;
			int begin = end - (s-1);
			
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select * from ("
					+ "select rownum rn, TMP.* from ("
				       + "select * from paying order by order_no desc"
				        + ") TMP"
				+ ")where rn between ? and ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, begin);
			ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();
			
			List<PayingDto> list = new ArrayList<>();
			
			while(rs.next()) {
				PayingDto payingDto = new PayingDto();
				payingDto.setOrderNo(rs.getInt("order_no"));
				payingDto.setMemberId(rs.getString("member_id"));
				payingDto.setPayingTotal(rs.getInt("paying_total"));
				payingDto.setPayingDate(rs.getString("paying_date"));
				payingDto.setPayingName(rs.getString("paying_name"));
				payingDto.setPayingPhone(rs.getString("paying_phone"));
				payingDto.setPayingPost(rs.getInt("paying_post"));
				payingDto.setPayingBasicAddress(rs.getString("paying_basic_address"));
				payingDto.setPayingDetailAddress(rs.getString("paying_detail_address"));
				payingDto.setPayingDeliveryFee(rs.getInt("paying_delivery_fee"));
				payingDto.setPayingDeliveryDate(rs.getDate("paying_delivery_date"));
				payingDto.setPayingPayway(rs.getString("paying_payway"));
				payingDto.setPayingDeliveryTime(rs.getInt("paying_delivery_time"));
				
				list.add(payingDto);
				}
				con.close();
				return list;
		}
		
		
		//페이징이 구현된 주문 검색
		public List<PayingDto> selectListByPaging(int p, int s, String type, String keyword) throws Exception{
			int end = p * s;
			int begin = end - (s-1);
			
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select * from ("
					+ "select rownum rn, TMP.* from ("
				       + "select * from paying where instr(#1,?) > 0 order by order_no desc"
				        + ") TMP"
				+ ")where rn between ? and ?";
			
			sql = sql.replace("#1", type);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, keyword);
			ps.setInt(2, begin);
			ps.setInt(3, end);
			ResultSet rs = ps.executeQuery();
			
			List<PayingDto> list = new ArrayList<>();
			
			while(rs.next()) {
				PayingDto payingDto = new PayingDto();
				payingDto.setOrderNo(rs.getInt("order_no"));
				payingDto.setMemberId(rs.getString("member_id"));
				payingDto.setPayingTotal(rs.getInt("paying_total"));
				payingDto.setPayingDate(rs.getString("paying_date"));
				payingDto.setPayingName(rs.getString("paying_name"));
				payingDto.setPayingPhone(rs.getString("paying_phone"));
				payingDto.setPayingPost(rs.getInt("paying_post"));
				payingDto.setPayingBasicAddress(rs.getString("paying_basic_address"));
				payingDto.setPayingDetailAddress(rs.getString("paying_detail_address"));
				payingDto.setPayingDeliveryFee(rs.getInt("paying_delivery_fee"));
				payingDto.setPayingDeliveryDate(rs.getDate("paying_delivery_date"));
				payingDto.setPayingPayway(rs.getString("paying_payway"));
				payingDto.setPayingDeliveryTime(rs.getInt("paying_delivery_time"));
				
				list.add(payingDto);
				}
				con.close();
				return list;
		}
		
		// 주문목록 페이지 번호 계산
		public int countByPaging() throws Exception {
			Connection con = JdbcUtils.getConnection();
			String sql = "select count(*) from paying";
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
			String sql = "select count(*) from paying where instr(#1,?) > 0";
			sql = sql.replace("#1", type);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, keyword);
			
			ResultSet rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			
			con.close();
			return count;
		}
}

