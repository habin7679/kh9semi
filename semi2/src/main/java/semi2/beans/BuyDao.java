package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BuyDao {
	public void insertAccount(BuyDto buyDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "insert into buy(buy_no, member_id, order_no, buy_status) values(buy_no_seq.nextval,?,?,'입금전')";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, buyDto.getMemberId());
		ps.setInt(2, buyDto.getOrderNo());
		
		ps.execute();
		con.close();
	}
	public void insertCredit(BuyDto buyDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "insert into buy(buy_no, member_id, order_no, buy_status) values(buy_no_seq.nextval,?,?,'결제완료')";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, buyDto.getMemberId());
		ps.setInt(2, buyDto.getOrderNo());
		
		ps.execute();
		con.close();
	}
	public boolean updateStatus(String buyStatus, int orderNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "update buy set buy_status = ? where order_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, buyStatus);
		ps.setInt(2, orderNo);
		
		int count = ps.executeUpdate();
		
		con.close();
		return count>0;
	}
	
	// 송장입력-->배송중
	public boolean updateInvoice(BuyDto buyDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "update buy set buy_status = '배송중', buy_invoice=? where order_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setLong(1, buyDto.getBuyInvoice());
		ps.setInt(2, buyDto.getOrderNo());
		
		int count = ps.executeUpdate();
		con.close();
		
		return count>0;
	}
	//관리자 - 주문취소
	public boolean cancelInvoice (int orderNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "update buy set buy_status = '취소완료' where order_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, orderNo);
		
		int count = ps.executeUpdate();
		con.close();
		
		return count>0;
	}
	
	public List<BuyDto> selectAll(String memberId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from buy where member_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, memberId);
		
		ResultSet rs = ps.executeQuery();
		List<BuyDto> list = new ArrayList<>();
		
		while(rs.next()) {
			BuyDto bDto = new BuyDto();
			bDto.setBuyNo(rs.getInt("buy_no"));
			bDto.setMemberId(rs.getString("member_id"));
			bDto.setOrderNo(rs.getInt("order_no"));
			bDto.setBuyInvoice(rs.getLong("buy_invoice"));
			bDto.setBuyStatus(rs.getString("buy_status"));
			
			list.add(bDto);
		}
		con.close();
		return list;
	}
	
	//관리자 - 주문목록 조회
	public List<BuyDto> selectAllForAdmin() throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from buy order by buy_no asc";
		PreparedStatement ps = con.prepareStatement(sql);
	
		ResultSet rs = ps.executeQuery();
		List<BuyDto> list = new ArrayList<>();
		
		while(rs.next()) {
			BuyDto bDto = new BuyDto();
			bDto.setBuyNo(rs.getInt("buy_no"));
			bDto.setMemberId(rs.getString("member_id"));
			bDto.setOrderNo(rs.getInt("order_no"));
			bDto.setBuyInvoice(rs.getLong("buy_invoice"));
			bDto.setBuyStatus(rs.getString("buy_status"));
			
			list.add(bDto);
		}
		con.close();
		return list;
	}
	
	//관리자 - 주문내역 상세
	public BuyDto selectOne(int buyNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from buy where buy_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, buyNo);
		ResultSet rs = ps.executeQuery();
		
		BuyDto buyDto;
		if(rs.next()) {
			buyDto = new BuyDto();
			buyDto.setBuyNo(rs.getInt("buy_no"));
			buyDto.setMemberId(rs.getString("member_id"));
			buyDto.setOrderNo(rs.getInt("order_no"));
			buyDto.setBuyInvoice(rs.getLong("buy_invoice"));
			buyDto.setBuyStatus(rs.getString("buy_status"));
		}
		else {
			buyDto = null;
		}
		con.close();
		return buyDto;
	}
	
	//관리자 - 주문 검색
	public List<BuyDto> selectList(String type, String keyword) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from buy where instr(#1, ?) > 0 order by buy_no asc";
		sql = sql.replace("#1", type);
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		List<BuyDto> list = new ArrayList<>();
		
		while(rs.next()) {
			BuyDto buyDto = new BuyDto();
			buyDto.setBuyNo(rs.getInt("buy_no"));
			buyDto.setMemberId(rs.getString("member_id"));
			buyDto.setOrderNo(rs.getInt("order_no"));
			buyDto.setBuyInvoice(rs.getLong("buy_invoice"));
			buyDto.setBuyStatus(rs.getString("buy_status"));
			
			
			list.add(buyDto);
		}
		con.close();
		
		return list;
	}
	
	//관리자 - 주문내역 삭제                                                                                                                       
	public boolean delete(int buyNo) throws Exception {
		Connection con = JdbcUtils.getConnection();

		String sql = "delete buy where buy_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, buyNo);
		int count = ps.executeUpdate();

		con.close();

		return count > 0;
	}
	
	public boolean edit(BuyDto buyDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update buy set member_id = ?, order_no =?, buy_invoice =?, buy_status =? "
				+ "where buy_no = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, buyDto.getMemberId());
		ps.setInt(2, buyDto.getOrderNo());
		ps.setLong(3, buyDto.getBuyInvoice());
		ps.setString(4, buyDto.getBuyStatus());
		ps.setInt(5, buyDto.getBuyNo());
		
		int count = ps.executeUpdate();
		con.close();
		
		return count > 0;
		
	}
	//페이징이 구현된 주문 목록
	public List<BuyDto> listAllByPaging(int p, int s) throws Exception{
		int end = p * s;
		int begin = end - (s-1);

		Connection con = JdbcUtils.getConnection();

		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
			       + "select * from buy order by buy_no desc"
			        + ") TMP"
			+ ")where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();

		List<BuyDto> list = new ArrayList<>();

		while(rs.next()) {
			BuyDto bDto = new BuyDto();
			bDto.setBuyNo(rs.getInt("buy_no"));
			bDto.setMemberId(rs.getString("member_id"));
			bDto.setOrderNo(rs.getInt("order_no"));
			bDto.setBuyInvoice(rs.getLong("buy_invoice"));
			bDto.setBuyStatus(rs.getString("buy_status"));

			list.add(bDto);
		}
		con.close();
		return list;
	}


	//페이징이 구현된 주문 검색
	public List<BuyDto> selectListByPaging(int p, int s, String type, String keyword) throws Exception{
		int end = p * s;
		int begin = end - (s-1);

		Connection con = JdbcUtils.getConnection();

		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
			       + "select * from buy where instr(#1,?) > 0 order by buy_no desc"
			        + ") TMP"
			+ ")where rn between ? and ?";

		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		ResultSet rs = ps.executeQuery();

		List<BuyDto> list = new ArrayList<>();

		while(rs.next()) {
			BuyDto bDto = new BuyDto();
			bDto.setBuyNo(rs.getInt("buy_no"));
			bDto.setMemberId(rs.getString("member_id"));
			bDto.setOrderNo(rs.getInt("order_no"));
			bDto.setBuyInvoice(rs.getLong("buy_invoice"));
			bDto.setBuyStatus(rs.getString("buy_status"));

			list.add(bDto);
		}
		con.close();
		return list;
	}

	// 주문목록 페이지 번호 계산
	public int countByPaging() throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql = "select count(*) from buy";
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
		String sql = "select count(*) from buy where instr(#1,?) > 0";
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