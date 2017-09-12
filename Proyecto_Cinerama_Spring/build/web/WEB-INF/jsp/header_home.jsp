<%-- 
    Document   : header_home
    Created on : 27/08/2017, 03:15:44 PM
    Author     : Usuario
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% HttpSession sesion = request.getSession(true);  
    String usuario = "Iniciar Sesión";
    String id = "";
    String ref = "login.htm";
    if(sesion.getAttribute("usuario") != null){
        usuario = sesion.getAttribute("usuario").toString();
        id = sesion.getAttribute("id").toString();
        ref = "panel.htm";
    }%>
            <div class="header_top">
                <div class="col-sm-4 col-md-3 logo"><a href="home.htm"><img src="${pageContext.request.contextPath}/recursos/images/logo.jpg" alt=""/></a></div>
                <div class="col-sm-10 col-md-6 nav">
                    <nav class="navbar navbar-default">
                        <div class="container-fluid">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="true">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                              </button>
                               <a class="navbar-brand" href="home.htm">Cinerama</a>
                            </div>
                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul id="menu-nav" class="nav navbar-nav">
                                    <li id="cartelera"><a href="#">Cartelera <span class="sr-only">(current)</span></a></li>
                                    <li id="estrenos"><a href="#">Próximos Estrenos</a></li>
                                    <li id="cines"><a href="#">Cines</a></li>
                                    <li id="contactanos"><a href="contactanos.htm">Contáctanos</a></li>
                                </ul>
                            </div><!-- /.navbar-collapse -->
                      </div><!-- /.container-fluid -->
                    </nav>
                </div>
                <div class="col-sm-2 col-md-3 header_right">
                    <ul class="header_right_box">
                        <li>
                            <p><a href=<%=ref%>><%=usuario%></a></p>
                        </li>
                        <%if(usuario != "Iniciar Sesión"){%>
                        <li class="last">
                            <% sesion.setAttribute("logout","true");%>
                            <a href="home.htm">Salir</a>
                        </li>    
                        <%}%>
                    </ul>
                </div>
                <div class="clearfix"> </div>
            </div>     