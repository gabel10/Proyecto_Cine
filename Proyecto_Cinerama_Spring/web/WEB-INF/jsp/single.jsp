<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>

<head>
    <title>Cinerama | Película</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="cinerama, cine, peliculas, estrenos, peru">
    <link type="image/x-icon" rel="shortcut icon" href="images/favicon.png">
    <script type="application/x-javascript">
    addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);

    function hideURLbar() { window.scrollTo(0, 1); }
    </script>
    <link href="<c:url value="/recursos/css/bootstrap.css"/>" rel='stylesheet' type='text/css'>
    <link href="<c:url value="/recursos/css/style.css"/>" rel="stylesheet" type="text/css" media="all">
    <!-- start plugins -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/recursos/js/jquery-1.11.1.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
    
</head>

<body>
    <div class="container">
        <div class="container_wrap">
            <jsp:include page="header_home.jsp"/>
            <div class="content">
                <div class="movie_top">
                    <div class="col-md-9 movie_box">
                        <div class="grid images_3_of_2">
                            <div class="movie_image">
                                <span class="movie_rating">5.0</span>
                                <img width="450px" height="450px" src=${url} class="img-responsive" alt="" />
                            </div>
                            <div class="movie_rate">
                                <div class="rating_desc">
                                    <p>Tus votos :</p>
                                </div>
                                <form action="" class="sky-form">
                                    <fieldset>
                                        <section>
                                            <div class="rating">
                                                <input type="radio" name="stars-rating" id="stars-rating-5">
                                                <label for="stars-rating-5"><i class="icon-star"></i></label>
                                                <input type="radio" name="stars-rating" id="stars-rating-4">
                                                <label for="stars-rating-4"><i class="icon-star"></i></label>
                                                <input type="radio" name="stars-rating" id="stars-rating-3">
                                                <label for="stars-rating-3"><i class="icon-star"></i></label>
                                                <input type="radio" name="stars-rating" id="stars-rating-2">
                                                <label for="stars-rating-2"><i class="icon-star"></i></label>
                                                <input type="radio" name="stars-rating" id="stars-rating-1">
                                                <label for="stars-rating-1"><i class="icon-star"></i></label>
                                            </div>
                                        </section>
                                    </fieldset>
                                </form>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                        <div class="desc1 span_3_of_2">
                            <p class="movie_option"><strong>País: </strong><a href="#"></a>${dato.get("titulo")}<a href="#"></a></p>
                            <p class="movie_option"><strong>País: </strong><a href="#"></a>${dato.get("pais")}<a href="#"></a></p>
                            <p class="movie_option"><strong>Año: </strong>2014</p>
                            <p class="movie_option"><strong>Género: </strong><a href="#">${dato.get("genero")}</a> <a href="#"> </a></p>
                            <p class="movie_option"><strong>Fecha de Estreno: </strong>${dato.get("fecha_estreno")}</p>
                            <p class="movie_option"><strong>Director: </strong><a href="#">March Tompsom </a></p>
                            <p class="movie_option"><strong>Duracion: </strong><a href="#">${dato.get("duracion")} </a></p>
                            <p class="movie_option"><strong>Actores: </strong><a href="#">anything</a>, <a href="#">Lorem Ipsum</a>, <a href="#" </a> <a href="#"> Virginia</a>, <a href="#"> Virginia</a>, <a href="#">variations</a>, <a href="#">variations</a>, <a href="#">variations</a>, <a href="#"> Virginia</a> <a href="#">...</a></p>
                            <p class="movie_option"><strong>Censura: </strong>13</p>
                            <p class="movie_option"><strong>Horario: </strong></p>
                            <div class="down_btn">
                              <a class="btn1" href="cantbutacas.htm?fun=13:20">13:20</a>
                              <a class="btn1" href="cantbutacas.htm?fun=15:00">15:00</a>
                              <a class="btn1" href="cantbutacas.htm?fun=18:30">18:30</a>
                              <a class="btn1" href="cantbutacas.htm?fun=22:40">22:40</a>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                        
                        <p class="m_4"> <strong>Sinopsis: </strong> ${dato.get("sinopsis")}</p>
                        <form method="post" action="contact-post.html">
                            <div class="to">
                                <input type="text" class="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}">
                                <input type="text" class="text" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" style="margin-left:3%">
                            </div>
                            <div class="text">
                                <textarea value="Message:" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message';}">Message:</textarea>
                            </div>
                            <div class="form-submit1">
                                <input name="submit" type="submit" id="submit" value="Enviar tu Comentario">
                                <br>
                            </div>
                            <div class="clearfix"></div>
                        </form>
                        <div class="single">
                            <h1>Comentarios</h1>
                            <ul class="single_list">
                                <li>
                                    <div class="preview"><a href="#"><img src="recursos/images/2.jpg" class="img-responsive" alt=""></a></div>
                                    <div class="data">
                                        <div class="title">Movie / 2 hours ago / <a href="#">reply</a></div>
                                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>
                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                                <li>
                                    <div class="preview"><a href="#"><img src="recursos/images/3.jpg" class="img-responsive" alt=""></a></div>
                                    <div class="data">
                                        <div class="title">Wernay / 2 hours ago / <a href="#">reply</a></div>
                                        <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent </p>
                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                                <li>
                                    <div class="preview"><a href="#"><img src="recursos/images/4.jpg" class="img-responsive" alt=""></a></div>
                                    <div class="data">
                                        <div class="title">mr.dev / 2 hours ago / <a href="#">reply</a></div>
                                        <p>Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum. qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram,</p>
                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                                <li class="middle">
                                    <div class="preview"><a href="#"><img src="recursos/images/5.jpg" class="img-responsive" alt=""></a></div>
                                    <div class="data-middle">
                                        <div class="title">Wernay / 2 hours ago / <a href="#">reply</a></div>
                                        <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>
                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                                <li class="last-comment">
                                    <div class="preview"><a href="#"><img src="recursos/images/6.jpg" class="img-responsive" alt=""></a></div>
                                    <div class="data-last">
                                        <div class="title">mr.dev / 2 hours ago / <a href="#">reply</a></div>
                                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit </p>
                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                                <li>
                                    <div class="preview"><a href="#"><img src="recursos/images/7.jpg" class="img-responsive" alt=""></a></div>
                                    <div class="data">
                                        <div class="title">denpro / 2 hours ago / <a href="#">reply</a></div>
                                        <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>
                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="movie_img">
                            <div class="grid_2">
                                <img src="recursos/images/pic6.jpg" class="img-responsive" alt="">
                                <div class="caption1">
                                    <ul class="list_5 list_7">
                                        <li><i class="icon5"> </i>
                                            <p>3,548</p>
                                        </li>
                                    </ul>
                                    <p class="m_3">Guardians of the Galaxy</p>
                                </div>
                            </div>
                        </div>
                        <div class="grid_2 col_1">
                            <img src="recursos/images/pic2.jpg" class="img-responsive" alt="">
                            <div class="caption1">
                                <ul class="list_3 list_7">
                                    <li><i class="icon5"> </i>
                                        <p>3,548</p>
                                    </li>
                                </ul>
                                <p class="m_3">Guardians of the Galaxy</p>
                            </div>
                        </div>
                        <div class="grid_2 col_1">
                            <img src="recursos/images/pic9.jpg" class="img-responsive" alt="">
                            <div class="caption1">
                                <ul class="list_3 list_7">
                                    <li><i class="icon5"> </i>
                                        <p>3,548</p>
                                    </li>
                                </ul>
                                <p class="m_3">Guardians of the Galaxy</p>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <footer id="footer">
            <div id="footer-3d">
                <div class="gp-container">
                    <span class="first-widget-bend"> </span>
                </div>
            </div>
            <div id="footer-widgets" class="gp-footer-larger-first-col">
                <div class="gp-container">
                    <div class="footer-widget footer-1">
                        <div class="wpb_wrapper">
                            <img src="recursos/images/logo.jpg" alt="" />
                        </div>
                        <br>
                        <p>La cadena de cines Cineramas ofrece el mejor servicio, para que disfrutes de la proyección de tu pelicula favorita.</p>
                        <p class="text">Contamos con pantallas 4K, en el que disfrutarás de la mejor experiencia posible</p>
                    </div>
                    <div class="footer_box">
                        <div class="col_1_of_3 span_1_of_3">
                            <h3>Géneros</h3>
                            <ul class="first">
                                <li><a href="#">Ciencia Ficción</a></li>
                                <li><a href="#">Aventura</a></li>
                                <li><a href="#">Romance</a></li>
                                <li><a href="#">Terror</a></li>
                                <li><a href="#">Thriller</a></li>
                            </ul>
                        </div>
                        <div class="col_1_of_3 span_1_of_3">
                            <h3>Información</h3>
                            <ul class="first">
                                <li><a href="#">Sobre Nosotros</a></li>
                                <li><a href="#">Ventas Corporativas</a></li>
                                <li><a href="#">Libro de Reclamaciones</a></li>
                                <li><a href="#">Contáctanos</a></li>
                            </ul>
                        </div>
                        <div class="col_1_of_3 span_1_of_3">
                            <h3>Síguenos</h3>
                            <ul class="first">
                                <li><a href="#">Facebook</a></li>
                                <li><a href="#">Twitter</a></li>
                                <li><a href="#">Youtube</a></li>
                            </ul>
                            <div class="copy">
                                <p>&copy; 2017 Template by Abel Zapata</p>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </footer>
    </div>
</body>

</html>
