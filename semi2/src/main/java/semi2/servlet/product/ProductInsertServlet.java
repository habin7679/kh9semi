package semi2.servlet.product;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi2.beans.ProductDao;
import semi2.beans.ProductDto;

@WebServlet(urlPatterns = "/product/add.ez")
public class ProductInsertServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
			try {
				String path = System.getProperty("user.home") + "/upload";//운영체제에서 사용자에게 제공되는 home 폴더
				System.out.println("path = " + path);//확인을 위한 출력
				
				File dir = new File(path);
				dir.mkdirs();//폴더 생성
				
				int max = 1 * 1024 * 1024;//최대 크기 제한(byte);
				String encoding = "UTF-8";
				
				DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
				
				MultipartRequest mRequest = new MultipartRequest(req, path, max, encoding, policy);
				// 정상실행이 되었다면 모든 정보는 mRequest 객체에 들어있다.
				// - 들어있는 정보를 꺼내서 화면에 출력하거나 DB에 저장하거나 원하는 작업을 수행한다.
				// - 파일이 아닌 일반적인 데이터는 기존 명령과 동일하게 읽을 수 있다.
				// - 파일은 이미 업로드가 되어 있으며, 업로드 완료된 파일의 정보를 읽는 명령은 따로 있다.
				
				//업로드된 파일의 정보를 분석하는 코드
				//1. 파일의 업로드이름
				String uploadName = mRequest.getOriginalFileName("attach");
				//2. 파일의 실제 저장이름
				String saveName = mRequest.getFilesystemName("attach");
				//3. 파일의 유형
				String contentType = mRequest.getContentType("attach");
				//4. 파일의 크기(옵션)
				File target = mRequest.getFile("attach");//파일 객체를 구해와서
				long fileSize = 0L;
				if(target != null){
					fileSize = target.length();
				}
				AttachmentDto attachmentDto = new AttachmentDto();
				attachmentDto.setAttachmentUploadname(uploadName);
				attachmentDto.setAttachmentSavename(saveName);
				attachmentDto.setAttachmentType(contentType);
				attachmentDto.setAttachmentSize(fileSize);
				
				AttachmentDao attachmentDao = new AttachmentDao();
				attachmentDto.setAttachmentNo(attachmentDao.getSequence());
				attachmentDao.insert(attachmentDto);
				
				req.setCharacterEncoding("UTF-8");
				ProductDto productDto = new ProductDto();
				//productDto.setProductNo(Integer.parseInt(req.getParameter("productNo")));
				productDto.setProductName(req.getParameter("productName"));
				productDto.setProductSort(req.getParameter("productSort"));
				productDto.setProductPrice(Integer.parseInt(req.getParameter("productPrice")));
				productDto.setProductStock(Integer.parseInt(req.getParameter("productStock")));
				productDto.setProductCompany(req.getParameter("productCompany"));
				java.sql.Date productMade = java.sql.Date.valueOf(req.getParameter("productMade"));
				productDto.setProductMade(productMade);
				java.sql.Date productExpire = java.sql.Date.valueOf(req.getParameter("productExpire"));
				productDto.setProductExpire(productExpire);
				productDto.setProductEvent(req.getParameter("productEvent"));
				productDto.setProductKcal(Integer.parseInt(req.getParameter("productKcal")));
				productDto.setProductProtein(Integer.parseInt(req.getParameter("productProtein")));
				productDto.setProductCarbohydrate(Integer.parseInt(req.getParameter("productCarbohydrate")));
				productDto.setProductFat(Integer.parseInt(req.getParameter("productFat")));
				productDto.setProductInfo(req.getParameter("productInfo"));
				productDto.setProductImg(req.getParameter("productImg"));
				
				ProductDao productDao = new ProductDao();
				productDao.add(productDto);
				
				resp.sendRedirect("product_insert_success.jsp");
				
			}
			catch (Exception e) {
				e.printStackTrace();
				resp.sendError(500);
			}
			
		}
	}

