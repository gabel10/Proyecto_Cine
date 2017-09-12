<%@page import="javax.servlet.http.HttpServletResponse"%>
<% HttpSession sesion = request.getSession(true);  
    String usuario = "Iniciar Sesión";
    String id = "";
    if(sesion.getAttribute("usuario") != null){
        usuario = sesion.getAttribute("usuario").toString();
        id = sesion.getAttribute("id").toString();
    }
    %>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="">Cinerama Administrador</a>
    </div>
    <!-- Top Menu Items -->
    <ul class="nav navbar-right top-nav">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <%=usuario%><b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li>
                    <a href="panel.htm"><i class="fa fa-fw fa-user"></i> Panel</a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href=""><i class="fa fa-fw fa-power-off"></i> Salir</a>
                </li>
            </ul>
        </li>
    </ul>
    <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
    <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav side-nav">
            <li class="active">
                <a href=""><i class="fa fa-fw fa-dashboard"></i> Panel</a>
            </li>
            <li>
                <a href=""><i class="fa fa-fw fa-bar-chart-o"></i> Estadísticas</a>
            </li>
            <li>
                <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Mantenimiento <i class="fa fa-fw fa-caret-down"></i></a>
                <ul id="demo" class="collapse">
                    <li>
                        <a href="">Usuarios</a>
                    </li>
                    <li>
                        <a href="">Clientes</a>
                    </li>
                    <li>
                        <a href="">Productos de Dulcería</a>
                    </li>
                    <li>
                        <a href="index_salas.htm">Salas</a>
                    </li>
                    <li>
                        <a href="index_peliculas.htm">Peliculas</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- /.navbar-collapse -->
</nav>

