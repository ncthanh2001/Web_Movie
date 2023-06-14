<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>N2C1T_Movies</title>
<%@ include file="/common/head.jsp"%>
</head>
<body>

	<%@ include file="/views_staff/Nav_Staff.jsp" %>



	  <section class=" movie-detail_s" style="height: 700px;">
        <div class=" container_s d-flex justify-content-center ">
          <figure class="movie-detail-banner_s  ">
          </figure>
          <div class="movie-detail-content_s rounded-3">
            <div class="container">
              <form action="/action_page.php" >
                <h2 class="text-light fw-bold">HI! ADMINISTRATION </h2>
                <h2 class="text-light fw-bold">HAVE A GOOD DAY </h2>

           
                  <!-- <button  class="btn_s btn-primary_s" formaction="">Register</button> -->

           
              </form>
            </div>

          </div>

        </div>
      </section>
	
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