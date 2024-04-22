<%--
  Created by IntelliJ IDEA.
  User: edgep
  Date: 21/04/2024
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<%@ page import="org.example.demo1.Tarea" %>

<html>
<head>
    <title>Lista de tareas</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="contenedor">

<h1>Registro de tareas por hacer</h1>

<form action="todo.jsp" method="post">
    <table>
        <tr>
            <td>Ingrese los datos de la actividad</td>
        </tr>

    <tr>
        <td>Nombre de la actividad</td>
    <td><input required name="actividad" type="text" placeholder="Ingrese la actividad"></td>
    </tr>

  <tr>
      <td>Curso</td>

      <td>  <input required name="curso" type="text" placeholder="Ingrese el curso"></td>

  </tr>

<tr>

    <td>Prioridad de la actividad</td>
    <td> <input  required name="prioridad" type="range" id="valor" min="1" max="10" step="1"></td>
</tr>
        <tr>
            <td>Fecha fin para completar la actividad</td>
            <td><input required name="fecha" type="date"></td>
            <td></td>  <td><input id="btn" type="submit" value="Registrar actividad"></td>
            <td></td>  <td><input id="btnPrio" type="button" value="Ordenar por prioridad"></td>

        </tr>





    </table>
</form>


<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%
    List<Tarea> tareas=(List<Tarea>)session.getAttribute("actividades");
    //creamos la sesion
    //verificamos que la lista este vacia para poder crear la sesion
    if(tareas==null){
        tareas= new ArrayList<Tarea>();
        //iniciamos la sesion
        session.setAttribute("actividades",tareas);

    }

    String[] actividades=request.getParameterValues("actividad");
    String[] curso=request.getParameterValues("curso");
    String[] prioridad=request.getParameterValues("prioridad");
    String[] fecha=request.getParameterValues("fecha");

    if(actividades!=null){
        for(int i=0;i<actividades.length;i++){
         tareas.add(new Tarea(actividades[i],curso[i],fecha[i],prioridad[i]));
        }
    }



    int i=0;
    %>
<table id="result">
    <thead><td>Actividad</td><td>Curso</td><td>Prioridad</td><td>Fecha fin</td><td>Terminado</td><td>Eliminar</td></thead>

    <%
    for (Tarea tarea : tareas) {

%>

    <tr>
        <td><%= tarea.getNombre() %></td><td><%= tarea.getCurso() %></td><td><%= tarea.getPrioridad() %></td><td><%= tarea.getFechaVencimiento() %></td><td><form action="EliminarTarea" method="post"> <input type="hidden" name="idActividad" value="<%= i%>"><input type="submit" value="Terminado"></form></td><td></form><form action='eliminar.jsp' method='post'><input type='submit' value='Eliminar'></form></td>
    </tr>

<%
        i++;
    }


%>
</table>
</div>
</body>
</html>
