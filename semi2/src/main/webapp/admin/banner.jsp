<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드 폼</title>
</head>
 
<h3>파일 업로드 폼</h3>
<center>
	<form action="add.ez" method="post"  enctype="multipart/form-data">
		<table>
			<tr>
				<th>배너 업로드</th>
				<td>
					<input type="file" name="bannerImg">
				</td>
				
			</tr>
			<tr>
			<td align="center" colspan="2">
				<input type="submit" value="등록">
			</td>
		</tr>
		</table>
	</form>
</center>