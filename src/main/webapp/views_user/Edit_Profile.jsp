
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
           
                <h2 class="text-light fw-bold">EDIT PROFILE</h2>

                <div class="row">
                  <div class="col">
                    <div class="mb-3 mt-3 text-light">
                      <label for="username">Username :</label>
                      <input type="text" class="form-control mt-2" id="username" placeholder="Enter Username?"
                       value="${sessionScope.currentUser.username }"  name="username">
                    </div>
                  </div>
                  <div class="col">
                    <div class="mb-3 mt-3 text-light">
                      <label for="fullname"> Fullname :</label>
                      <input type="text" class="form-control mt-2" id="fullname" placeholder="Enter Fullname"
                        name="fullname" value="${sessionScope.currentUser.fullname }">
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col">
                    <div class="mb-3 mt-3 text-light">
                      <label for="email">Email :</label>
                      <input type="email" class="form-control mt-2" id="email" placeholder="Enter new email?"
                        name="email" value="${sessionScope.currentUser.email }">
                    </div>
                  </div>
                </div>
 				<div class="text-primary fw-bold" id="messEdit" ></div>
                <div class="d-grid gap-3 mt-2">
                  <button id="editProfilebtn" class="btn_s btn-primary_s d-flex justify-content-center ">Update </button>
                </div>
                <!-- <button  class="btn_s btn-primary_s" formaction="">Register</button> -->
            </div>

          </div>

        </div>
      </section>
<script >
	$('#editProfilebtn').click(function(){
		$('#messEdit').text('');
		var username = $('#username').val();
		var fullname = $('#fullname').val();
		var email = $('#email').val();
		var formData = {'username':username,
						'fullname':fullname,
						'email':email};
		$.ajax({
			url:'editProfile',
			type:'POST',
			data: formData
		}).then(function(data){
			
			Swal.fire({
	 			  title: 'Success',
	 			  text: "Change Profile Succes",
	 			  icon: 'success',
	 			  showCancelButton: true,
	 			  confirmButtonText: 'ok'
	 			}).then((result) => {
	 			  if (result.isConfirmed) {
	 				 window.location.href='http://localhost:8080/ASM_JAVA4_N2C1T_Movies/index';
	 			  }else{
	 				 window.location.href='http://localhost:8080/ASM_JAVA4_N2C1T_Movies/index';
	 			  }
	 			})
	 		    setTimeout(() => {
	 		    	window.location.href='http://localhost:8080/ASM_JAVA4_N2C1T_Movies/index';
				 }, 10*1000);
			
		}).fail(function(errr){
			
			Swal.fire({
	 			  title: 'error',
	 			  text: "Change Profile faild",
	 			  icon: 'error',
	 			  showCancelButton: true,
	 			  confirmButtonText: 'ok'
	 			}).then((result) => {
	 			  if (result.isConfirmed) {
	 				 window.location.href='http://localhost:8080/ASM_JAVA4_N2C1T_Movies/editProfile';
	 			  }else{
	 				 window.location.href='http://localhost:8080/ASM_JAVA4_N2C1T_Movies/editProfile';
	 			  }
	 			})
	 		    setTimeout(() => {
	 		    	window.location.href='http://localhost:8080/ASM_JAVA4_N2C1T_Movies/editProfile';
				 }, 10*1000);
			
		})
	});
	</script>
    </article>
  </main>
