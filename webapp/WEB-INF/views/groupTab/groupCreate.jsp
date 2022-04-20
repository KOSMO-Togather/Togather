<%@ page contentType="text/html;charset=utf-8" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Togather</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Favicons -->
    <link href="/assets/img/favicon.png" rel="icon" />
    <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
      rel="stylesheet"
    />

    <!-- Vendor CSS Files -->
    <link href="/assets/vendor/animate.css/animate.min.css" rel="stylesheet" />
    <link href="/assets/vendor/aos/aos.css" rel="stylesheet" />
    <link
      href="/assets/vendor/bootstrap/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
      rel="stylesheet"
    />

    <link
      href="/assets/vendor/bootstrap-icons/bootstrap-icons.css"
      rel="stylesheet"
    />
    <link
      href="/assets/vendor/boxicons/css/boxicons.min.css"
      rel="stylesheet"
    />
    <link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />
    <!-- alert -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <!-- Template Main CSS File -->
    <link href="/assets/css/style.css" rel="stylesheet" />
    <script
      type="text/javascript"
      src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"
    ></script>

    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script>
      Kakao.init("11400a9267d93835389eb9255fcaad0b");
      function signout() {
        if (Kakao.Auth.getAccessToken() != null) {
          Kakao.Auth.logout(function () {
            setTimeout(function () {
              location.href = "../member/logout.do";
            }, 500);
          });
        } else {
          location.href = "../member/logout.do";
        }
      }
    </script>
    <script>
      function reset() {
        if ($("#category_firstCheck1").val() != 1) {
          $("#category_first1").val("");
          console.log("카테고리1");
        }
        $("#ul2").remove();
        $("#ul3").remove();
        $("#button2").remove();
        $("#button3").remove();

        $("#Selectbutton").remove();
        var div2 = "";
        div2 +=
          "<button id='button2' type='button' class='btn btn-outline-light dropdown-toggle' onclick='javascript:reset2()' data-bs-toggle='dropdown' aria-expanded='false' style='color: black; border-color: black'>";
        div2 += "<span id='span2'>하위관심사</span>";
        div2 += "</button>";
        div2 += "<ul id='ul2' class='dropdown-menu'>";
        div2 += "</ul>";
        $("#div2").after(div2);
        var div3 = "";
        div3 +=
          "<button id='button3' type='button' class='btn btn-outline-light dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false' style='color: black; border-color: black'>";
        div3 += "<span id='span3'>세부관심사</span>";
        div3 += "</button>";
        div3 += "<ul id='ul3' class='dropdown-menu'>";
        div3 += "</ul>";
        $("#div3").after(div3);
        $("#button2").hide();
        $("#button3").hide();
      }

      function reset2() {
        if ($("#category_firstCheck1").val() != 1) {
          $("#category_first1").val("");
          console.log("카테고리1");
        }
        $("#ul3").remove();
        $("#button3").remove();
        $("#Selectbutton").remove();
        var div3 = "";
        div3 +=
          "<button id='button3' type='button' class='btn btn-outline-light dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false' style='color: black; border-color: black'>";
        div3 += "<span id='span3'>세부관심사</span>";
        div3 += "</button>";
        div3 += "<ul id='ul3' class='dropdown-menu'>";
        div3 += "</ul>";
        $("#div3").after(div3);
        $("#button3").hide();
      }

      function reset3() {
        if ($("#category_firstCheck1").val() != 1) {
          $("#category_first1").val("");
          console.log("카테고리1");
        }
      }
      function selectedCategory() {
        let categoryValue1 = $("#category_first1").val();
        if ($("#category_first1").val() != "") {
          let selectedText1 = "";
          selectedText1 +=
            "<input id='category_first' type='text' name='interest' style='width:100px;height:50px;' value='" +
            categoryValue1 +
            "' readonly>";
          $("#div1").append(selectedText1);
          $("#category_firstCheck1").val("1");
          $("#button1").remove();
          $("#button2").remove();
          $("#button3").remove();
          $("#Selectbutton").remove();
        }
      }

      <c:set var="firstCategory1" value="${firstCategory}" />;
      function categorys(sequence, i) {
        if (sequence == 1) {
          $("#button2").hide();
          $("#button3").hide();
          let catagory = "";
          catagory +=
            "<c:forEach items='${firstCategory1}' var='firstCategory' varStatus='index'>";
          catagory +=
            "<li><a id='li${index.index}' class='dropdown-item' href='javascript:categorys(2,${index.index})' onclick='javascript:reset()' data-value='${firstCategory.int_out}'>${firstCategory.int_out}</a></li>";
          catagory += "</c:forEach>";
          $("#ul1").append(catagory);
        } else if (sequence == 2) {
          $("#button2").show();
          let index = "li";
          index += i;
          let categoryValue = document
            .getElementById(index)
            .getAttribute("data-value");
          $("#span1").text(categoryValue);
          var result = { int_out: categoryValue, sequence: sequence };
          $.ajax({
            url: "../member/category.json",
            type: "GET",
            data: result,
            success: function (data) {
              var secondCategory = data;
              let catagory = "";
              for (var i = 0; i < data.length; i++) {
                let idNum = i;
                catagory +=
                  "<li><a id='" +
                  i +
                  "' class='dropdown-item' href='javascript:categorys(3," +
                  i +
                  ")' onclick='javascript:reset2()' data-value='" +
                  secondCategory[i].int_in +
                  "'>" +
                  secondCategory[i].int_in +
                  "</a></li>";
              }
              $("#ul2").append(catagory);
            },
          });
        } else if (sequence == 3) {
          let index = i;
          let categoryValue = document
            .getElementById(index)
            .getAttribute("data-value");
          $("#span2").text(categoryValue);
          var result = { int_in: categoryValue, sequence: sequence };
          $.ajax({
            url: "../member/category.json",
            type: "GET",
            data: result,
            success: function (data) {
              var thirdCategory = data;
              let catagory = "";
              if (Object.keys(data).length != 1) {
                $("#button3").show();
                for (var i = 0; i < data.length; i++) {
                  catagory +=
                    "<li><a id='" +
                    i +
                    "li' class='dropdown-item' href='javascript:categorys(4," +
                    i +
                    ")' onclick='reset3()' data-value='" +
                    thirdCategory[i].first_option +
                    "'>" +
                    thirdCategory[i].first_option +
                    "</a></li>";
                }
                $("#ul3").append(catagory);
              } else {
                if ($("#category_first1").val() == "") {
                  $("#category_first1").val(categoryValue);
                }
                let catagoryButton =
                  "<button id='Selectbutton' type='button' class='btn btn-secondary' onclick='selectedCategory()'>선택</button>";
                console.log("엘스안 categoryValue: " + categoryValue);
                $("#Cancelbutton").before(catagoryButton);
              }
            },
            error: function (request, status, error) {
              // 통신 실패 시.. 그러니까 404에러나 500에러같은 서버에러가 뜰때 이 함수를 탐.
              console.log(
                "code:  " +
                  request.status +
                  "\n" +
                  "message:  " +
                  request.responseText +
                  "\n" +
                  "error:  " +
                  error
              );
            },
          });
        } else if (sequence == 4) {
          $("#Selectbutton").remove();
          var index = i;
          index += "li";
          let categoryValue = document
            .getElementById(index)
            .getAttribute("data-value");
          $("#span3").text(categoryValue);
          if ($("#category_first1").val() == "") {
            $("#category_first1").val(categoryValue);
          }
          let catagoryButton =
            "<button id='Selectbutton' type='button' class='btn btn-secondary' onclick='selectedCategory()'>선택</button>";
          $("#Cancelbutton").before(catagoryButton);
        } else if (sequence == 6) {
          $("#category_first1").val("");
          $("#category_firstCheck1").val("");
          $("#category_first").remove();
          $("#button1").remove();
          $("#button2").remove();
          $("#button3").remove();
          $("#ul1").remove();
          $("#ul2").remove();
          $("#ul3").remove();
          $("#span1").remove();
          $("#span2").remove();
          $("#span3").remove();
          $("#Selectbutton").remove();
          var div1 = "";
          div1 +=
            "<button id='button1' type='button' class='btn btn-outline-light dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false' style='color: black; border-color: black'>";
          div1 += "<span id='span1'>관심사</span>";
          div1 += "</button>";
          div1 += "<ul id='ul1' class='dropdown-menu'>";
          div1 +=
            "<c:forEach items='${firstCategory1}' var='firstCategory' varStatus='index'>";
          div1 +=
            "<li><a id='li${index.index}' class='dropdown-item' href='javascript:categorys(2,${index.index})'  onclick='javascript:reset()' data-value='${firstCategory.int_out}'>${firstCategory.int_out}</a></li>";
          div1 += "</c:forEach>";
          div1 += "</ul>";
          $("#div1").after(div1);
          var div2 = "";
          div2 +=
            "<button id='button2' type='button' class='btn btn-outline-light dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false' style='color: black; border-color: black'>";
          div2 += "<span id='span2'>하위관심사</span>";
          div2 += "</button>";
          div2 += "<ul id='ul2' class='dropdown-menu'>";
          div2 += "</ul>";
          $("#div2").after(div2);
          var div3 = "";
          div3 +=
            "<button id='button3' type='button' class='btn btn-outline-light dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false' style='color: black; border-color: black'>";
          div3 += "<span id='span3'>세부관심사</span>";
          div3 += "</button>";
          div3 += "<ul id='ul3' class='dropdown-menu'>";
          div3 += "</ul>";
          $("#div3").after(div3);
          $("#button2").hide();
          $("#button3").hide();
        }
      }
      window.history.forward();
      function noBack() {
        window.history.forward();
      }
      function categoryCheck() {
        var category = $("#category_firstCheck1").val();
        if (category == "") {
          Swal.fire({
            title: "관심사를 선택 해 주세요",
            icon: "error",
          });
        } else f.submit();
      }
    </script>
    <style>
      .dropdown-menu {
        height: auto;
        max-height: 200px;
        overflow-x: hidden;
      }
    </style>
  </head>

  <body
    onload="noBack();categorys(1,0)"
    onpageshow="if(event.persisted) noBack();"
    onunload=""
  >
    <!-- ======= Header ======= -->
    <jsp:include page="../header.jsp" flush="true" />
    <!-- End Header -->
    <main id="main">
      <!-- ======= Breadcrumbs ======= -->
      <div class="breadcrumbs" data-aos="fade-in">
        <div class="container">
          <h1>모임 만들기</h1>
        </div>
      </div>

      <section
        class="h-auto"
        style="background-color: #eee; box-sizing: content-box"
      >
        <div class="container h-100" data-aos="flip-down">
          <div
            class="row d-flex justify-content-center align-items-center h-auto"
          >
            <div class="col-lg-12 col-xl-11">
              <div class="card text-black" style="border-radius: 25px">
                <div class="card-body p-md-5">
                  <div class="row justify-content-center">
                    <!-- col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1 -->
                    <div style="width: auto">
                      <!--모임지역/이름/모임소개/관심사/정원/모임사진-->
                      <form
                        id="form"
                        name="f"
                        class="mx-1 mx-md-4"
                        method="post"
                        action="groupCreate.do?mnum=${m.mnum}"
                        enctype="multipart/form-data"
                      >
                        <div class="d-flex flex-row align-items-center mb-0">
                          <i class="bi bi-map fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example1c"
                              >모임지역</label
                            >
                            <div class="col-md-4">
                              <select
                                class="form-select border-1 py-3"
                                name="gloc"
                              >
                                <option selected disabled>선택</option>
                                <option value="서울">서울</option>
                                <option value="경기">경기</option>
                                <option value="인천">인천</option>
                                <option value="강원">강원</option>
                                <option value="충북">충북</option>
                                <option value="충남">충남</option>
                                <option value="전북">전북</option>
                                <option value="전남">전남</option>
                                <option value="경북">경북</option>
                                <option value="경남">경남</option>
                                <option value="제주">제주</option>
                              </select>
                            </div>
                          </div>
                        </div>

                        <div class="d-flex flex-row align-items-center mb-0">
                          <i class="bi bi-tag fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example1c"
                              >모임이름</label
                            >
                            <input
                              type="text"
                              id="form3Example1c"
                              class="form-control"
                              name="gname"
                            />
                          </div>
                        </div>

                        <div class="d-flex flex-row align-items-center mb-0">
                          <i class="bi bi-chat-right-text fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example4c"
                              >모임소개</label
                            >
                            <textarea
                              name="gintro"
                              placeholder="글을 작성해주세요"
                              maxlength="2000"
                              cols="53"
                              id="form3Example4c"
                              class="form-control"
                            ></textarea>
                          </div>
                        </div>

                        <div
                          id="selectdiv1"
                          class="d-flex flex-row align-items-center mb-0"
                        >
                          <i class="bi bi-star fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-0">
                            <div id="div1" class="btn-group">
                              <button
                                id="button1"
                                type="button"
                                class="btn btn-outline-light dropdown-toggle"
                                data-bs-toggle="dropdown"
                                aria-expanded="false"
                                style="color: black; border-color: black"
                              >
                                <span id="span1">관심사</span>
                              </button>
                              <ul id="ul1" class="dropdown-menu"></ul>
                            </div>

                            <div
                              id="div2"
                              class="btn-group"
                              style="margin-left: 5px"
                            >
                              <button
                                type="button"
                                id="button2"
                                class="btn btn-outline-light dropdown-toggle"
                                data-bs-toggle="dropdown"
                                aria-expanded="false"
                                style="color: black; border-color: black"
                              >
                                <span id="span2">하위관심사</span>
                              </button>
                              <ul id="ul2" class="dropdown-menu"></ul>
                            </div>

                            <div
                              id="div3"
                              class="btn-group"
                              style="margin-left: 5px"
                            >
                              <button
                                type="button"
                                id="button3"
                                class="btn btn-outline-light dropdown-toggle"
                                data-bs-toggle="dropdown"
                                aria-expanded="false"
                                style="color: black; border-color: black"
                              >
                                <span id="span3">세부관심사</span>
                              </button>
                              <ul id="ul3" class="dropdown-menu"></ul>
                            </div>
                            <input
                              id="category_first1"
                              type="hidden"
                              value=""
                            />

                            <input
                              id="category_firstCheck1"
                              type="hidden"
                              value=""
                            />

                            <button
                              id="Cancelbutton"
                              type="button"
                              class="btn btn-secondary"
                              onclick="categorys(6,0)"
                              style="margin-left: 5px"
                            >
                              취소
                            </button>
                          </div>
                        </div>

                        <div class="d-flex flex-row align-items-center mb-0">
                          <i class="bi bi-people fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example1c"
                              >정원</label
                            >
                            <input
                              type="number"
                              id="form3Example1c"
                              class="form-control"
                              name="limit"
                              min="2"
                              max="100"
                              placeholder="2~100"
                            />
                          </div>
                        </div>

                        <div class="d-flex flex-row align-items-center mb-0">
                          <i class="bi bi-card-image fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example1c"
                              >모임대표사진</label
                            >
                            <input
                              type="file"
                              id="form3Example1c"
                              class="form-control"
                              name="uploadFile"
                              required
                            />
                          </div>
                        </div>

                        <div
                          class="d-flex justify-content-center mx-4 mb-3 mb-lg-4"
                        >
                          <button
                            type="button"
                            class="btn btn-success"
                            style="margin-right: 30px"
                            onclick="categoryCheck()"
                          >
                            개설
                          </button>
                          <button type="button" class="btn btn-secondary">
                            취소
                          </button>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>
    <!-- End #main -->

    <!-- ======= Footer ======= -->
    <jsp:include page="../footer.jsp" flush="true" />
    <!-- End Footer -->

    <div id="preloader"></div>
    <a
      href="#"
      class="back-to-top d-flex align-items-center justify-content-center"
      ><i class="bi bi-arrow-up-short"></i
    ></a>

    <!-- Vendor JS Files -->
    <script src="/assets/vendor/purecounter/purecounter.js"></script>
    <script src="/assets/vendor/aos/aos.js"></script>
    <script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="/assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="/assets/js/main.js"></script>
  </body>
</html>
