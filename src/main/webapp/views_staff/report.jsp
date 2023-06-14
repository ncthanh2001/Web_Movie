	<%@ include file="/common/taglib.jsp" %>
<main>
    <article>

      <!-- 
        - #MOVIE DETAIL
      -->

      <section class=" movie-detail_s">
        <div class=" container_s d-flex justify-content-center ">
          <div class="movie-detail-content_s bg-signin_vidEdit rounded-3">



            <div class="">

              <div class="tab_s rounded-top ">
                <button class="tablinks_s border-end border-light text-light active h3_s "
                  onclick="openCity(event, 'Vid_Edit')">Favorites</button>
                <button class="tablinks_s border-end border-light text-light  h3_s"
                  onclick="openCity(event, 'Vid_List')">Favorites Users</button>
                <button class="tablinks_s border-end border-light text-light  h3_s"
                  onclick="openCity(event, 'Shared')">Shared Users</button>

              </div>


              <div id="Vid_Edit" class="tabcontent_s  "style="display: block;">
                <form action="/action_page.php">
                  <div class="">
                    <div class="row">
                      <div class="container mt-3">
                        <table class="table table-bordered text-light table-dark table-hover ">
                          <thead>
                            <tr>
                              <th>Video Title</th>
                              <th>TotalLike</th>
                              <th>Link</th>
                            </tr>
                          </thead>
                          <tbody>
                            <c:forEach items="${video }" var="item">
                            <tr>
                            	<td>${item.title }</td>
                            	<td>${item.totalLike }</td>
                            	<td><a href="video?action=watch&id=${item.href }">${item.href }</a></td>
                            </tr>
                            
                            </c:forEach>
                          </tbody>

                        </table>
                        <div class="row d-flex justify-content-center  mb-2  ">
                          <div class="col">

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
           <a class="btn-sm_s btn-primary_s mt-2" href="admin?page=${currentPage -1  }">
              <ion-icon name="chevron-back-outline"></ion-icon>  <ion-icon name="chevron-back-outline"></ion-icon>
            </a>
             <a class="btn-sm_s btn-primary_s mt-2" href="admin?page=${currentPage -1  }">
              <ion-icon name="chevron-back-outline"></ion-icon>
            </a>
          </c:if>
          
            <div class="btn-toolbar me-2 mx-3 " role="toolbar" aria-label="Toolbar with button groups">
				  <div class="btn-group me-2" role="group" aria-label="First group">
				  <c:forEach varStatus="i" begin="1" end = "${maxPage }">
				  <a href="admin?page=${i.index }" class="btn btn-outline-warning ${currentPage == i.index ? 'active' : '' }" style ="border-color: hsl(57, 97%, 45%)">${i.index }</a>
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
   					 <a class="btn-sm_s btn-primary_s mt-2 disabled" href="admin?page=${currentPage +1  }"> 
              <ion-icon name="chevron-forward-outline"></ion-icon>
            		</a>
            		<a class="btn-sm_s btn-primary_s mt-2 disabled"  href="admin?page=${currentPage +1  }">
            			<ion-icon name="chevron-forward-outline"></ion-icon><ion-icon name="chevron-forward-outline"></ion-icon>
            		</a>
   			</c:if>
           
          </div>
         </div>

                        </div>

                          </div>

                        </div>
                      </div>

                    </div>
                    <div class="row">

                    </div>

                  </div>

                </form>
              </div>

              <div id="Vid_List" class="tabcontent_s " >
                <div class="container mt-3">
                  <div class="row ">
                    <div class="col-2">
                      <p class="  text-light mt-2" style="font-size: 30px; line-height: 12px; font-weight: bold;">Video tittle</p>
                    </div>
                    <div class="col-10 mb-2">
                      <select id="selectVideo" class="form-select  border-1 border-warning" aria-label="Default select example">
                        <option selected disabled="disabled">Open this select menu</option>
                      <c:forEach  items="${video }" var="item" >
                        <option value="${item.href }">${item.title }</option>
                      
                      </c:forEach>
                    
                      </select>
                    </div>
                  </div>
                  <table id="dataVideoByHref" class="table table-bordered text-light table-dark table-hover mt-2" >
                    <thead>
                      <tr>
                        <th>Username</th>
                        <th>Email</th>


                      </tr>
                    </thead>
                    <tbody>


                   
                    </tbody>

                  </table>
                  <div class="row d-flex justify-content-center  mb-2  ">

                    <div class="col ">
                      <h4 class="h3_s">85 videos</h4>
                    </div>
                    <div class="col">

                  

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
    
    
 $('#selectVideo').change(function(){
	var videohref = $(this).val();
	$.ajax({
		url:'admin/favorites?href='+videohref , 
		type:'GET',
		contenType:'application/json'
	}).done(function(data){
		 $('#dataVideoByHref').DataTable({
			destroy:true,
			 "dom": "lfrti",
			"paging":false,
			"bPaginate": false,
			"lengthChange":false,
			"ordering":true,
			"searching":false,
			"autoWidth":false,
			"infor":true,
			"paging":true,
			"aaData":data,
			"columns":[{"data":"username"},
				{"data":"email"}]
		});
	}).fail(function(error){
		$('#dataVideoByHref').DataTable().clear().draw();
	})
});  
  </script>
