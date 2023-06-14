<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
	integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<body>
<main>
    <article>

      <!-- 
        - #MOVIE DETAIL
      -->

      <section class=" movie-detail_s">
        <div class=" container_s d-flex justify-content-center ">
          <figure class="movie-detail-banner_s  ">
          </figure>
          <div class="movie-detail-content_s bg-signin rounded-3">
            <div class="container">
            <!--   <form action="login" method = "post" > -->
                <h2 class="text-light fw-bold">FORGOT PASSWORD</h2>
                <div class="mb-3 mt-3 text-light">
                  <label  for="username">Username:</label>
                  <input type="text" class="form-control mt-2" id="username" placeholder="Enter username?" name="username" >
                </div>
                <div class="mb-3 text-light">
                  <label  for="email">Email:</label>
                  <input type="email" class="form-control mt-2" id="email" placeholder="Enter email?" name="pswd">
                </div>
              
                
                <div class="d-grid gap-3">
                  <button id = "forgetbtn"  class="btn_s btn-primary_s d-flex justify-content-center mt-2" >Retrieve</button>     
                </div>
                  <!-- <button  class="btn_s btn-primary_s" formaction="">Register</button> -->

           	<h5 style = "color: red " id="mess"></h5>
             <!--  </form> -->
            </div>

          </div>

        </div>
      </section>

    </article>
    <script >
	$('#forgetbtn').click(function(){
		$('#mess').text('');
		var email = $('#email').val();
		var formData = {'email':email};
		$.ajax({
			url:'forgotPass',
			type:'POST',
			data: formData
		}).then(function(data){
			$('#mess').text('Pass has been resst  , please check your email');
			setTimeout(() => {
				window.location.href='http://localhost:8080/ASM_JAVA4_N2C1T_Movies/login';
			}, 10*1000);
		}).fail(function(errr){
			$('#mess').text('your information is not correct');
		})
	});
    /* $('#forgetbtn').click(function(){
    	$('#mess').text('');
    	var email = $('#email').val();
		var formData = {'email':email};
		$.ajax({
			url:'forgotPass',
			type:'POST',
			data: formData
		}).then(function(data){
			$('#mess').text('Pass has been resst  , please check your email');
			setTimeout(() => {
				window.location.href='http://localhost:8080/ASM_JAVA4_N2C1T_Movies/login';
			}, 10*1000);
		}).fail(function(err){
			$('#mess').text('your information is not correct');
		});
    }); */
    	/* $('#forgetbtn').click(function (){
    		$('#mess').text('');
    		var email = $('#email').val();
    		var formData = {'email':email};
    		$.ajax({
    			url:'forgotPass',
    			type:'POST',
    			data: formData
    		}).then(function(data){
    			$('#mess').text('Pass has been resst  , please check your email');
    			setTimeout(() => {
					window.location.href='http://localhost:8080/ASM_JAVA4_N2C1T_Movies/login';
				}, 10*1000);
    		}).fail(function(err){
    			$('#mess').text('your information is not correct');
    		});
    	}); */
    </script>
  </main>
</body>
</html>