package it.unirc.nba.servlet.privato.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class ReindirizzaHome
 */
@WebServlet("/privato/admin/ReindirizzaHome")
public class ReindirizzaHome extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ReindirizzaHome() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/privato/admin/areaAdmin.jsp");
    }
}

