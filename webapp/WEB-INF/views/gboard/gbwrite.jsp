<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*, team1.togather.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta content="width=device-width, initial-scale=1.0" name="viewport" />

  <title>Pricing - Mentor Bootstrap Template</title>
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
          href="/assets/vendor/bootstrap-icons/bootstrap-icons.css"
          rel="stylesheet"
  />
  <link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
  <link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
  <link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

  <!-- Template Main CSS File -->
  <link href="/assets/css/style.css" rel="stylesheet" />
  <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
  <script>
    Kakao.init('11400a9267d93835389eb9255fcaad0b');
    function signout(){
      if(Kakao.Auth.getAccessToken() != null){
        Kakao.Auth.logout(function(){
          setTimeout(function(){
            location.href="../member/logout.do";
          },500);
        });
      }else{
        location.href="../member/logout.do";
      }
    }
  </script>
</head>

<body>
<!-- ======= Header ======= -->
<jsp:include page="../header.jsp" flush="true"/>
<!-- End Header -->

<main id="main">
  <!-- ======= Breadcrumbs ======= -->
  <div class="breadcrumbs" data-aos="fade-in">
    <div class="container">
      <h1>모임게시판 글쓰기</h1>
    </div>
  </div>
  <!-- End Breadcrumbs -->

  <!-- ======= Pricing Section ======= -->


  <section
          class="h-100"
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

                <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                  <!--거주지/관심지역/이름/생년월일/비번/비번확인/전화번호/성별-->

                  <form class="mx-1 mx-md-4" name="input" method="post" action="gbwrite.do?&gseq=${gseq}" enctype="multipart/form-data">
                    <div class="d-flex flex-row align-items-center mb-0">
                      <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                      <div class="form-outline flex-fill mb-2">
                        <label class="form-label mb-0" for="form3Example1c"
                        >제목</label
                        >
                        <input

                                type="text"
                                name="gbtitle"
                                id="form3Example1c"
                                class="form-control"
                                required=""
                        />
                      </div>
                    </div>


                    <div class="d-flex flex-row align-items-center mb-0">
                      <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                      <div class="form-outline flex-fill mb-2">
                        <label class="form-label mb-0" for="form3Example4c"
                        >글내용</label
                        >
                        <textarea
                                name="gbcontent"
                                placeholder="글을 작성해주세요"
                                row="10"
                                cols="53"
                                id="form3Example4c"
                                class="form-control"
                                required=""
                        ></textarea>
                      </div>
                    </div>



                    <div class="d-flex flex-row align-items-center mb-0">
                      <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                      <div class="form-outline flex-fill mb-2">
                        <label class="form-label mb-0" for="form3Example1c"
                        >파일</label
                        >
                        <input
                                type="file"
                                name="gbfiles"
                                id="form3Example1c"
                                class="form-control"
                        />
                      </div>
                    </div>



                    <div class="d-flex flex-row align-items-center mb-0">
                      <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                      <div class="form-outline flex-fill mb-2">
                        <label class="form-label mb-0" for="form3Example1c"
                        ></label
                        >
                        <input
                                type="hidden"
                                name="mname"
                                value="${m.mname}"
                                id="form3Example1c"
                                class="form-control"
                        />
                      </div>
                    </div>

                    <div class="d-flex flex-row align-items-center mb-0">
                      <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                      <div class="form-outline flex-fill mb-2">
                        <label class="form-label mb-0" for="form3Example1c"
                        ></label
                        >
                        <input
                                type="hidden"
                                name="mnum"
                                value="${m.mnum}"
                                id="form3Example1c"
                                class="form-control"
                        />
                      </div>
                    </div>



                    <div
                            class="d-flex justify-content-center mx-4 mb-3 mb-lg-4"
                    >
                      <button
                              type="submit"

                              class="btn btn-success"
                              style="margin-right: 30px"
                      >
                        개설
                      </button>
                      <button type="button"  onclick="location.href='gblistPage?gseq=${gseq}'" class="btn btn-secondary">
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
  <!-- End Pricing Section -->
</main>
<!-- End #main -->

<!-- ======= Footer ======= -->
<jsp:include page="../footer.jsp" flush="true"/>
<!-- End Footer -->
</body>
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
</html>