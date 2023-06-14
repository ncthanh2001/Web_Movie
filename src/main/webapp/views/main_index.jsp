<%@ include file="/common/head.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
<main>
    <article>

      <!-- 
        - #HERO
      -->
      <section class="hero_s" >
        <div class="container_s">

          <div class="hero-content_s">

            <p class="hero-subtitle_s">Filmlane</p>

            <h1 class="h1_s hero-title_s">
              Unlimited <strong>Movie</strong>, TVs Shows, & More. ${sessionScope.messLogin}
            </h1>

            <div class="meta-wrapper_s">

              <div class="badge-wrapper_s">
                <div class="badge_s badge-fill_s">PG 18</div>

                <div class="badge_s badge-outline_s">HD</div>
              </div>

              <div class="ganre-wrapper_s">
                <a href="#">Romance,</a>

                <a href="#">Drama</a>
              </div>

              <div class="date-time_s">

                <div>
                  <ion-icon name="calendar-outline"></ion-icon>

                  <time datetime="2022">2022</time>
                </div>

                <div>
                  <ion-icon name="time-outline"></ion-icon>

                  <time datetime="PT128M">128 min</time>
                </div>

              </div>

            </div>
		<form action="#bodyindex">
            <button class="btn_s btn-primary_s" type="submit" > 
              <ion-icon name="play"></ion-icon>
              	
              <span>Watch now</span>
            </button>
		</form>
          </div>

        </div>
      </section>
      <!-- 
        - #TOP RATED
      -->

      <section class="top-rated_s"  id="bodyindex">
        <div class="container_s">

          <p class="section-subtitle_s">Online Streaming</p>

          
          <c:choose>
          <c:when test="${index != null }">
          <h2 class="h2_s section-title_s">Xem nhiều nhất</h2>
          </c:when>
          <c:when test="${favorites != null }">
           <h2 class="h2_s section-title_s">Trang yêu thích</h2>
          </c:when>
          <c:when test="${messSearch !=null }"> <h2 class="h2_s section-title_s">${messSearch }</h2></c:when>
          <c:otherwise>
               <h2 class="h2_s section-title_s">Lịch Sử</h2>
          </c:otherwise>
          </c:choose>

          <ul class="filter-list_s">

            <li>
              <button class="filter-btn_s">Movies</button>
            </li>

            <li>
              <button class="filter-btn_s">TV Shows</button>
            </li>

            <li>
              <button class="filter-btn_s">Documentary</button>
            </li>

            <li>
              <button class="filter-btn_s">Sports</button>
            </li>

          </ul>
  			<c:if test="${not empty mess }">
            <div class="alert alert-danger" role="alert">
  				${mess }
				</div>
            </c:if>
          <c:if test="${errSearch !=null }"> <h2 class="h2_s section-title_s">${errSearch }</h2></c:if>
          <ul class="movies-list_s">
			<c:forEach var="item" items = "${videos }">
			<li>
              <div class="movie-card_s">

                <a  
                ${not empty sessionScope.currentUser ? 'href=' : '' }'<c:url value = "/video?action=watch&id=${item.href }"></c:url>'
                onclick ="${ empty sessionScope.currentUser ? 'toast()' : '' }"
                
                >
                  <figure class="card-banner_s">
                    <img src="${item.poster }" alt="Sonic the Hedgehog 2 movie poster">
                  </figure>
                </a>

                <div class="title-wrapper_s">
                 
                  <a 
                    ${not empty sessionScope.currentUser ? 'href=' : '' }'<c:url value = "/video?action=watch&id=${item.href }"></c:url>'
                onclick ="${ empty sessionScope.currentUser ? 'toast()' : '' }"
                <%-- href='<c:url value = "/video?action=watch&id=${item.href }"></c:url>' --%>
                 >
                    <h3 class="card-title_s">${item.title }</h3>
                  </a>

                  <%-- <time datetime="2022">${item.views } views</time> --%>
                </div>

                <div class="card-meta_s">
                 <!--  <button class="badge_s badge-outline_s">Like <i class='bx bx-like '> </i></button>
                  <button class="badge_s badge-outline_s">Share  <i class='bx bx-share bx-flip-horizontal' ></i></button>
                  -->

                  <div class="duration_s">
                    <ion-icon name="eye-outline"></ion-icon>
					<time class = "PT122M"> ${item.views } views</time>
                   <!--  <time datetime="PT122M">122 min</time> -->
                  </div>

                  <div class="rating_s">
                  <ion-icon name="share-social-outline"></ion-icon>
                  <!-- <ion-icon name="star"></ion-icon>  -->
					<data class = "PT122M"> ${item.shares } shares</data>
                    <!-- <data>7.8</data> -->
                  </div>
                </div>

              </div>
            </li>
			</c:forEach>
          </ul>

        </div>

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
           <a class="btn-sm_s btn-primary_s mt-2" href="index?page=${currentPage -1  }">
              <ion-icon name="chevron-back-outline"></ion-icon>  <ion-icon name="chevron-back-outline"></ion-icon>
            </a>
             <a class="btn-sm_s btn-primary_s mt-2" href="index?page=${currentPage -1  }">
              <ion-icon name="chevron-back-outline"></ion-icon>
            </a>
          </c:if>
          
            <div class="btn-toolbar me-2 mx-3 " role="toolbar" aria-label="Toolbar with button groups">
				  <div class="btn-group me-2" role="group" aria-label="First group">
				  <c:forEach varStatus="i" begin="1" end = "${maxPage }">
				  <a href="index?page=${i.index }" class="btn btn-outline-warning ${currentPage == i.index ? 'active' : '' }" style ="border-color: hsl(57, 97%, 45%)">${i.index }</a>
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
   					 <a class="btn-sm_s btn-primary_s mt-2 disabled" href="index?page=${currentPage +1  }"> 
              			<ion-icon name="chevron-forward-outline"></ion-icon>
            		</a>
            		 <a class="btn-sm_s btn-primary_s mt-2 disabled" href="index?page=${currentPage +1  }"> 
              			<ion-icon name="chevron-forward-outline"></ion-icon><ion-icon name="chevron-forward-outline"></ion-icon>
            		</a>
   			</c:if>
           
          </div>
         </div>
  
      </section>
    </article>
  </main>
</body>
