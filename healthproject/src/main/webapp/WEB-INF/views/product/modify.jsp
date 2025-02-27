<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<%@include file="../myinclude/myheader.jsp" %>  

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">product - modify</h3>
        </div><%-- /.col-lg-12 --%>
    </div><%-- /.row --%>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                	<h4>상품정보 수정-삭제</h4>
				</div><%-- /.panel-heading --%>
                
                <div class="panel-body">
                <form role="form" id="frmModify" method="post" name="frmBoard" data-product_number="${product.product_number }" >
                
					<div class="form-group">
						<label>상품 내용</label>
							<input class="form-control" name="product_content" value='<c:out value="${product.product_content}"/>'/>
					</div>
					<div class="form-group">
						<label>상품 유통기한</label>
							<input class="form-control" name="product_period" value='<c:out value="${product.product_period}"/>'/>
					</div>
					<div class="form-group">
						<label>상품 가격</label>
							<input class="form-control" name="product_price" value='<c:out value="${product.product_price}"/>'/>
					</div>
					<div class="form-group">
						<label>상품 재고</label>
							<input class="form-control" name="product_stock" value='<c:out value="${product.product_stock}"/>'/>
					</div>
					<sec:csrfInput/>
					
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
 
if(operation == "modify"){ //상품 정보 수정 요청
frmModify.append("<input type='hidden' name='product_number' value='"+ $(this).data("product_number") +"' />")
frmModify.attr("action", "${contextPath}/product/modify");
} else if(operation == "remove"){ //상품 정보 삭제 요청
frmModify.attr("action", "${contextPath}/product/remove");
} else if(operation == "list"){ //상품 목록 화면 요청
frmModify.attr("action","${contextPath}/product/list").attr("method","get");
frmModify.empty();
}
 
frmModify.submit() ; //요청 전송
});

</script>

<%@include file="../myinclude/myfooter.jsp" %>    