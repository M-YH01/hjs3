<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<%@include file="../myinclude/myheader.jsp" %>  

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">Ticket - modify</h3>
        </div><%-- /.col-lg-12 --%>
    </div><%-- /.row --%>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                	<h4>회원권 수정-삭제</h4>
				</div><%-- /.panel-heading --%>
                
                <div class="panel-body">
					<div class="form-group">
						<label>회원 번호</label>
							<input class="form-control" name="ticket_number" value='<c:out value="${ticket.ticket_number}"/>'/>
					</div>
					<div class="form-group">
						<label>회원권 내용</label>
							<input class="form-control" name="ticket_content" value='<c:out value="${ticket.ticket_content}"/>'/>
					</div>
					<div class="form-group">
						<label>회원권 시작 날짜</label>
							<input class="form-control" name="ticket_start_date" value='<c:out value="${ticket.ticket_start_date}"/>'/>
					</div>
					<div class="form-group">
						<label>회원권 종료 날짜</label>
							<input class="form-control" name="ticket_end_date" value='<c:out value="${ticket.ticket_end_date}"/>'/>
					</div>
					<div class="form-group">
						<label>PT 횟수</label>
							<input class="form-control" name="pt_count" value='<c:out value="${ticket.pt_count}"/>'/>
					</div>
					<div class="form-group">
						<label>회원권 가격</label>
							<input class="form-control" name="ticket_price" value='<c:out value="${ticket.ticket_price}"/>'/>
					</div>
						
					<button type="button" class="btn btn-default" id="btnModify" data-oper="modify">수정</button>
 					<button type="button" class="btn btn-danger" id="btnRemove" data-oper="remove">삭제</button>
 					<button type="button" class="btn btn-info" id="btnList" data-oper="list">취소</button>
		  
		  </form>
          </div><%-- /.panel-body --%>
            
        </div><%-- /.panel --%>
    </div><%-- /.col-lg-12 --%>
</div><%-- /.row --%>
  

</div><%-- /#page-wrapper --%>

<%-- Modal --%>
<div class="modal fade" id="yourModal" tabindex="-1" role="dialog" aria-labelledby="yourModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="yourModalLabel">Modal title</h4>
            </div>
            <div class="modal-body" id="yourModal-body">메시지</div>
            
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
        </div><%-- /.modal-content --%>
    </div><%-- /.modal-dialog --%>
</div><%-- /.modal --%>

<script> 
//form의 수정/삭제/목록보기 버튼 클릭 에벤트 처리
var frmModify = $("#frmModify");
$('button').on("click", function(e){ 
//e.preventDefault(); //버튼 유형이 submit가 아니므로 설정할 필요 없음

var operation = $(this).data("oper"); //각 버튼의 data-xxx 속성에 설정된 값을 저장
alert("operation: "+ operation);
 
if(operation == "modify"){ //회원권 정보 수정 요청
frmModify.attr("action", "${contextPath}/ticket/modify");
} else if(operation == "remove"){ //회원권 정보 삭제 요청
frmModify.attr("action", "${contextPath}/ticket/remove");
} else if(operation == "list"){ //회원권 목록 화면 요청
frmModify.attr("action","${contextPath}/ticket/list").attr("method","get");
frmModify.empty();
}
 
frmModify.submit() ; //요청 전송
});

</script>

<%@include file="../myinclude/myfooter.jsp" %>    