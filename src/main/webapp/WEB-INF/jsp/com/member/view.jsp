<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 관리</title>
<link href="<c:url value='/'/>css/common.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<div id="wrap">
		<!-- header 시작 -->
		<div id="header_mainsize">
			<c:import url="/EgovPageLink.do?link=main/inc/EgovIncHeader" />
		</div>
		<div id="topnavi">
			<c:import url="/EgovPageLink.do?link=main/inc/EgovIncTopnav" />
		</div>
		<!-- //header 끝 -->
		<!-- container 시작 -->
		<div id="container">
			<!-- 좌측메뉴 시작 -->
			<div id="leftmenu">
				<c:import url="/EgovPageLink.do?link=main/inc/EgovIncLeftmenu" />
			</div>
			<!-- //좌측메뉴 끝 -->
			<!-- 현재위치 네비게이션 시작 -->
			<div id="content">
				<div id="cur_loc">
					<div id="cur_loc_align">
						<ul>
							<li>HOME</li>
							<li>&gt;</li>
							<li>사이트관리</li>
							<li>&gt;</li>
							<li><strong>게시판템플릿관리</strong></li>
						</ul>
					</div>
				</div>

				<form:form commandName="viewForm" name="viewForm" method="GET">
					<div class="modify_user">
						<table>
							<tr>
								<th width="20%" height="23" class="required_text" nowrap>
									사용자 아이디
								</th>
								<td width="80%" nowrap="nowrap">
									<c:out value="${memberVO.EMPLYR_ID}"></c:out> 
									<input id="EMPLYR_ID" name="EMPLYR_ID" type="hidden" value="${memberVO.EMPLYR_ID}">
								</td>
							</tr>
							<tr>
								<th width="20%" height="23" class="required_text" nowrap>
									암호</th>
								<td width="80%" nowrap="nowrap"><c:out
										value="${memberVO.PASSWORD}"></c:out></td>
							</tr>
							<tr>
								<th width="20%" height="23" class="required_text" nowrap>
									암호 힌트</th>
								<td width="80%" nowrap="nowrap"><c:out
										value="${memberVO.PASSWORD_HINT}"></c:out></td>
							</tr>
							<tr>
								<th width="20%" height="23" class="required_text" nowrap>
									암호 힌트 답변</th>
								<td width="80%" nowrap="nowrap"><c:out
										value="${memberVO.PASSWORD_CNSR}"></c:out></td>
							</tr>
							<tr>
								<th width="20%" height="23" class="required_text" nowrap>
									이름</th>
								<td width="80%" nowrap="nowrap"><c:out
										value="${memberVO.USER_NM}"></c:out></td>
							</tr>
							<tr>
								<th width="20%" height="23" class="required_text" nowrap>
									우편번호</th>
								<td width="80%" nowrap="nowrap"><c:out
										value="${memberVO.ZIP}"></c:out></td>
							</tr>
							<tr>
								<th width="20%" height="23" class="required_text" nowrap>
									집주소</th>
								<td width="80%" nowrap="nowrap"><c:out
										value="${memberVO.HOUSE_ADRES}"></c:out></td>
							</tr>
							<tr>
								<th width="20%" height="23" class="required_text" nowrap>
									이메일</th>
								<td width="80%" nowrap="nowrap"><c:out
										value="${memberVO.EMAIL_ADRES}"></c:out></td>
							</tr>
							<tr>
								<th width="20%" height="23" class="required_text" nowrap>
									권한레벨</th>
								<td width="80%" nowrap="nowrap"><c:out
										value="${memberVO.GROUP_ID}"></c:out> <select name="GROUP_ID">
										<c:forEach var="auth" items="${authVO}">
											<option value="${auth.GROUP_ID}"
												<c:if test="${auth.GROUP_ID == memberVO.GROUP_ID}">selected="selected"</c:if>>${auth.GROUP_NM}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<th width="20%" height="23" class="required_text" nowrap>
									소속기관</th>
								<td width="80%" nowrap="nowrap"><c:out
										value="${memberVO.ORGNZT_ID}"></c:out></td>
							</tr>
							<tr>
								<th width="20%" height="23" class="required_text" nowrap>
									휴면계정여부</th>
								<td width="80%" nowrap="nowrap"><c:out
										value="${memberVO.EMPLYR_STTUS_CODE}"></c:out></td>
							</tr>
							<tr>
								<th width="20%" height="23" class="required_text" nowrap>
									등록일</th>
								<td width="80%" nowrap="nowrap"><fmt:formatDate
										pattern="yyyy-MM-dd HH:mm:ss" value="${memberVO.SBSCRB_DE}" />
								</td>
							</tr>

						</table>
					</div>
					<div class="buttons"
						style="padding-top: 10px; padding-bottom: 10px;">
						<!-- 목록/저장버튼  -->
						<table border="0" cellspacing="0" cellpadding="0" align="center">
							<tr>
								<td><a href="#LINK" id="update_member"> <spring:message
											code="button.update" />
								</a></td>
								<td width="10"></td>
								<td><a href="#LINK" id="delete_member"> <spring:message
											code="button.delete" />
								</a></td>
								<td width="10"></td>
								<td><a href="<c:url value='/com/member/selectMember.do'/>">
										<spring:message code="button.list" />
								</a></td>
							</tr>
						</table>
					</div>
				</form:form>
			</div>
			<!-- //content 끝 -->
		</div>
		<!-- //container 끝 -->
		<!-- footer 시작 -->
		<div id="footer">
			<c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" />
		</div>
		<!-- //footer 끝 -->
	</div>
	<!-- //전체 레이어 끝 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(document).ready(function() {
			$("#update_member").click(function() {
				$("#viewForm").attr("action","<c:url value='/com/member/updateMember.do'/>");
				$("#viewForm").submit();			
			});
			$("#delete_member").click(function(){
				if(confirm("정말로 삭제 하시겠습니까?")){
					$("#viewForm").attr("action","<c:url value='/com/member/deleteMember.do'/>");
					$("#viewForm").attr("method", "post");
					$("#viewForm").submit();
				}else{
					return false;
				}
			});
		});
	</script>
</body>
</html>