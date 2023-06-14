<%@ include file="/common/taglib.jsp"%>
<main>
    <article>

      <!-- 
        - #MOVIE DETAIL
      -->

      <section class=" movie-detail_s">
        <div class=" container_s d-flex justify-content-center ">
          <div class="movie-detail-content_s bg-signin_vidEdit rounded-3"  style="max-height: 10000px; background-color: #201f25;">
	<div class="d-flex justify-content-center  mb-1"><strong class="text-light fs-1 fw-bold">USERS MANAGEMENT</strong></div>




            <div class="">

              <div class="tab_s rounded-top ">
             <!--    <button class="tablinks_s border-end border-light text-light active h3_s "
                  onclick="openCity(event, 'Vid_Edit')">List Video</button>
                <button class="tablinks_s border-end border-light text-light  h3_s"
                  onclick="openCity(event, 'Vid_List')">Favorites Users</button>
                <button class="tablinks_s border-end border-light text-light  h3_s"
                  onclick="openCity(event, 'Shared')">Shared Users</button>
 -->
              </div>


              <div id="Vid_Edit" class="tabcontent_s  "style="display: block;">
       <!--      <form >  -->
       
       <div class="">
                    <div class="row">
               			<div class="col-1"></div>
                      <div class="col-10">
                      <h5 style="color: red" id="mess"></h5>
                        <div class="row">
                          <div class="mb-1 mt-1 text-black">
                            <label for="username" class="text-light">Username :</label>
                            <input type="text" class="form-control mt-2" id="username" placeholder="Enter Video ID?"
                              name="username" value="${video !=null ? video.username : '' }">
                               <input type="hidden" class="form-control mt-2" id="isEdit" placeholder="Enter Video ID?"
                               value="${isEdit}">
                          </div>
                        </div>
                        <div class="row">
                          <div class="mb-1 mt-1 text-black">
                            <label for="fullname" class="text-light">Fullname:</label>
                            <input type="text" class="form-control mt-2" id="fullname" placeholder="Enter Video Tittle?"
                               value="${video !=null ? video.fullname : '' }">
                          </div>
                        </div>
                        <div class="row">
                          <div class="mb-1 mt-1 text-black">
                            <label for="email" class="text-light">Email :</label>
                            <input type="text" class="form-control mt-2" id="email"  placeholder="Enter Video Poster"
                             value="${video !=null ? video.email : '' }" >
                          </div>
                        </div>
                    
                      </div>
                    </div>
                    
                    <div class="row mb-2 mt-2">             
                          <div class="col d-flex justify-content-center">
                            <button id="submitbtn" class="btn btn-dark  btn-outline-warning border border-warning d-flex me-2">
                              Submit
                            </button>
                            <button id="resetbtn" class="btn btn-dark  btn-outline-warning border border-warning d-flex me-2">
                              Reset <!-- <button class="btn-sm_s btn-primary_s  me-2"> -->
                            </button>
                          </div>
                    </div>
                  </div>
       
                  <div class="">
                    <div class="row">
                      <div class="container mt-3">
                        <table class="table table-bordered text-light table-dark table-hover border border-success">
                          <thead>
                            <tr>
								<th>Username</th>
								<th>Fullname</th>
								<th>Email</th>
								<th>Action</th>
                            </tr>
                          </thead>
                          <tbody class = "align-middle">
                            <c:forEach items="${videos }" var="item">
                            <tr>
								<td>${item.username }</td>
								<td>${item.fullname }</td>
								<td>${item.email }</td>
								<td>
								<div class="row">
                            		<div class="col">
	                            	 <a  class = "text-primary " href='<c:url value="/admin/user?action=edit&username=${item.username }"></c:url>' >
	                            		 <ion-icon name="create-outline"></ion-icon>
	                            		</a> 
                            		</div> 
                            		<div class="col">
	                            	 	<button class = "text-danger " onclick="deleteVideo('${item.username}')"> 
	                            			<ion-icon name="trash-outline"></ion-icon>
	                            		 </button> 
                            		</div>
                            	</div>
								</td>
                            </tr>
                            
                            </c:forEach>
                          </tbody>

                        </table>
                        <div class="row d-flex justify-content-center  mb-2  ">
                          <div class="container-btn-box_s">
          <div class="btn-move_s">
          <c:if test="${currentPage == 1 }">
          
            <a class="btn-sm_s btn-primary_s mt-2 disabled" disabled >
             <ion-icon name="chevron-back-outline"></ion-icon> <ion-icon name="chevron-back-outline"></ion-icon>
            </a>

           <a class="btn-sm_s btn-primary_s mt-2">
              <ion-icon name="chevron-back-outline"></ion-icon>
            </a>
          </c:if>
          <c:if test="${currentPage > 1 }">
           <a class="btn-sm_s btn-primary_s mt-2" href="user?action=view&page=${currentPage -1  }">
              <ion-icon name="chevron-back-outline"></ion-icon>  <ion-icon name="chevron-back-outline"></ion-icon>
            </a>
             <a class="btn-sm_s btn-primary_s mt-2" href="user?action=view&page=${currentPage -1  }">
              <ion-icon name="chevron-back-outline"></ion-icon>
            </a>
          </c:if>
          
            <div class="btn-toolbar me-2 mx-3 " role="toolbar" aria-label="Toolbar with button groups">
				  <div class="btn-group me-2" role="group" aria-label="First group">
				  <c:forEach varStatus="i" begin="1" end = "${maxPage }">
				  <a href="user?action=view&page=${i.index }" class="btn btn-outline-warning ${currentPage == i.index ? 'active' : '' }" style ="border-color: hsl(57, 97%, 45%)">${i.index }</a>
				  </c:forEach>
				  </div>
			</div>
              <c:if test="${currentPage == maxPage  }">
     				 <button class="btn-sm_s btn-primary_s mt-2 disabled">
             			 <ion-icon name="chevron-forward-outline"></ion-icon>
            		</button>
		            <button class="btn-sm_s btn-primary_s mt-2 disabled">
		              <ion-icon name="chevron-forward-outline"></ion-icon><ion-icon name="chevron-forward-outline"></ion-icon>
		            </button>
  			 </c:if>
  			 <c:if test="${currentPage < maxPage  }">
   					 <a class="btn-sm_s btn-primary_s mt-2 disabled" href="user?action=view&page=${currentPage +1  }"> 
              <ion-icon name="chevron-forward-outline"></ion-icon>
            		</a>
            		<a class="btn-sm_s btn-primary_s mt-2 disabled"  href="user?action=view&page=${currentPage +1  }">
            			<ion-icon name="chevron-forward-outline"></ion-icon><ion-icon name="chevron-forward-outline"></ion-icon>
            		</a>
   			</c:if>
           
          </div>
         </div>

                        </div>
                      </div>

                    </div>
                    <div class="row">

                    </div>	

                  </div>

               <!-- </form>  -->
              </div>

              
  <input type="hidden" class="form-control mt-2" id="isEdit" placeholder="Enter Video ID?"
                               value="${isEdit}">
              
            </div>

          </div>

        </div>
      </section>


    </article>
    <script>
    function openCity(evt, cityName) {
      var i, tabcontent, tablinks;
      tabcontent = document.getElementsByClassName("tabcontent_s");
      for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
      }
      tablinks = document.getElementsByClassName("tablinks_s");
      for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
      }
      document.getElementById(cityName).style.display = "block";
      evt.currentTarget.className += " active";
    }
  
    

  </script>
   <script >
  
  function deleteVideo(username){
	  $.ajax({
	  		url:'/ASM_JAVA4_N2C1T_Movies/admin/user?action=delete&username='+username
	  	}).then(function(data){
	  		window.location.href=" ";
	  	}).fail(function(error){
	  		alert("Opps!")
	  	}) 

		}
  </script> 
  <script >
		var usernameOrigin , fullnameOrigin , emailOrigin ;
		$(document).ready(function(){
			usernameOrigin  = $('#username').val()
			fullnameOrigin = $('#fullname').val()
			emailOrigin = $('#email').val()
			
		});
		
		 $('#resetbtn').click(function(){
						 $('#username').val(usernameOrigin)
						 $('#fullname').val(fullnameOrigin)
						 $('#email').val( emailOrigin)
		 })
		 
		 $('#submitbtn').click(function(){
			 	$('#mess').text('');
			 	var url;
			 	var isEdit = $('#isEdit').val();
			 	if(isEdit == 'true'){
			 	
			 		url = '/ASM_JAVA4_N2C1T_Movies/admin/user?action=edit&username='+usernameOrigin ;

			 	}
			 	else{
			 		url='/ASM_JAVA4_N2C1T_Movies/admin/user?action=view'
			 	}
			 	var formData = {
			 			'username':$('#username').val(),
			 			'fullname':$('#fullname').val(),
			 			'email':$('#email').val(),
			 			'usernameOrigin':usernameOrigin
			 			
			 	};
			 	
			 	$.ajax({
			 		url:url,
			 		type:'POST',
			 		data:formData
			 	}).then(function(data){
			 		
			 			Swal.fire({
				 			  title: 'Success',
				 			  text: "Update Thành công",
				 			  icon: 'success',
				 			  showCancelButton: true,
				 			  confirmButtonText: 'ok'
				 			}).then((result) => {
				 			  if (result.isConfirmed) {
				 				 window.location.href="http://localhost:8080/ASM_JAVA4_N2C1T_Movies/admin/user?action=view"
				 			  }else{
				 				 window.location.href="http://localhost:8080/ASM_JAVA4_N2C1T_Movies/admin/user?action=view"
				 			  }
				 			})
				 		    setTimeout(() => {
				 		    	window.location.href="http://localhost:8080/ASM_JAVA4_N2C1T_Movies/admin/user?action=view"
	     					 }, 5000);

			 	
			 	}).fail(function(error){
			 		$('#mess').text('opp!')
			 	});
		 })
		 
	
	$('#href').change(function(){
		var poster = "https://img.youtube.com/vi/"+ $('#href').val() +"/maxresdefault.jpg";
		$('#poster').attr('value',poster);
			var newSrc = $('#poster').val();
			$('#imgPreview').attr('src',newSrc);
		/* $('#poster').change(function(){
		}); */
	})
</script>
  </main>
  

  
