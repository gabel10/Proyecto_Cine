<%-- 
    Document   : home
    Created on : 27/08/2017, 03:11:19 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Cinerama</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="keywords" content="cinerama, cine, peliculas, estrenos, peru">
        <link type="image/x-icon" rel="shortcut icon" href="${pageContext.request.contextPath}/recursos/images/favicon.png">
        <script type="application/x-javascript">
        addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);

        function hideURLbar() { window.scrollTo(0, 1); }
        </script>
        <link href="${pageContext.request.contextPath}/recursos/css/bootstrap.css" rel='stylesheet' type='text/css'>
        <link href="${pageContext.request.contextPath}/recursos/css/style.css" rel="stylesheet" type="text/css" media="all">
        <!-- start plugins -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/recursos/js/jquery-1.11.1.min.js"></script>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
        <script src="${pageContext.request.contextPath}/recursos/js/responsiveslides.min.js"></script>
        <script>
        $(function() {
            $("#slider").responsiveSlides({
                auto: true,
                nav: true,
                speed: 500,
                namespace: "callbacks",
                pager: true,
            });
        });
        </script>
    </head>
    <body>
        <div class="container">
            <div class="container_wrap">
            
                <jsp:include page="header_home.jsp"/>

                <div id="contenido">
                    <div class="slider">
                        <div class="callbacks_container">
                            <ul class="rslides" id="slider">
                                <li><img src="${pageContext.request.contextPath}/recursos/images/banner1.jpg" class="img-responsive" alt="" />
                                    <div class="button">
                                        <a href="#" class="hvr-shutter-out-horizontal">Reserva Ahora</a>
                                    </div>
                                </li>
                                <li><img src="${pageContext.request.contextPath}/recursos/images/banner2.jpg" class="img-responsive" alt="" />
                                    <div class="button">
                                        <a href="#" class="hvr-shutter-out-horizontal">Reserva Ahora</a>
                                    </div>
                                </li>
                                <li><img src="${pageContext.request.contextPath}/recursos/images/banner3.jpg" class="img-responsive" alt="" />
                                    <div class="button">
                                        <a href="#" class="hvr-shutter-out-horizontal">Reserva Ahora</a>
                                    </div>
                                </li>
                                <li><img src="${pageContext.request.contextPath}/recursos/images/banner4.jpg" class="img-responsive" alt="" />
                                    <div class="button">
                                        <a href="#" class="hvr-shutter-out-horizontal">Reserva Ahora</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="banner_desc">
                            <div class="col-md-9">
                                <ul class="list_1">
                                    <li>Estreno <span class="m_1">Feb 20, 2015</span></li>
                                    <li>Calificación <span class="m_1"><img src="${pageContext.request.contextPath}/recursos/images/rating.png" alt=""/></span></li>
                                </ul>
                            </div>
                            <div class="col-md-3 grid_1">
                                <ul class="list_1 list_2">
                                    <li><i class="icon1"> </i>
                                        <p>2,548</p>
                                    </li>
                                    <li><i class="icon2"> </i>
                                        <p>215</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="content">
                        <div class="box_1">
                            <h1 class="m_2">En Cartelera</h1>
                            <div class="search">
                                <form>
                                    <input type="text" value="Search..." onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
                                    <input type="submit" value="">
                                </form>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="box_2">
                            <div class="col-md-5 grid_3">
                                <div class="row_1">
                                    <div class="col-md-6 grid_4">
                                        <a href="single.html">
                                            <div class="grid_2">
                                                <img src="${pageContext.request.contextPath}/recursos/images/pic1.jpg" class="img-responsive" alt="" />
                                                <div class="caption1">
                                                    <ul class="list_3">
                                                        <li><i class="icon5"> </i>
                                                            <p>3,548</p>
                                                        </li>
                                                    </ul>
                                                    <i class="icon4"> </i>
                                                </div>
                                            </div>
                                            <div class="grid_2 col_1">
                                                <img src="${pageContext.request.contextPath}/recursos/images/pic2.jpg" class="img-responsive" alt="" />
                                                <div class="caption1">
                                                    <ul class="list_3">
                                                        <li><i class="icon5"> </i>
                                                            <p>3,548</p>
                                                        </li>
                                                    </ul>
                                                    <i class="icon4"> </i>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-md-6 grid_7">
                                        <div class="col_2">
                                            <ul class="list_4">
                                                <li><i class="icon1"> </i>
                                                    <p>2,548</p>
                                                </li>
                                                <li><i class="icon2"> </i>
                                                    <p>215</p>
                                                </li>
                                                <li>Rating : &nbsp;&nbsp;
                                                    <p><img src="${pageContext.request.contextPath}/recursos/images/rating1.png" alt="" /></p>
                                                </li>
                                                <li>Release Date : &nbsp;<span class="m_4">Mar 15, 2015</span> </li>
                                            </ul>
                                            <div class="m_5"><a href=""><img src="${pageContext.request.contextPath}/recursos/images/pic3.jpg" class="img-responsive" alt=""/></a></div>
                                        </div>
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                                <div class="row_2">
                                    <a href=""><img src="${pageContext.request.contextPath}/recursos/images/pic4.jpg" class="img-responsive" alt=""/></a>
                                </div>
                            </div>
                            <div class="col-md-5 content_right">
                                <div class="row_3">
                                    <div class="col-md-6 content_right-box">
                                        <a href="">
                                            <div class="grid_2">
                                                <img src="${pageContext.request.contextPath}/recursos/images/pic6.jpg" class="img-responsive" alt="" />
                                                <div class="caption1">
                                                    <ul class="list_5">
                                                        <li><i class="icon5"> </i>
                                                            <p>3,548</p>
                                                        </li>
                                                    </ul>
                                                    <i class="icon4 icon6"> </i>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-md-6 grid_5">
                                        <a href="">
                                            <div class="grid_2">
                                                <img src="${pageContext.request.contextPath}/recursos/images/pic7.jpg" class="img-responsive" alt="" />
                                                <div class="caption1">
                                                    <ul class="list_5">
                                                        <li><i class="icon5"> </i>
                                                            <p>3,548</p>
                                                        </li>
                                                    </ul>
                                                    <i class="icon4 icon6"> </i>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                                <div class="video">
                                    <iframe width="100%" height="" src="https://www.youtube.com/embed/leIrosWRbYQ" frameborder="0" allowfullscreen></iframe>
                                </div>
                                <div class="row_5">
                                    <div class="col-md-6">
                                        <div class="col_2">
                                            <ul class="list_4">
                                                <li><i class="icon1"> </i>
                                                    <p>2,548</p>
                                                </li>
                                                <li><i class="icon2"> </i>
                                                    <p>215</p>
                                                </li>
                                                <li>Rating : &nbsp;&nbsp;
                                                    <p><img src="${pageContext.request.contextPath}/recursos/images/rating1.png" alt=""></p>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-6 m_6"><a href="single.html">
                                          <img src="${pageContext.request.contextPath}/recursos/images/pic8.jpg" class="img-responsive" alt=""/>
                                   </a></div>
                                </div>
                            </div>
                            <div class="col-md-2 grid_6">
                                <div class="m_7"><a href=""><img src="${pageContext.request.contextPath}/recursos/images/pic9.jpg" class="img-responsive" alt=""/></a></div>
                                <div class="caption1">
                                    <ul class="list_5">
                                        <li><i class="icon5"> </i>
                                            <p>3,548</p>
                                        </li>
                                    </ul>
                                    <i class="icon4 icon6"> </i>
                                </div>
                                <div class="col_2 col_3">
                                    <ul class="list_4">
                                        <li><i class="icon1"> </i>
                                            <p>2,548</p>
                                        </li>
                                        <li><i class="icon2"> </i>
                                            <p>215</p>
                                        </li>
                                        <li>Rating : &nbsp;&nbsp;
                                            <p><img src="${pageContext.request.contextPath}/recursos/images/rating1.png" alt=""></p>
                                        </li>
                                        <li>Release : &nbsp;<span class="m_4">Mar 15, 2015</span> </li>
                                    </ul>
                                    <div class="m_8"><a href="single.html"><img src="${pageContext.request.contextPath}/recursos/images/pic10.jpg" class="img-responsive" alt=""/></a></div>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </div>    
                </div>
            </div>
        </div>
        <jsp:include page="footer_home.jsp"/>                
    </body>
</html>
