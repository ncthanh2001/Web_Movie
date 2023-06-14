<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:include page="/common/taglib.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>N2C1T_Movies</title>
<jsp:include page="/common/head.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="../views_user/navbar_sigin.jsp"></jsp:include>



	<jsp:include page="/views_user/SignUp.jsp"></jsp:include>
	
	<jsp:include page="../views/footer.jsp"></jsp:include>




    <a href="#top" class="go-top_s" data-go-top>
        <ion-icon name="chevron-up"></ion-icon>
      </a>
  


     <script src="./assets/js/script.js"></script>

      <!-- 
    - ionicon link
  -->

      <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
      <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>