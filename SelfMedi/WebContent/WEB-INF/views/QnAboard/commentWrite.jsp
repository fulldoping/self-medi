<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="commentcontainer">
<hr>

<c:forEach items="${commentList }" var="comment">
<label>${comment.userId }</label><br>
<label>${comment.commentContent }</label><br>
<label>${comment.commentDate }</label><br>
<hr>
</c:forEach>

</div>
