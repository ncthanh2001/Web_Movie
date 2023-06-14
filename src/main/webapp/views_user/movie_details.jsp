	<%@ include file="/common/taglib.jsp"%>
<main>
    <article>

      <!-- 
        - #MOVIE DETAIL
      -->

      <section class="movie-detail_s">
        <div class="container_s">

          <figure class="movie-detail-banner_s">

            <!-- <img src="./assets/images/movie-4.png1" alt="Free guy movie poster"> -->
			<iframe src = "https://www.youtube.com/embed/${video.href }" style="width: 500px ; height: 300px"> </iframe>
			<input type="hidden" id="href" value="${video.href }">
          <!--   <button class="play-btn_s">
              <ion-icon name="play-circle-outline"></ion-icon>
            </button> -->

          </figure>

          <div class="movie-detail-content_s">

            <!-- <p class="detail-subtitle_s">New Episodes</p> -->

            <h1 class="h1_s detail-title_s">
              ${video.title } <!-- <strong>Guy</strong> -->
            </h1>

            <div class="meta-wrapper_s">

			<c:if test="${not empty sessionScope.currentUser }">
              <div class="badge-wrapper_s">
              <button id ="likeOrUnlikeBtn"  class="badge_s badge-outline_s ">
              <c:choose>
              <c:when test="${flagLikedBtn == true }">
              	Unlike
              </c:when>
              <c:otherwise>
              	Like
              </c:otherwise>
              </c:choose>
               <i class='bx bx-like '> </i> </button>
    			 <a class="badge_s badge-outline_s " type="button" data-bs-toggle="modal" data-bs-target="#shareVidByEmailModal"
    			  class="dropdown-item" href="#">Share <i class='bx bx-share bx-flip-horizontal'></i> </a>


                <!-- <div class="badge_s badge-outline_s">HD</div> -->
              </div>
			</c:if>

              <div class="ganre-wrapper_s">
                <a href="#">Comedy1,</a>

                <a href="#">Action,</a>

                <a href="#">Adventure,</a>

                <a href="#">Science Fiction</a>
              </div>

              <div class="date-time_s">

                <div>
                  <ion-icon name="calendar-outline"></ion-icon>

                  <time datetime="2021">2021</time>
                </div>

                <div>
                  <ion-icon name="time-outline"></ion-icon>

                  <time datetime="PT115M">115 min</time>
                </div>

              </div>

            </div>

            <p class="storyline_s">
              ${video.desciption }
            </p>

 

              <button class="btn_s btn-primary_s"
                data-bs-toggle="modal" data-bs-target="#watchNow">
                <ion-icon name="play"></ion-icon>

                <span>Watch Now</span>
              </button>
          

    <!-- download now -->
          </div>

        </div>
      </section>





      <!-- 
        - #TV SERIES
      -->

      <section class="tv-series_s">
        <div class="container_s">

          <p class="section-subtitle_s">Best TV Series</p>

          <h2 class="h2_s section-title_s">Recently</h2>
          <hr class="border border-1 border-warning"> 
          <ul class="movies-list_s">
					<c:forEach var="item" items = "${videos }">
					<li>
              <div class="movie-card_s">

                <a href='<c:url value = "/video?action=watch&id=${item.href }"></c:url>'>
                  <figure class="card-banner_s">
                    <img src="${item.poster }" alt="Moon Knight movie poster">
                  </figure>
                </a>

                <div class="title-wrapper_s">
                  <a href='<c:url value = "/video?action=watch&id=${item.href }"></c:url>'>
                    <h3 class="card-title_s">${item.title }</h3>
                  </a>

                  <time datetime="2022">2022</time>
                </div>

                <div class="card-meta_s">
                  <div class="badge_s duration_s " style="margin-left: inherit;">
					 <ion-icon name="eye-outline"></ion-icon>
					<time class = "PT122M"> ${item.views } views</time>
					</div>

                  <div class="duration_s">
                    <ion-icon name="share-social-outline""></ion-icon>

                    <time datetime="PT47M">${item.shares }</time>
                  </div>

                  <div class="rating_s">
                    <ion-icon name="star"></ion-icon>

                    <data>8.6</data>
                  </div>
                </div>

              </div>
            </li>
					
					 </c:forEach>
            

          </ul>
          <!-- move -->
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
           <a class="btn-sm_s btn-primary_s mt-2" href='<c:url value ="video?action=watch&id=${video.href }&page=${currentPage -1 }"></c:url>'> 
              <ion-icon name="chevron-back-outline"></ion-icon>  <ion-icon name="chevron-back-outline"></ion-icon>
            </a>
              <a class="btn-sm_s btn-primary_s mt-2" href='<c:url value ="video?action=watch&id=${video.href }&page=${currentPage -1 }"></c:url>'>
              <ion-icon name="chevron-back-outline"></ion-icon>
            </a>
          </c:if>
           <div class="btn-toolbar me-2 mx-3 " role="toolbar" aria-label="Toolbar with button groups">
				  <div class="btn-group me-2" role="group" aria-label="First group">
				  <c:forEach varStatus="i" begin="1" end = "${maxPage }">
				  <a href='<c:url value ="video?action=watch&id=${video.href }&page=${i.index }"></c:url>' class="btn btn-outline-warning ${currentPage == i.index ? 'active' : '' }" style ="border-color: hsl(57, 97%, 45%)">${i.index }</a>
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
   					 <a class="btn-sm_s btn-primary_s mt-2 disabled" href='<c:url value ="video?action=watch&id=${video.href }&page=${currentPage +1 }"></c:url>'> 
              <ion-icon name="chevron-forward-outline"></ion-icon>
            		</a>
            		<a class="btn-sm_s btn-primary_s mt-2 disabled"  href='<c:url value ="video?action=watch&id=${video.href }&page=${currentPage +1 }"></c:url>'>
            			<ion-icon name="chevron-forward-outline"></ion-icon><ion-icon name="chevron-forward-outline"></ion-icon>
            		</a>
   			</c:if>
           
          </div>
         </div>
        </div>
      </section>
      
      <!-- modal watch -->
      <div class="modal fade " id="watchNow" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog  modal-xl modal-dialog-centered">
    <div class="modal-content " style="background-color: rgba(33,37,41,0);" >
      
      <div class="modal-header text-ligt" style="border-bottom: none">
        <h5 class="modal-title" id="exampleModalLabel "> <h2 class="text-light fw-bold"></h2></h5>
        <button type="button" class="btn-close text-light" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body  " >
                 <iframe src = "https://www.youtube.com/embed/${video.href }" style="width: 100% ; height: 500px"> </iframe>
     </div> 
    </div>
  </div>
