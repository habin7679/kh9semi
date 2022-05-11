<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="semi2.beans.AttachmentDto"%>
<%@page import="semi2.beans.AttachmentDao"%>

<%--
	이미 download.kh를 통해서 모든 다운로드가 가능하기 때문에
	화면에서는 다음 방법으로 다운로드 주소로 연결만 해주면 된다.
	1. <a> 태그를 이용하여 다운로드 화면으로 연결
	2. <img> 태그를 이용하여 이미지의 경우 미리보기를 할 수 있다
 --%>

<img src="download.ez?attachmentNo=8" width="300" height="350">
</div>