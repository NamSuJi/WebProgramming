<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="lib/header.jsp" %>
<div align="center" class="accountDiv">
   	<table class="accountTable">
   		<tr class="title"><td colspan="3"> 내역 추가 </td></tr>
   		<tr>
   			<td rowspan="3">
   			</td>
   			<td>
   				<input type="text" name="subject" placeholder='내역' />
   			</td>
   			<td>
   				<input type="button" value="추가" onclick=""/>
   			</td>
		</tr>
		<tr>
			<td><input type="date" name="date" /></td>
		</tr>
		<tr>
			<td><input type="text" name="content" placeholder='상세 내역' />
		</tr>
		<tr>
			<td><input type="button" value="취소" onclick=""/></td>
			<td><input type="button" value="삭제" onclick=""/></td>
		</tr>
   	</table>
</div>
<%@ include file="lib/footer.jsp" %>