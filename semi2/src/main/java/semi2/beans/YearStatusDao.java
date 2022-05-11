package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class YearStatusDao {
	//목록
	public List<YearStatusDto> selectList() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from year_status order by year asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<YearStatusDto> list = new ArrayList<>();
		
		while(rs.next()) {
			YearStatusDto yearStatusDto = new YearStatusDto();
			
			yearStatusDto.setYear(rs.getInt("year"));
			yearStatusDto.setCnt(rs.getInt("cnt"));
			yearStatusDto.setMax(rs.getInt("max"));
			yearStatusDto.setMin(rs.getInt("min"));
			yearStatusDto.setSum(rs.getInt("sum"));
			yearStatusDto.setAvg(rs.getDouble("avg"));
			
			list.add(yearStatusDto);
		}
		
		con.close();
		
		return list;
	}
	
	//특정기간 통계
	public List<YearStatusDto> selectList(int begin, int end) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from year_status where year between ? and ? order by year asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();
		
		List<YearStatusDto> list = new ArrayList<>();
		
		while(rs.next()) {
			YearStatusDto yearStatusDto = new YearStatusDto();
			
			yearStatusDto.setYear(rs.getInt("year"));
			yearStatusDto.setCnt(rs.getInt("cnt"));
			yearStatusDto.setMax(rs.getInt("max"));
			yearStatusDto.setMin(rs.getInt("min"));
			yearStatusDto.setSum(rs.getInt("sum"));
			yearStatusDto.setAvg(rs.getDouble("avg"));
			
			list.add(yearStatusDto);
		}
		
		con.close();
		
		return list;
	}
	
	//특정연도만 출력
	public YearStatusDto selectOne(int year) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from year_status where year = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, year);
		ResultSet rs = ps.executeQuery();
		
		YearStatusDto yearStatusDto;
		if(rs.next()) {
			yearStatusDto = new YearStatusDto();
			
			yearStatusDto.setYear(rs.getInt("year"));
			yearStatusDto.setCnt(rs.getInt("cnt"));
			yearStatusDto.setMax(rs.getInt("max"));
			yearStatusDto.setMin(rs.getInt("min"));
			yearStatusDto.setSum(rs.getInt("sum"));
			yearStatusDto.setAvg(rs.getDouble("avg"));
		}
		else {
			yearStatusDto = null;
		}
		
		con.close();
		
		return yearStatusDto;
	}
	
}