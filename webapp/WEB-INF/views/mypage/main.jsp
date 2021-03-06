<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
	<link
			href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
			rel="stylesheet"
	/>

	<link
			href="/assets/vendor/bootstrap-icons/bootstrap-icons.css"
			rel="stylesheet"
	/>
	<link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
	<link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
	<link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />
	<!-- alert  -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- alert -->
	<!-- my page  -->
	<link href="/assets/css/mypage.css" rel="stylesheet" />
	<!-- Template Main CSS File -->
	<link href="/assets/css/style.css" rel="stylesheet" />
	<!-- ???????????? ?????? -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.main i').on('click',function(){
				$('input').toggleClass('active');
				if($('input').hasClass('active')){
					$(this).attr('class',"fa fa-eye-slash fa-lg")
							.prev('input').attr('type',"text");
				}else{
					$(this).attr('class',"fa fa-eye fa-lg")
							.prev('input').attr('type','password');
				}
			});
		});

		$(function(){
			$("#updatebutton").on("click",function(){
				$.ajax({
					url: "../mypage/nowpassword.json",
					type: "POST",
					data: $('#updateform').serialize(),
					success: function(data){
						console.log(data);

						if(data==0){
							var pwcheck = $("#pwd1").val();
							var pwcheck2 = $("#pwd2").val();
							if(pwcheck!=pwcheck2){
								Swal.fire({
									title:"??????????????? ????????????",
									icon:"warning"
								})
								return false;
							}
							else{
								var pwcheck = $("#pwd1").val();
								Swal.fire({
									title: '?????? ??????!',
									icon: 'success',
									confirmButtonColor: '#3085d6',
									cancelButtonColor: '#d33',
									confirmButtonText: 'oK'
								}).then((result) => {
									console.log(result.isConfirmed);
									if (result.isConfirmed) {
										location.href="../mypage/updatepassword?mnum=${m.mnum}&pwd="+pwcheck;
									}
								});

							}
						}else if(data==1){
							Swal.fire({
								title:"?????? ??????????????? <br/>?????? ????????????",
								icon:"error"
							});
						}
					}
				});
			});
		});

		$(function(){
			$("#updatebutton2").on("click",function(){
				$.ajax({
					url: "../mypage/updatemaddrandpfr_loc.json",
					type: "POST",
					data: $('#updateform2').serialize(),
					success: function(data){

						if(data==0 ){
							var pfr_loc = $("#pfr_loc").val();
							var maddr = $("#maddr").val();
							Swal.fire({
								title: ' ?????? ????????? ????????????.',
								icon: 'warning',
								confirmButtonColor: '#3085d6',
								cancelButtonColor: '#d33',
								confirmButtonText: 'oK'
							});
							return false;
						}else{
							var pfr_loc = $("#pfr_loc").val();
							var maddr = $("#maddr").val();
							Swal.fire({
								title: '?????? ??????!',
								icon: 'success',
								confirmButtonColor: '#3085d6',
								cancelButtonColor: '#d33',
								confirmButtonText: 'oK'
							}).then((result) => {
								console.log(result.isConfirmed);
								if (result.isConfirmed) {
									location.href="../mypage/main";

								}
							});
						}
					}
				});
			});
		});
		function sample6_execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
					// ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.

					// ??? ????????? ?????? ????????? ?????? ????????? ????????????.
					// ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
					var addr = ''; // ?????? ??????
					var extraAddr = ''; // ???????????? ??????

					//???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
					if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
						addr = data.roadAddress;
					} else { // ???????????? ?????? ????????? ???????????? ??????(J)
						addr = data.jibunAddress;
					}

					// ???????????? ????????? ????????? ????????? ???????????? ??????????????? ????????????.
					if(data.userSelectedType === 'R'){
						// ??????????????? ?????? ?????? ????????????. (???????????? ??????)
						// ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
						if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
							extraAddr += data.bname;
						}
						// ???????????? ??????, ??????????????? ?????? ????????????.
						if(data.buildingName !== '' && data.apartment === 'Y'){
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
						if(extraAddr !== ''){
							extraAddr = ' (' + extraAddr + ')';
						}
						// ????????? ??????????????? ?????? ????????? ?????????.
						//document.getElementById("sample6_extraAddress").value = extraAddr;

					} else {
						//document.getElementById("sample6_extraAddress").value = '';
					}

					// ??????????????? ?????? ????????? ?????? ????????? ?????????.
					//document.getElementById('sample6_postcode').value = data.zonecode;//????????????
					document.getElementById("maddr").value = addr;
					// ????????? ???????????? ????????? ????????????.
					document.getElementById("maddr2").focus();
				}
			}).open();
		}

	</script>


	<script type="text/javascript">
		function winPopup() {
			let email = $("#email").val();
			var popUrl = "updateemail?email="+email;
			var popOption = "width=430, height=500, left= 600,status=no,scrollbars=no";
			window.open(popUrl,"????????? ??????", popOption);
		}

		function winPopup2() {
			var popUrl = "categoryform.do";
			var popOption = "width=600, height=700, left= 600,status=no,scrollbars=no";
			window.open(popUrl,"????????? ??????", popOption);
		}
	</script>
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
<main id="main" data-aos="fade-in">
	<!-- ======= Breadcrumbs ======= -->
	<div class="breadcrumbs">
		<div class="container">
			<h2>???????????????</h2>
		</div>
	</div>

	<!-- ======= Breadcrumbs ======= -->

	<!-- End Breadcrumbs -->

	<!-- ======= Contact Section ======= -->
	<section id="contact" class="contact">
		<div data-aos="fade-up">
		</div>

		<div class="container" style="margin-top: 100px">
			<div class="row gutters">
				<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
					<div class="card h-100">
						<div class="card-body mt-5">
							<div class="account-settings">
								<div class="user-profile">
									<h5 class="user-name">${m.mname}</h5>
									<h6 class="user-email">${member.email}</h6>
								</div>
								<div class="user-profile">
									<button type="button" class="btn btn-sm btn-outline-dark" onclick="location.href='../member/messageList?mnum=${m.mnum}'">????????????</button>
								</div>
								<div class="about">
									<h5>?????????</h5>

									<p><c:choose>
										<c:when test="${m.category_first eq null}">

										</c:when>
										<c:otherwise>
											${m.category_first}
										</c:otherwise>
									</c:choose></p>
									<p>
										<!-- ????????? ??????????????? ?????? ????????? -->
									<p>
										<c:choose>
											<c:when test="${ not empty m.category_second }">
												${m.category_second}
											</c:when>
											<c:otherwise>

											</c:otherwise>
										</c:choose>
									</p>
									<p>
										<!-- ????????? ?????? ????????? ???????????????-->
									<p>
										<c:choose>
											<c:when test="${not empty m.category_third }">
												${m.category_third}
											</c:when>
											<c:otherwise>

											</c:otherwise>
										</c:choose>
									</p>
									<p>
										<button type="button" class="btn btn-secondary"  onclick="winPopup2();">??????</button>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
					<div class="card h-100">
						<div class="card-body">
							<form name="f" id="updateform" name="updateform">
								<div class="row gutters">
									<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
										<h6 class="mb-2 text-primary">????????????</h6>
									</div>

									<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
										<div class="form-group">
											<label for="mname">??????</label>
											<input type="text" name = "mname" value = "${m.mname}"class="form-control" id="mname" placeholder="Enter full name" disabled>
										</div>
									</div>
									<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
										<div class="form-group">
											<label for="password">??????????????????</label>
											<input type="password" name = "pwd" value = "" class="form-control" id="pwd" >
										</div>
									</div>

									<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">

										<div class="form-group">

											<label for="phone">????????????</label>
											<div class = "main" style="position:relative">
												<input type="password" name = "phone" value = "${m.phone}"  class="form-control" id="phone" style="display:inline-block" readonly  >
												<i class="fa fa-eye fa-lg" style="position:absolute; left:420px; bottom:10px"></i>
											</div>
										</div>
									</div>


									<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
										<div class="form-group">
											<label for="pwd1">????????????</label>
											<input type="password" id = "pwd1" name = "pwd1" value = "" class="form-control" >
										</div>
									</div>
									<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
										<div class="form-group">
											<label for="website">?????????</label>
											<div class = "input-group">
												<input type="url" name = "email" id = "email" value = "${member.email}" readonly class="form-control" id="email" >
												<span class="input-group-btn">
                        <button type="button" class="btn btn-secondary"  onclick="winPopup();">??????</button>
                     </span>
											</div>
										</div>
									</div>

									<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
										<div class="form-group" >
											<label for=pwd2>???????????? ??????</label>
											<div align = "right">
												<input type="password" id = "pwd2" name = "pwd2" value = "" class="form-control" >

												<button type="button" id="updatebutton" name="updatebutton" class="btn btn-secondary mt-2">??????</button>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">

								</div>
							</form>

							<form name="f2" id="updateform2" name="updateform2" method = "POST">
								<div class="row gutters">
									<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
										<h6 class="mt-3 mb-2 text-primary">????????????</h6>
									</div>
									<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">

										<div class="form-group">
											<label for="website">?????????</label>

											<input type="text" name = "maddr" id = "maddr" onclick="sample6_execDaumPostcode()" value = "${member.maddr}"  class="form-control"  readonly>
											<input
													id="maddr2"
													type="text"
													name="maddr"
													class="form-control"
													value=""
													placeholder="????????????"


											/>
											<div align = "right">
												<button type="button" id="updatebutton2" name="updatebutton2" class="btn btn-primary mt-2 float-right " >??????</button>
											</div>
										</div>
									</div>
									<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
										<div class="form-group">
											<label for="ciTy">????????????</label>
											<select class="form-control"  name="pfr_loc" id = "pfr_loc">
												<option selected >${member.pfr_loc}</option>
												<option value="??????">??????</option>
												<option value="??????">??????</option>
												<option value="??????">??????</option>
												<option value="??????">??????</option>
												<option value="??????">??????</option>
												<option value="??????">??????</option>
												<option value="??????">??????</option>
												<option value="??????">??????</option>
												<option value="??????">??????</option>
												<option value="??????">??????</option>
												<option value="??????">??????</option>
											</select>

										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<!-- End Contact Section -->
</main>
<!-- End #main -->

<!-- ======= Footer ======= -->
<jsp:include page="../footer.jsp" flush="true"/>
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