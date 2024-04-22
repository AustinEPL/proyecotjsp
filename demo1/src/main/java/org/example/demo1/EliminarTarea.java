package org.example.demo1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/EliminarTarea")
public class EliminarTarea extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IOException {
        // Obtener el ArrayList de actividades del ámbito de la solicitud
        HttpSession session = request.getSession();
        ArrayList<String> listaActividades = (ArrayList<String>) session.getAttribute("actividades");

        // Obtener el índice del elemento a eliminar del parámetro de la solicitud
        int indiceEliminar = Integer.parseInt(request.getParameter("idActividad"));

        // Eliminar el elemento del ArrayList
        listaActividades.remove(indiceEliminar);

        // Redirigir de vuelta a la página principal
        response.sendRedirect("todo.jsp");
    }
}