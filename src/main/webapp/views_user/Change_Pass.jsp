 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
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
              <form action="/action_page.php">
                <h2 class="text-light fw-bold">CHANGE PASSWORD</h2>

                <div class="row">
                  <div class="col">
                    <div class="mb-3 mt-3 text-light">
                      <label for="username">Username :</label>
                      <input type="username" class="form-control mt-2" id="username" placeholder="Enter Username?"
                        name="username">
                    </div>
                  </div>
                  <div class="col">
                    <div class="mb-3 mt-3 text-light">
                      <label for="fullname">Current password :</label>
                      <input type="fullname" class="form-control mt-2" id="fullname" placeholder="Enter Current password?"
                        name="fullname">
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col">
                    <div class="mb-3 mt-3 text-light">
                      <label for="password">New Password :</label>
                      <input type="password" class="form-control mt-2" id="password" placeholder="Enter new password?"
                        name="password">
                    </div>
                  </div>
                  <div class="col">
                    <div class="mb-3 mt-3 text-light">
                      <label for="rsppw">Repeat your password :</label>
                      <input type="rsppw" class="form-control mt-2" id="rsppw" placeholder="Enter Repeat your password?"
                        name="rsppw">
                    </div>
                  </div>
                </div>

                <div class="d-grid gap-3 ">
                  <button type="submit" class="btn_s btn-primary_s d-flex justify-content-center ">Change Password</button>
                </div>
                <!-- <button  class="btn_s btn-primary_s" formaction="">Register</button> -->


              </form>
            </div>

          </div>

        </div>
      </section>


    </article>
  </main>
	
</body>
</html>