drop sequence product_no_seq;
drop sequence board_seq;
drop sequence reply_seq;
drop table member cascade CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE reply CASCADE CONSTRAINTS;


create table member(
member_id varchar2(20) primary key check(regexp_like(member_id, '^[a-z][a-z0-9]{7,19}$')),
member_pw varchar2(16) not null 
check(regexp_like(member_pw, '[a-z]+') and regexp_like(member_pw, '[A-Z]+')
			and regexp_like(member_pw, '[0-9]+') and regexp_like(member_pw, '[!@#$]+')),
member_name varchar2(21) not null check(regexp_like(member_name,'^[가-힣]{2,7}$')),
member_nick varchar2(30) not null unique check(regexp_like(member_nick, '^[가-힣]{3,10}$')),
member_phone char(11) not null check(regexp_like(member_phone, '^010[1-9][0-9]{7}$')),
member_email varchar2(100),
member_birth char(10) not null,
member_post varchar2(6),
member_basic_address varchar2(300),
member_detail_address varchar2(300),
member_point number default 2000 not null check(member_point >= 0),
member_grade varchar2(12) default '일반회원' not null check(member_grade in ('일반회원', '우수회원', '관리자','vip')),
member_joindate date default sysdate not null
);


create table product(
product_no number primary key,
product_name varchar2(100) not null,
product_sort varchar2(50) check(product_sort in ('정기배송','닭가슴살','샐러드','소고기','간식','도시락')) ,
product_price number not null,
product_stock number not null,
product_company varchar2(30) not null,
product_made date not null,
product_expire date not null,
product_event char(1) check(product_event in ('0','1')),
product_kcal number not null,
product_protein number not null,
product_carbohydrate number not null,
product_fat number not null,
product_info varchar2(100) not null,
product_img varchar2(90) not null
);

create sequence product_no_seq;

create table board(
board_no number primary key,
board_head varchar2(6) check(board_head in ('공지', '자유', '문의', '팁', '후기')),
board_title varchar2(300) not null,
board_content varchar2(4000) not null,
board_time date default sysdate not null,
board_readcount number default 0 not null,
board_writer references member(member_id) on delete set null,
board_product_no references product(product_no) on delete set null
);
create sequence board_seq;

create table reply(
reply_no number primary key,
reply_content varchar2(600) not null,
reply_time date default sysdate not null,
reply_board_no references board(board_no) on delete cascade,
reply_writer references member(member_id) on delete set null
);
create sequence reply_seq;


alter table board add(
group_no number not null,
super_no number default 0 not null,
depth number default 0 not null
);

commit;

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

@WebServlet(urlPatterns = "/product/edit.ez")
public class ProductEditServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String path = System.getProperty("user.home") + "/upload";// 운영체제에서 사용자에게 제공되는 home 폴더
			System.out.println("path = " + path);// 확인을 위한 출력

			File dir = new File(path);
			dir.mkdirs();// 폴더 생성

			int max = 2 * 1024 * 1024;// 최대 크기 제한(byte);
			String encoding = "UTF-8";
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			MultipartRequest mRequest = new MultipartRequest(req, path, max, encoding, policy);

			ProductDto productDto = new ProductDto();
			productDto.setProductNo(Integer.parseInt(mRequest.getParameter("productNo")));

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
			// productDto.setProductInfo(mRequest.getParameter("productInfo"));
			// productDto.setProductImg(req.getParameter("productImg"));

			ProductDao productDao = new ProductDao();
			
			int no = productDao.getSequence();
			productDto.setProductNo(no);
			productDao.add(productDto);

			if (mRequest.getFile("productImg") != null) {
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
			if (mRequest.getFile("productInfo") != null) {
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

			int no1 = Integer.parseInt(mRequest.getParameter("productNo"));
			boolean result = productDao.delete(no1);
	

			if (result ) {
				resp.sendRedirect("product_edit_success.jsp");
			} else {
				resp.sendRedirect("product_edit_fail.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}