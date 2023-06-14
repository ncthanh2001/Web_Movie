<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ include file="/common/taglib.jsp" %>
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
              <form action="register" method = "post" id="register-form">
                <h2 class="text-light fw-bold">SIGN UP</h2>

                <div class="row">
                  <div class="col">
                    <div class="mb-3 mt-3 text-light">
                      <label for="username">Username :</label>
                      <input type="text" class="form-control mt-2" id="username" placeholder="Enter Username?"
                        name="username">
                    </div>
                  </div>
                  <div class="col">
                    <div class="mb-3 mt-3 text-light">
                      <label for="fullname">Fullname :</label>
                      <input type="text" class="form-control mt-2" id="fullname" placeholder="Enter FullName?"
                        name="fullname">
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col">
                    <div class="mb-3 mt-3 text-light">
                      <label for="password">Password :</label>
                      <input type="password" class="form-control mt-2" id="password" placeholder="Enter password?"
                        name="pswd">
                    </div>
                  </div>
                  <div class="col">
                    <div class="mb-3 mt-3 text-light">
                      <label for="rsppw">Repeat your password :</label>
                      <input type="password" class="form-control mt-2" id="rsppw" placeholder="Enter Repeat your password?"
                        name="rspswd">
                    </div>
                  </div>
                </div>
                <div class="mb-3 mt-3 text-light">
                  <label for="email">Email :</label>
                  <input type="email" class="form-control mt-2" id="email" placeholder="Enter email?"
                    name="email">
                </div>

                <div class="form-check mb-3 text-light">
                  <label class="form-check-label d-flex  ">
                    <input class="form-check-input check-warning me-1 " type="checkbox" name="remember"> <p class="me-1">I agree all statements in</p>  <a href="" class="p-forgot">    Terms of service</a>
                  </label>
                </div>

                <div class="d-grid gap-3 ">
                  <button type="submit" class="btn_s btn-primary_s d-flex justify-content-center ">Register</button>
          
                  <hr class="border border-1 border-warning">
                  <label class="form-check-label d-flex  ">
                     <p class="text-light me-2">Have already an account ?</p>  <a href="login" class="p-forgot text-decoration-underline">    Login here</a>
                  </label>
                  <c:if test= "${messRegister!=null }">
                  <div class="alert alert-secondary" role="alert">
  					${messRegister }
						</div>
                  </c:if>
                  
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