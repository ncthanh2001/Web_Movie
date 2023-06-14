<%@ include file="/common/taglib.jsp"%>

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
            <c:if test="${not empty mess }">
            <div class="alert alert-danger" role="alert">
  				${mess }
				</div>
            </c:if>
          <form action="login" method = "post" id="login-form">
                <h2 class="text-light fw-bold">SIGN IN</h2>
                <div class="mb-3 mt-3 text-light">
                  <label  for="username">Username:</label>
                  <input type="text" class="form-control mt-2" id="username" placeholder="Enter username" name="username"
                   value ="nv_01" ><%-- "${sessionScope.currentUser.username}" --%>
                </div>
                <div class="mb-3 text-light">
                  <label  for="pwd">Password:</label>
                  <input type="password" class="form-control mt-2" id="pwd" placeholder="Enter password" name="pswd"
                  value = "123"> <%-- ${sessionScope.currentUser.password} --%>
                </div>
                <div class="form-check mb-3 text-light">
                  <label class="form-check-label">
                    <input class="form-check-input check-warning  " id="remember" type="checkbox" name="remember" ${  sessionScope.remember.length() != null? 'checked':'' } 
                    > Remember me?
                  </label>
                </div>
                
                <div class="d-grid gap-3">
                  <button type="submit" id="loginbtn" class="btn_s btn-primary_s d-flex justify-content-center ">Login</button>
                  <a href="forgotPass" class="p-forgot">Forgot password ?</a>
                  <hr class="border border-1 border-warning">
                  <a class="btn_s btn-primary_s d-flex justify-content-center " href="register"> Register</a>
                </div>
                 
           
         <!--     </form> -->
            </div>

          </div>

        </div>
      </section>

    </article>
    <script >
   /*  $('#loginbtn').click(function(){
	 	var formData = {
	 			'username':$('#username').val(),
	 			'pwd':$('#pwd').val(),
	 			'remember': $('#remember').val(),
	 			
	 	};
	 	
	 	$.ajax({
	 		url:"http://localhost:8080/ASM_JAVA4_N2C1T_Movies/login",
	 		type:'POST',
	 		data:formData
	 	}).then(function(data){
	 		  Swal.fire(
	 				  'The Internet?',
	 				  'That thing is still around?',
	 				  'success'
	 				).then(function(){
	 			 		window.location.assign("http://localhost:8080/ASM_JAVA4_N2C1T_Movies/index");
	 				})
	 	}).fail(function(error){
	 		$('#mess').text('opp!')
	 	});
 }) */
    
    </script>
  </main>