</div>
      
      
      <!-- modal share -->
      <div class="modal fade " id="shareVidByEmailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog modal-dialog-centered">
    <div class="modal-content bg-dark">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel "> <h2 class="text-light fw-bold">Share Video</h2></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body bg-dark ">
      
        <div class=" container_s justify-content-center ">
        
          <div class="movie-detail-content_s rounded-3">
            <div class="container">
              
              
              
              
            <div class="row">
            
                  <div class="col">
                    <div class="mb-3 mt-3 text-light">
                      <label for="currentPass">Enter Email :</label>
                      <input type="email" class="form-control mt-2" id="email" placeholder="Enter email ?"
                        name="email">
                    </div>
                  </div>
                </div>

            
                <!-- <button  class="btn_s btn-primary_s" formaction="">Register</button> -->


             <div class="text-primary fw-bold" id="messShareVidEmail" ></div>
            </div>

          </div>

        </div>
      </div>
      <div class="modal-footer bg-dark">
          
        <button type="button" class="btn_s btn-primary_s" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn_s btn-primary_s" id="sendEmail">Send Email</button> 
      </div>
    </div>
  </div>
</div>
	<input type="hidden" id = "videoId" value="${video.href }">
    </article>
    <script >
	$('#sendEmail').click(function(){
		$('#messShareVidEmail').text('');
		var href = $('#href').val();	
		var formData = {'email':$('#email').val(),
							'href':href	};
		$.ajax({
			url:'/ASM_JAVA4_N2C1T_Movies/video?action=share',
			type:'POST',
			data: formData
		}).then(function(data){
			
			Swal.fire({
	 			  title: 'succes',
	 			  text: "Share Successs",
	 			  icon: 'success',
	 			  showCancelButton: true,
	 			  confirmButtonText: 'ok'
	 			}).then((result) => {
	 			  if (result.isConfirmed) {
	 				 window.location.href='http://localhost:8080/ASM_JAVA4_N2C1T_Movies/video?action=watch&id='+href;
	 			  }else{
	 				 window.location.href='http://localhost:8080/ASM_JAVA4_N2C1T_Movies/video?action=watch&id='+href;
	 			  }
	 			})
	 		    setTimeout(() => {
	 		    	window.location.href='http://localhost:8080/ASM_JAVA4_N2C1T_Movies/video?action=watch&id='+href;
				 }, 10*1000);
			
		}).fail(function(errr){	
			$('#messShareVidEmail').removeAttr("class");
			$('#messShareVidEmail').attr("class","text-danger fw-bold fs-3")
			$('#messShareVidEmail').text('your information is not correct');
		})
	});
	</script>
    
    <script >
	$('#likeOrUnlikeBtn').click(function(){
		var vId = $('#videoId').val()
		$.ajax({
			url:'video?action=like&id='+vId
		}).then(function(data){
			var text = $('#likeOrUnlikeBtn').text();
			if(text.indexOf('Like') != -1){
				$('#likeOrUnlikeBtn').text('Unlike')
			}else{
				$('#likeOrUnlikeBtn').text('Like')
			}
		}).fail(function(errr){
			alert('like failed')
		})
	});
</script>
  </main>


