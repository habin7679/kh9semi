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
								+ "member_id, delivery_name, delivery_phone, delivery_post, delivery_basic_address, "
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
		
//		목록 메소드
		public List<DeliveryDto> select(String memberId) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select * from delivery where member_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberId);
			ResultSet rs = ps.executeQuery();
			
			//연결이 끊어지기 전까지 rs의 모든 데이터를 List에 옮겨야 한다.
			//1. 비어있는 List를 준비한다.
			List<DeliveryDto> list = new ArrayList<>();
			
			//2. 데이터 개수만큼 반복한다.
			while(rs.next()) {
				//3. 현재 줄의 데이터를 객체로 만들어서 List에 추가
				DeliveryDto deliveryDto = new DeliveryDto();
				deliveryDto.setDeliveryName(rs.getString("delivery_name"));		
				deliveryDto.setDeliveryPost(rs.getString("delivery_post"));	
				deliveryDto.setDeliveryBasicAddress(rs.getString("delivery_basic_address"));		
				deliveryDto.setDeliveryDetailAddress(rs.getString("delivery_detail_address"));		
				deliveryDto.setDeliveryPhone(rs.getString("delivery_phone"));
				deliveryDto.setDeliveryMenu(rs.getString("delivery_menu"));
				
				list.add(deliveryDto);
			}
			
			con.close();
			
			//4. 변환이 완료된 list를 반환
			return list;
		}
		
		//수정
		public boolean update1(String memberId) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "update delivery set delivery_menu='일반배송지' where delivery_menu='대표배송지' and member_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberId);
			int count = ps.executeUpdate();
			
			con.close();
			
			return count > 0;
		}
		
		//수정
			public boolean update2(String memberId, String deliveryPost) throws Exception {
					Connection con = JdbcUtils.getConnection();
					
					String sql = "update delivery set delivery_menu='대표배송지' where member_id=? and delivery_post=?";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, memberId);
					ps.setString(2, deliveryPost);
					int count = ps.executeUpdate();
					
					con.close();
					
					return count > 0;
				}
		//배송지 등록
				public void insertBasic(DeliveryDto deliveryDto) throws Exception {
					Connection con = JdbcUtils.getConnection();
					
					String sql = "insert into delivery("
										+ "member_id, delivery_name, delivery_phone, delivery_post, delivery_basic_address, "
										+ "delivery_detail_address, delivery_menu) values(?, ?, ?, ?, ?, ?,'일반배송지')";
									
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
				
				//배송지 삭제
				public boolean delete(String memberId, String deliveryPost /*
														 * , String deliveryPost, String deliveryBasicAddress, String
														 * deliveryDetailAddress
														 */) throws Exception{
					Connection con =JdbcUtils.getConnection();
					
					String sql="delete delivery where member_id=? and delivery_post=?";// and delivery_basic_address=? and delivery_detail_address=?";
					PreparedStatement ps= con.prepareStatement(sql);
					ps.setString(1, memberId);
					ps.setString(2, deliveryPost);
				
					/*
					 * ps.setString(2, deliveryPost); ps.setString(3, deliveryBasicAddress);
					 * ps.setString(4, deliveryDetailAddress);
					 */
					int count=ps.executeUpdate();
					
					con.close();
					
					return count>0;
					
					
					
				}
				//대표배송지 조회
				public DeliveryDto represent(String memberId) throws Exception {
					Connection con = JdbcUtils.getConnection();
					
					String sql = "select * from delivery where member_id=? and delivery_menu='대표배송지'";
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
}
