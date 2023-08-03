@@ -20,12 +20,65 @@
	<link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">


	<link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/icomoon/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/flaticon/font/flaticon.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/tiny-slider.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/aos.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

	<title>spaceCollection.com</title>
</head>


<body>
	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>

	<nav class="site-nav">
		<div class="container">
			<div class="menu-bg-wrap">
				<div class="site-navigation">
					<a href="index.html" class="logo m-0 float-start">spaceCollection</a>

					<ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
						<li class="active"><a href="index.html">Home</a></li>
						<li class="has-children">
							<a href="SpaceCollection.html">SpaceCollection</a>
							<ul class="dropdown">
								<li><a href="#">Buy Property</a></li>
								<li><a href="#">Sell Property</a></li>
								<li class="has-children">
									<a href="#">Dropdown</a>
									<ul class="dropdown">
										<li><a href="#">Sub Menu One</a></li>
										<li><a href="#">Sub Menu Two</a></li>
										<li><a href="#">Sub Menu Three</a></li>
									</ul>
								</li>
							</ul>
						</li>
						<li><a href="services.html">Services</a></li>
						<li><a href="about.html">About</a></li>
						<li><a href="contact.html">Contact Us</a></li>
					</ul>

					<a href="#" class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none" data-toggle="collapse" data-target="#main-navbar">
						<span></span>
					</a>

				</div>
			</div>
		</div>
	</nav>

	<form action="#" class="narrow-w form-search d-flex align-items-stretch mb-3" data-aos="fade-up" data-aos-delay="200">
		<input type="text" class="form-control px-4" placeholder="Your ZIP code or City. e.g. New York">
		<button type="submit" class="btn btn-primary">Search</button>
	</form>