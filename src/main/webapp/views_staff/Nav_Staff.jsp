<%@ include file="/common/taglib.jsp" %>
<header class="header_s" data-header>
    <div class="container_s">

      <div class="overlay_s" data-overlay></div>

      <a href="/ASM_JAVA4_N2C1T_Movies/iwelcom" class="logo_s d-flex align-items-end">
        <!-- <img src="./assets/images/logo.svg" alt="Filmlane logo"> -->
        <img src="./favicon.svg" alt=""> 
        <h5 class="h3_s"> ADMINISTRATION TOOL</h5>
      </a>


      <div class="header-actions_s">

        <div class="lang-wrapper_s">
          <label for="language">
            <ion-icon name="globe-outline"></ion-icon>
          </label>

          <select name="language" id="language">
            <option value="en">EN</option>
            <option value="au">AU</option>
            <option value="ar">AR</option>
            <option value="tu">TU</option>
          </select>
        </div>
        <div class="dropdown">
          <button type="button" class="btn_s btn-primary_s " data-bs-toggle="dropdown">
            <ion-icon name="person-circle-outline"></ion-icon>
          </button>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal" class="dropdown-item" href="#">Change Password</a></li>
            <li><a class="dropdown-item"  href="editProfile">Edit Profile</a></li>
            <li><a class="dropdown-item" href="/ASM_JAVA4_N2C1T_Movies/login">Log Out</a></li>
          </ul>
        </div>


      </div>

      <button class="menu-open-btn_s" data-menu-open-btn>
        <ion-icon name="reorder-two"></ion-icon>
      </button>

      <nav class="navbar_s" data-navbar>

        <div class="navbar-top_s">
          <a href="/ASM_JAVA4_N2C1T_Movies/iwelcom" class="logo_s">
            <img src="./assets/images/logo.svg" alt="Filmlane logo">
          </a>

          <button class="menu-close-btn_s" data-menu-close-btn>
            <ion-icon name="close-outline"></ion-icon>
          </button>

        </div>

        <ul class="navbar-list_s">

          <li>
            <a href="/ASM_JAVA4_N2C1T_Movies/iwelcom" class="navbar-link_s ${welecom !=null ?'active':'' }">Home</a>
          </li>
   			<li>
            <a href="/ASM_JAVA4_N2C1T_Movies/admin" class="navbar-link_s ${report !=null ? 'active':'' }">Reports</a>
          </li>
          <li>
            <a href='<c:url	value ="/admin/video?action=view"></c:url>' class="navbar-link_s ${edit_video!= null?'active':'' }">Edit_Video</a>
          </li>
   			<li>
            <a href='<c:url	value ="/admin/user?action=view"></c:url>' class="navbar-link_s ${edit_user!= null?'active':'' }">Edit_User</a>
          </li>    
			<li>
            <a href="/ASM_JAVA4_N2C1T_Movies/index" class="navbar-link_s">User Views</a>
          </li>
        </ul>

        <ul class="navbar-social-list_s">

          <li>
            <a href="#" class="navbar-social-link_s">
              <ion-icon name="logo-twitter"></ion-icon>
            </a>
          </li>

          <li>
            <a href="#" class="navbar-social-link_s">
              <ion-icon name="logo-facebook"></ion-icon>
            </a>
          </li>

          <li>
            <a href="#" class="navbar-social-link_s">
              <ion-icon name="logo-pinterest"></ion-icon>
            </a>
          </li>

          <li>
            <a href="#" class="navbar-social-link_s">
              <ion-icon name="logo-instagram"></ion-icon>
            </a>
          </li>

          <li>
            <a href="#" class="navbar-social-link_s">
              <ion-icon name="logo-youtube"></ion-icon>
            </a>
          </li>

        </ul>

      </nav>
<div class="modal fade " id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog modal-dialog-centered">
    <div class="modal-content bg-dark">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel "> <h2 class="text-light fw-bold">CHANGE PASSWORD</h2></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body bg-dark ">
      
        <div class=" container_s justify-content-center ">
        
          <div class="movie-detail-content_s rounded-3">
            <div class="container">
              
              
              
              
            <div class="row">
            
                  <div class="col">
                    <div class="mb-3 mt-3 text-light">
                      <label for="currentPass">Current password :</label>
                      <input type="password" class="form-control mt-2" id="currentPass" placeholder="Enter Current password?"
                        name="currentPass">
                    </div>
                  </div>
                </div>


    			 <div class="row">
            
                  <div class="col">
                    <div class="mb-3 mt-3 text-light">
                      <label for="password1">New password :</label>
                      <input type="password" class="form-control mt-2" id="password1" placeholder="Enter Current password?"
                        name="password1">
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col">
                    <div class="mb-3 mt-3 text-light">
                      <label for="password2">Repeat your password :</label>
                      <input type="rsppw" class="form-control mt-2" id="password2" placeholder="Enter Repeat your password?"
                        name="password2">
                    </div>
                  </div>
                </div>


            
                <!-- <button  class="btn_s btn-primary_s" formaction="">Register</button> -->


             <div class="text-primary fw-bold" id="messChangePass" ></div>
            </div>

          </div>

        </div>
      </div>
      <div class="modal-footer bg-dark">
          
        <button type="button" class="btn_s btn-primary_s" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn_s btn-primary_s" id="changePassbtn">Save changes</button> 
      </div>
    </div>
  </div>
</div>
    </div>
    <script >
	$('#changePassbtn').click(function(){
		$('#messChangePass').text('');
		var currentPass = $('#currentPass').val();
		var password1 = $('#password1').val();
		var password2 = $('#password2').val();
		var formData = {'currentPass':currentPass,
						'password1':password1,
						'password2':password2};
		$.ajax({
			url:'changePass',
			type:'POST',
			data: formData
		}).then(function(data){
			$('#messChangePass').text('ChangePass success');
			setTimeout(() => {
				window.location.href='http://localhost:8080/ASM_JAVA4_N2C1T_Movies/index';
			}, 10*1000);
		}).fail(function(errr){
			$('#messChangePass').removeAttr("class");
			$('#messChangePass').attr("class","text-danger fw-bold fs-3")
			$('#messChangePass').text('your information is not correct');
		})
	});
	</script>
  </header>
