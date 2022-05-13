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

import semi2.beans.AttachmentDao;
import semi2.beans.AttachmentDto;
import semi2.beans.InfoAttachmentDao;
import semi2.beans.InfoAttachmentDto;
import semi2.beans.ProductAttachmentDao;
import semi2.beans.ProductAttachmentDto;
import semi2.beans.ProductDao;
import semi2.beans.ProductDto;

@WebServlet(urlPatterns = "/product/add.ez")
public class ProductInsertServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
			try {
				//String path = System.getProperty("user.home") + "/upload";//운영체제에서 사용자에게 제공되는 home 폴더	public static final 
				String path = System.getProperty("user.home") + "/git/kh9semi/semi2/src/main/webapp/image";
				System.out.println("path = " + path);//확인을 위한 출력
				
				File dir = new File(path);
				dir.mkdirs();//폴더 생성
				
				int max = 10 * 1024 * 1024;//최대 크기 제한(byte);
				String encoding = "UTF-8";
				
				DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
				
				MultipartRequest mRequest = new MultipartRequest(req, path, max, encoding, policy);
				

				ProductDto productDto = new ProductDto();
				//productDto.setProductNo(Integer.parseInt(req.getParameter("productNo")));
				productDto.setProductName(mRequest.getParameter("productName"));
				productDto.setProductSort(mRequest.getParameter("productSort"));
				productDto.setProductPrice(Integer.parseInt(mRequest.getParameter("productPrice")));
				productDto.setProductStock(Integer.parseInt(mRequest.getParameter("productStock")));
				productDto.setProductCompany(mRequest.getParameter("productCompany"));
				java.sql.Date productMade = java.sql.Date.valueOf(mRequest.getParameter("productMade"));
				productDto.setProductMade(productMade);
				java.sql.Date productExpire = java.sql.Date.valueOf(mRequest.getParameter("productExpire"));
				productDto.setProductExpire(productExpire);
				productDto.setProductEvent(mRequest.getParameter("productEvent"));
				productDto.setProductKcal(Integer.parseInt(mRequest.getParameter("productKcal")));
				productDto.setProductProtein(Integer.parseInt(mRequest.getParameter("productProtein")));
				productDto.setProductCarbohydrate(Integer.parseInt(mRequest.getParameter("productCarbohydrate")));
				productDto.setProductFat(Integer.parseInt(mRequest.getParameter("productFat")));
				//productDto.setProductInfo(mRequest.getParameter("productInfo"));
			//	productDto.setProductImg(req.getParameter("productImg"));
				
				
				ProductDao productDao = new ProductDao();
				int no = productDao.getSequence();
				productDto.setProductNo(no);
				productDao.add(productDto);
				
				
				if(mRequest.getFile("productImg") != null) {
					AttachmentDto attachmentDto = new AttachmentDto();
					AttachmentDao attachmentDao = new AttachmentDao();
					attachmentDto.setAttachmentNo(attachmentDao.getSequence());
					attachmentDto.setAttachmentUploadname(mRequest.getOriginalFileName("productImg"));
					attachmentDto.setAttachmentSavename(mRequest.getFilesystemName("productImg"));
					attachmentDto.setAttachmentType(mRequest.getContentType("productImg"));
					File target = mRequest.getFile("productImg");
					attachmentDto.setAttachmentSize(target.length());
					
					attachmentDao.insert(attachmentDto);
					
					ProductAttachmentDto productAttachmentDto = new ProductAttachmentDto();
					productAttachmentDto.setProductNo(no);
					productAttachmentDto.setAttachmentNo(attachmentDto.getAttachmentNo());
					
					ProductAttachmentDao productAttachmentDao = new ProductAttachmentDao();
					productAttachmentDao.insert(productAttachmentDto);
					
				}
				
				if(mRequest.getFile("productInfo") != null) {
					AttachmentDto attachmentDto = new AttachmentDto();
					AttachmentDao attachmentDao = new AttachmentDao();
					attachmentDto.setAttachmentNo(attachmentDao.getSequence());
					attachmentDto.setAttachmentUploadname(mRequest.getOriginalFileName("productInfo"));
					attachmentDto.setAttachmentSavename(mRequest.getFilesystemName("productInfo"));
					attachmentDto.setAttachmentType(mRequest.getContentType("productInfo"));
					File target = mRequest.getFile("productInfo");
					attachmentDto.setAttachmentSize(target.length());
					
					attachmentDao.insert(attachmentDto);
					
					InfoAttachmentDto infoAttachmentDto = new InfoAttachmentDto();
					infoAttachmentDto.setProductNo(no);
					infoAttachmentDto.setAttachmentNo(attachmentDto.getAttachmentNo());
					
					InfoAttachmentDao infoAttachmentDao = new InfoAttachmentDao();
					infoAttachmentDao.insert(infoAttachmentDto);
				}
				
				resp.sendRedirect("product_insert_success.jsp");
				
			}
			catch (Exception e) {
				e.printStackTrace();
				resp.sendError(500);
			}
			
		}
	}