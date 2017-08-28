<%-- 
    Document   : header_home
    Created on : 27/08/2017, 03:15:44 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        
    </head>
    <body>
        <div class="header_top">
            <div class="col-sm-3 logo"><a href="home.htm"><img src="${pageContext.request.contextPath}/recursos/images/logo.jpg" alt=""/></a></div>
            <div class="col-sm-6 nav">
                <ul>
                    <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Cartelera"><a href=""> </a></span></li>
                    <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Próximos Estrenos"><a href=""> </a> </span></li>
                    <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Cines"><a href=""> </a></span></li>
                    <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Ventas Corporativas"><a href=""> </a></span></li>
                    <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Contáctanos"><a href=""> </a></span></li>
                </ul>
            </div>
            <div class="col-sm-3 header_right">
                <ul class="header_right_box">
                    <li><img src="<c:url value="/recursos/images/user.png"/>" alt="" /></li>
                    <li>
                        <p><a href="login.htm">Cesar Achahui</a></p>
                    </li>
                    <li class="last"><i class="edit"> </i></li>
                </ul>
            </div>
            <div class="clearfix"> </div>
        </div>     
       
    </body>
</html>
