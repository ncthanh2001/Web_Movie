<%@ include file="/common/taglib.jsp"%>
<main>
    <article>

      <!-- 
        - #MOVIE DETAIL
      -->

      <section class=" movie-detail_s">
        <div class=" container_s d-flex justify-content-center ">
          <div class="movie-detail-content_s bg-signin_vidEdit rounded-3"  style="max-height: 10000px; background-color: #201f25;">
				<div class="d-flex justify-content-center  mb-1"><strong class="text-light fs-1 fw-bold">VIDEO MANAGEMENT</strong></div>



            <div class="">
            <div class="tab_s rounded-top ">
                <!--   <button class="tablinks_s border-end border-light text-light active h3_s "
                  onclick="openCity(event, 'Vid_Edit')">List Video</button>
                <button class="tablinks_s border-end border-light text-light  h3_s"
                  onclick="openCity(event, 'Vid_List')">Favorites Users</button>
                <button class="tablinks_s border-end border-light text-light  h3_s"
                  onclick="openCity(event, 'Shared')">Shared Users</button>-->

              </div> 


              <div id="Vid_Edit" class="tabcontent_s  "style="display: block;">
       <!--      <form >  -->
       
       <div class="">
                    <div class="row">
                      <div class="col-3 mt-5">

                        <figure class="movie-detail-banner_s">
                          <img src="${video !=null ? video.poster: '' }" alt="Free guy movie poster" id="imgPreview" height="170px">
                          <label for="file" class="play-btn_s"></label>
                        </figure>

                      </div>
                      <div class="col-9">
                      <h5 style="color: red" id="mess"></h5>
                        <div class="row">
                          <div class="mb-1 mt-1 text-black">
                            <label for="title" class="text-light">Title :</label>
                            <input type="text" class="form-control mt-2" id="title" placeholder="Enter Video ID?"
                              name="title" value="${video !=null ? video.title : '' }">
                               <input type="hidden" class="form-control mt-2" id="isEdit" placeholder="Enter Video ID?"
                               value="${isEdit}">
                          </div>
                        </div>
                        <div class="row">
                          <div class="mb-1 mt-1 text-black">
                            <label for="href" class="text-light">Href:</label>
                            <input type="text" class="form-control mt-2" id="href" placeholder="Enter Video Tittle?"
                               value="${video !=null ? video.href : '' }">
                          </div>
                        </div>
                        <div class="row">
                          <div class="mb-1 mt-1 text-black">
                            <label for="poster" class="text-light">Poster :</label>
                            <input type="text" class="form-control mt-2" id="poster"  placeholder="Enter Video Poster"
                             value="${video !=null ? video.poster : '' }" >
                          </div>
                        </div>
                    
                      </div>
                    </div>
                    <div class="row">
                      <div class="mb-3 mt-3 text-black">
                        <label for="description" class="text-light">Description</label>
                        <textarea class="form-control" id="description" rows="3" cols="50" placeholder="Description ?">${video !=null ? video.desciption : '' }
                        </textarea>
                      </div>
                    </div>
                    <div class="row mb-2">             
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
                              <th>Poster</th>
                              <th>Video Title</th>
                              <th>Description</th>
                              <th>Link</th>
                              <th>Action_</th>
                            </tr>
                          </thead>
                          <tbody class = "align-middle">
                            <c:forEach items="${videos }" var="item">
                            <tr>
                            	<td>
                            		<img alt="" src="${item.poster }" width="250px" height="200px">
                            	</td>
                            	<td>${item.title }</td>
                            	<td>${item.desciption }</td>
                            	<td><a class = "text-light"  href='<c:url value="/video?action=watch&id=${item.href}"></c:url>'>${item.href}</a></td>
                            
                            	<td>
                            	<div class="row">
                            		<div class="col"><a  class = "text-primary " href='<c:url value="/admin/video?action=edit&href=${item.href }"></c:url>' ><ion-icon name="create-outline"></ion-icon></a>
                            		</div> 
                            		<div class="col"><button class = "text-danger " onclick="deleteVideo('${item.href}')"><ion-icon name="trash-outline"></ion-icon></button> 
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
           <a class="btn-sm_s btn-primary_s mt-2" href="video?action=view&page=${currentPage -1  }">
              <ion-icon name="chevron-back-outline"></ion-icon>  <ion-icon name="chevron-back-outline"></ion-icon>
            </a>
             <a class="btn-sm_s btn-primary_s mt-2" href="video?action=view&page=${currentPage -1  }">
              <ion-icon name="chevron-back-outline"></ion-icon>
            </a>
          </c:if>
          
            <div class="btn-toolbar me-2 mx-3 " role="toolbar" aria-label="Toolbar with button groups">
				  <div class="btn-group me-2" role="group" aria-label="First group">
				  <c:forEach varStatus="i" begin="1" end = "${maxPage }">
				  <a href="video?action=view&page=${i.index }" class="btn btn-outline-warning ${currentPage == i.index ? 'active' : '' }" style ="border-color: hsl(57, 97%, 45%)">${i.index }</a>
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
   					 <a class="btn-sm_s btn-primary_s mt-2 disabled" href="video?action=view&page=${currentPage +1  }"> 
              <ion-icon name="chevron-forward-outline"></ion-icon>
            		</a>
            		<a class="btn-sm_s btn-primary_s mt-2 disabled"  href="video?action=view&page=${currentPage +1  }">
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
  
  function deleteVideo(href){
	  $.ajax({
	  		url:'/ASM_JAVA4_N2C1T_Movies/admin/video?action=delete&href='+href
	  	}).then(function(data){
	  		window.location.href=" ";
	  	}).fail(function(error){
	  		alert("lỗi!")
	  	}) 

		}
  </script> 
  <script >
		var titleOrigin , hrefOrigin , descriptionOrigin , posterOrigin;
		$(document).ready(function(){
			titleOrigin  = $('#title').val()
			hrefOrigin = $('#href').val()
			descriptionOrigin = $('#description').val()
			 posterOrigin = $('#poster').val()
			
		});
		
		 $('#resetbtn').click(function(){
			 $('#title').val(titleOrigin)
						 $('#href').val(hrefOrigin)
						 $('#description').val(descriptionOrigin)
						 $('#poster').val( posterOrigin)
						 if(posterOrigin.length >0){
							 $('#imgPreview').attr('src',posterOrigin);
						 }
		 })
		 
		 $('#submitbtn').click(function(){
			 	$('#mess').text('');
			 	var url;
			 	var isEdit = $('#isEdit').val();
			 	if(isEdit == 'true'){
			 	
			 		url = '/ASM_JAVA4_N2C1T_Movies/admin/video?action=edit&href='+hrefOrigin ;
			 		var mess = "update success" 
			 		var err = "update fail"
			 	}else{
			 		url = '/ASM_JAVA4_N2C1T_Movies/admin/video?action=add';
			 		var mess = "add success" 
				 		var err = "add fail"
			 	}
			 	var formData = {
			 			'hrefOrigin':hrefOrigin,
			 			'title':$('#title').val(),
			 			'description':$('#description').val(),
			 			'newHref': $('#href').val(),
			 			'poster':$('#poster').val()
			 			
			 	};
			 	
			 	$.ajax({
			 		url:url,
			 		type:'POST',
			 		data:formData
			 	}).then(function(data){
			 		Swal.fire({
			 			  title: 'Success',
			 			  text: mess,
			 			  icon: 'success',
			 			  showCancelButton: true,
			 			  confirmButtonText: 'ok'
			 			}).then((result) => {
			 			  if (result.isConfirmed) {
			 					window.location.href="http://localhost:8080/ASM_JAVA4_N2C1T_Movies/admin/video?action=view"
			 			  }else{
			 					window.location.href="http://localhost:8080/ASM_JAVA4_N2C1T_Movies/admin/video?action=view"
			 			  }
			 			})
			 		    setTimeout(() => {
			 				window.location.href="http://localhost:8080/ASM_JAVA4_N2C1T_Movies/admin/video?action=view"
   					 }, 5000);
			 
			 	}).fail(function(error){
			 		Swal.fire({
			 			  title: 'Success',
			 			  text: err,
			 			  icon: 'error',
			 			  showCancelButton: true,
			 			  confirmButtonText: 'ok'
			 			}).then((result) => {
			 			  if (result.isConfirmed) {
			 					window.location.href="http://localhost:8080/ASM_JAVA4_N2C1T_Movies/admin/video?action=view"
			 			  }else{
			 					window.location.href="http://localhost:8080/ASM_JAVA4_N2C1T_Movies/admin/video?action=view"
			 			  }
			 			})
			 		    setTimeout(() => {
			 				window.location.href="http://localhost:8080/ASM_JAVA4_N2C1T_Movies/admin/video?action=view"
 					 }, 5000);
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
  

  
