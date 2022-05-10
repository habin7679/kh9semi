<%@page import="semi2.beans.BoardAttachmentDao"%>
<%@page import="semi2.beans.BoardAttachmentDto"%>
<%@page import="semi2.beans.AttachmentDao"%>
<%@page import="semi2.beans.AttachmentDto"%>
<%@page import="semi2.beans.BoardDao"%>
<%@page import="semi2.beans.BoardDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	파일 업로드에서 서버가 가져야할 코드 예시
	(원래대로라면 서블릿에 작성해야하는 코드)
--%>
<%
	//기존 코드(파일이 없을 경우)
	//request.setCharacterEncoding("UTF-8");
	//String name = request.getParameter("name");
	//int korean = Integer.parseInt(request.getParameter("korean"));
	//int english = Integer.parseInt(request.getParameter("english"));
	//int math = Integer.parseInt(request.getParameter("math"));
	//String attach = request.getParameter("attach");
	
	//신규 코드(파일이 있을 경우)
	//- request로는 해석이 불가능함
	//- cos.jar 파일 내부에 있는 MultipartRequest라는 객체를 생성하여 해석
	//- 파일과 관련된 옵션들을 미리 지정해야 생성이 가능(저장위치, 크기제한, 인코딩)
	
	//- 저장할 경로는 프로젝트 외부(서버 외부)로 설정하는 것이 좋다
	//- 이유는 프로젝트가 갱신되거나 지워질 때 영향을 받지 않도록 하기 위해서이다.
	//- 일반적으로는 파일을 따로 파일서버에 저장하는 경우가 대부분이지만 현 시점에서는 생략한다.
	//- System.getProperty("user.home");을 설정하면 운영체제마다 기본 폴더를 자동 탐색하여 지정한다.
	//- 혹시 이름이 겹치면 덮어쓰기가 되도록 설정되어 있으므로 이게 싫으면 처리객체를 추가한다.
	
	String path = System.getProperty("user.home") + "/upload";//운영체제에서 사용자에게 제공되는 home 폴더
	System.out.println("path = " + path);//확인을 위한 출력
	
	File dir = new File(path);
	dir.mkdirs();//폴더 생성
	
	int max = 1 * 1024 * 1024;//최대 크기 제한(byte);
	String encoding = "UTF-8";
	
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	MultipartRequest mRequest = new MultipartRequest(request, path, max, encoding, policy);
	// 정상실행이 되었다면 모든 정보는 mRequest 객체에 들어있다.
	// - 들어있는 정보를 꺼내서 화면에 출력하거나 DB에 저장하거나 원하는 작업을 수행한다.
	// - 파일이 아닌 일반적인 데이터는 기존 명령과 동일하게 읽을 수 있다.
	// - 파일은 이미 업로드가 되어 있으며, 업로드 완료된 파일의 정보를 읽는 명령은 따로 있다.
	
	int boardNo = Integer.parseInt(mRequest.getParameter("boardNo"));
%>
<h3>boardNo = <%=boardNo%></h3>

<%
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
%>
<h3>uploadName = <%=uploadName%></h3>
<h3>saveName = <%=saveName%></h3>
<h3>contentType = <%=contentType%></h3>
<h3>fileSize = <%=fileSize%></h3>


<%--
	DB 저장을 할 경우라면...
	[1] score 테이블 저장
	[2] attachment 테이블 저장
	[3] score_attachment 테이블 저장
 --%>
<%
//[1]
	BoardDto boardDto = new BoardDto();
	boardDto.setBoardNo(boardNo);
	
	BoardDao boardDao = new BoardDao();
	boardDao.insert(boardDto);
	//[2]
	AttachmentDto attachmentDto = new AttachmentDto();
	attachmentDto.setAttachmentUploadname(uploadName);
	attachmentDto.setAttachmentSavename(saveName);
	attachmentDto.setAttachmentType(contentType);
	attachmentDto.setAttachmentSize(fileSize);
	AttachmentDao attachmentDao = new AttachmentDao();
	attachmentDto.setAttachmentNo(attachmentDao.getSequence());
	attachmentDao.insert(attachmentDto);
	
	//[3]
	BoardAttachmentDto boardAttachmentDto = new BoardAttachmentDto();
	boardAttachmentDto.setAttachmentNo(attachmentDto.getAttachmentNo());
	boardAttachmentDto.setBoardno(boardNo);
	
	BoardAttachmentDao boardAttachmentDao = new BoardAttachmentDao();
	boardAttachmentDao.insert(boardAttachmentDto);
%>
