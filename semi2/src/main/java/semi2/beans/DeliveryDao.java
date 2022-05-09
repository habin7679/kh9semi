package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DeliveryDao {
	//목록
		public DeliveryDto selectOne(String memberId) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select * from delivery where member_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberId);
			ResultSet rs = ps.executeQuery();
			
			DeliveryDto deliveryDto;
				if(rs.next()) {
				
				 deliveryDto= new DeliveryDto();
				
				deliveryDto.setMemberId(memberId);
				deliveryDto.setDeliveryName(rs.getString("delivery_name"));
				deliveryDto.setDeliveryPhone(rs.getString("member_phone"));
				deliveryDto.setDeliveryPost(rs.getString("delivery_post"));
				deliveryDto.setDeliveryBasicAddress(rs.getString("delvery_basic_address"));
				deliveryDto.setDeliveryDetailAddress(rs.getString("delivery_detail_address"));
				deliveryDto.setDeliveryMenu(rs.getString("delivery_menu"));
				
				
			}
				else {
					deliveryDto=null;
				}
			
			con.close();
			
			return deliveryDto;
		}
		
		//배송지 등록
		public void insert(DeliveryDto deliveryDto) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "insert into delivery("
								+ "member_id, deliveryName, deliveryPhone, delivery_post, delivery_basic_address, "
								+ "delivery_detail_address) values(?, ?, ?, ?, ?, ?)";
							
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, deliveryDto.getMemberId());
			ps.setString(2, deliveryDto.getDeliveryName());
			ps.setString(3, deliveryDto.getDeliveryPhone());
			ps.setString(4, deliveryDto.getDeliveryPost());
			ps.setString(5, deliveryDto.getDeliveryBasicAddress());
			ps.setString(6, deliveryDto.getDeliveryDetailAddress());
			
			ps.execute();
			
			con.close();
		}
}
