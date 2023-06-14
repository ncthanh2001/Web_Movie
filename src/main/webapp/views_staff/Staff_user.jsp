
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
                <button class="tablinks_s border-end border-light text-light h3_s active"  onclick="openCity(event, 'Vid_Edit')">User Edition</button>
                <button class="tablinks_s border-end border-light text-light  h3_s" onclick="openCity(event, 'Vid_List')">User List</button>
              </div>


              <div id="Vid_Edit" class="tabcontent_s  " style="display: block; "  >
                <form action="/action_page.php">
                  <div class="">
                    <div class="row">
                      <!-- <div class="col-3">

                        <figure class="movie-detail-banner_s">
                          <img src="./assets/images/movie-4.png" alt="Free guy movie poster">
                          <label for="file" class="play-btn_s"></label>
                          <input type="file" name="" id="file" class="input_s">
                        </figure>

                      </div> -->
                      <!-- <div class="col-9"> -->
                        <div class="row">
                          <div class="col">
                            <div class="row">
                              <div class="mb-3 mt-3 text-black">
                                <label for="vidID" class="text-light">Video ID :</label>
                                <input type="text" class="form-control mt-2" id="vidID" placeholder="Enter Video ID?"
                                  name="vidID">
                              </div>
                            </div>
                            <div class="row">
                              <div class="mb-3 mt-3 text-black">
                                <label for="vidID" class="text-light">Video ID :</label>
                                <input type="text" class="form-control mt-2" id="vidID" placeholder="Enter Video ID?"
                                  name="vidID">
                              </div>
                            </div>
                          </div>
                          <div class="col">
                            <div class="row">
                              <div class="mb-3 mt-3 text-black">
                                <label for="vidID" class="text-light">Video ID :</label>
                                <input type="text" class="form-control mt-2" id="vidID" placeholder="Enter Video ID?"
                                  name="vidID">
                              </div>
                            </div>
                            <div class="row">
                              <div class="mb-3 mt-3 text-black">
                                <label for="vidID" class="text-light">Video ID :</label>
                                <input type="text" class="form-control mt-2" id="vidID" placeholder="Enter Video ID?"
                                  name="vidID">
                              </div>
                            </div>
                          </div>

                       
                        </div>
                      <!-- </div> -->
                    </div>
                  
                    <div class="row mb-2">             
                          <div class="col d-flex justify-content-end">
                            <button class="btn btn-dark  btn-outline-warning border border-warning d-flex me-2">
                             Update
                            </button>
                            <button class="btn btn-dark  btn-outline-warning border border-warning d-flex me-2">
                             Delete
                            </button>
                          </div>
                    </div>
                  </div>
  
                </form>
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
                        <td>Mary</td>
                        <td>Moe</td>
                        <td>mary@example.com</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                      </tr>
                      <tr>
                        <td>July</td>
                        <td>Dooley</td>
                        <td>july@example.com</td>
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
  <script src="./assets/js/script.js"></script>

  <!-- 
    - ionicon link
  -->
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
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
