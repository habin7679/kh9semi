package semi2.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter(urlPatterns = "/ajax/*")
public class CorsFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;

		try {
			//비동기 통신으로 요청이 발생할 경우(XmlHttpRequest)
			//교차 출처 자원 공유 금지 정책(CORS)에 의해서 자동으로 차단(blocking)된다.
			//이를 특정 대상에게 허용하려면 response header에 다음 설정을 추가해야 한다.
			resp.setHeader("Access-Control-Allow-Origin", "http://127.0.0.1:5500");
			resp.setHeader("Access-Control-Allow-Headers", "Content-Type");
			
			chain.doFilter(request, response);
		}
		
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}