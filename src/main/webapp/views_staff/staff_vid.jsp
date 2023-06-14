<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="/common/head.jsp"%>


</head>

<body>
 <main>
    <article>

      <!-- 
        - #MOVIE DETAIL
      -->

	<jsp:include page="/views_staff/Nav_Staff.jsp"></jsp:include>
      <section class=" movie-detail_s">
        <div class=" container_s d-flex justify-content-center ">
          <div class="movie-detail-content_s bg-signin_vidEdit rounded-3">



            <div class="">

              <div class="tab_s rounded-top "> 
                <button class="tablinks_s border-end border-light text-light h3_s active"  onclick="openCity(event, 'Vid_Edit')">Video Edition</button>
                <button class="tablinks_s border-end border-light text-light  h3_s" onclick="openCity(event, 'Vid_List')">Video List</button>
              </div>


              <div id="Vid_Edit" class="tabcontent_s  " style="display: block; "  >
                
                  <div class="">
                    <div class="row">
                      <div class="col-3">

                        <figure class="movie-detail-banner_s">
                          <img src="${video !=null ? video.poster: '' }" alt="Free guy movie poster" id="imgPreview">
                          <label for="file" class="play-btn_s"></label>
                        </figure>

                      </div>
                      <div class="col-9">
                      <h5 style="color: red" id="mess"></h5>
                        <div class="row">
                          <div class="mb-3 mt-3 text-black">
                            <label for="title" class="text-light">Title :</label>
                            <input type="text" class="form-control mt-2" id="title" placeholder="Enter Video ID?"
                              name="title" value="${video !=null ? video.title : '' }">
                               <input type="hidden" class="form-control mt-2" id="isEdit" placeholder="Enter Video ID?"
                               value="${isEdit}">
                          </div>
                        </div>
                        <div class="row">
                          <div class="mb-3 mt-3 text-black">
                            <label for="href" class="text-light">Href:</label>
                            <input type="text" class="form-control mt-2" id="href" placeholder="Enter Video Tittle?"
                               value="${video !=null ? video.href : '' }">
                          </div>
                        </div>
                        <div class="row">
                          <div class="mb-3 mt-3 text-black">
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
                        <textarea class="form-control" id="description" rows="3" placeholder="Description ?">${video !=null ? video.desciption : '' }
                        </textarea>
                      </div>
                    </div>
                    <div class="row mb-2">             
                          <div class="col d-flex justify-content-center">
                            <button id="submitbtn" class="btn btn-dark  btn-outline-warning border border-warning d-flex me-2">
                              Submit
                            </button>
                            <button class="btn btn-dark  btn-outline-warning border border-warning d-flex me-2">
                             Update
                            </button>
                            <button class="btn btn-dark  btn-outline-warning border border-warning d-flex me-2">
                             Delete
                            </button>
                            <button id="resetbtn" class="btn btn-dark  btn-outline-warning border border-warning d-flex me-2">
                              Reset <!-- <button class="btn-sm_s btn-primary_s  me-2"> -->
                            </button>
                          </div>
                    </div>
                  </div>
  
              </div>

              <div id="Vid_List" class="tabcontent_s ">
                <div class="container mt-3">           
                  <table class="table table-bordered text-light table-dark table-hover ">
                    <thead>
                      <tr>
                        <th>Youtube ID</th>
                        <th>Video Title</th>
                        <th>View Count</th>
                        <th>Status</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>John</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                      </tr>
                       <tr>
                        <td>John</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                      </tr>
                       <tr>
                        <td>John</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                      </tr>
                       <tr>
                        <td>John</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                      </tr>
                       <tr>
                        <td>John</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                      </tr>
                       <tr>
                        <td>John</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                      </tr>
                       <tr>
                        <td>John</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                      </tr>
                       <tr>
                        <td>John</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                      </tr>
                       <tr>
                        <td>John</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                      </tr>
                       <tr>
                        <td>John</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                      </tr>
                       <tr>
                        <td>John</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                      </tr>
                       <tr>
                        <td>John</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                      </tr>
                       <tr>
                        <td>John</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                      </tr>
                       <tr>
                        <td>John</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                      </tr>
                       <tr>
                        <td>John</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                      </tr>
                       <tr>
                        <td>John</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                      </tr>
                    </tbody>
                  
                  </table>
                  <div class="row d-flex justify-content-center  mb-2  " >
       
                      <div class="col ">
                        <h4 class="h3_s">85 videos</h4>
                      </div>
                      <div class="col">

                        <div class="d-flex justify-content-end">
                          <button class="btn btn-dark  btn-outline-warning border border-warning d-flex me-2" >
                            <ion-icon name="chevron-back-outline" class="mt-1"></ion-icon> <ion-icon class="mt-1 mb-1" name="chevron-back-outline"></ion-icon>
                          </button>
                          <button class="btn btn-dark  btn-outline-warning border border-warning d-flex me-2">
                            <ion-icon name="chevron-back-outline" class="mt-1"></ion-icon>
                          </button>
                          <button class="btn btn-dark  btn-outline-warning border border-warning d-flex me-2">
                            <ion-icon name="chevron-forward-outline" class="mt-1"></ion-icon>
                          </button>
                          <button class="btn btn-dark  btn-outline-warning border border-warning d-flex me-2">
                            <ion-icon name="chevron-forward-outline" class="mt-1"></ion-icon> <ion-icon class="mt-1" name="chevron-forward-outline"></ion-icon>
                          </button>
                        </div>

                      </div>
              
                  </div>
                </div>

              </div>
            </div>

          </div>

        </div>
      </section>


    </article>
  </main>
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

			 	}else{
			 		url = '/ASM_JAVA4_N2C1T_Movies/admin/video?action=add';
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
			 		window.location.href="http://localhost:8080/ASM_JAVA4_N2C1T_Movies/admin/video?action=view"
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
</body>
</html>