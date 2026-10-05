package com.carpool.servlet;

import com.carpool.dao.ReservationDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ReserveSeatServlet")
public class ReserveSeatServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReservationDAO reservationDAO = new ReservationDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        // Unregistered or unauthenticated user check
        if (session == null || session.getAttribute("memberId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            int passengerId = (Integer) session.getAttribute("memberId");
            int journeyId = Integer.parseInt(request.getParameter("journeyId"));
            int requiredSeats = Integer.parseInt(request.getParameter("requiredSeats"));

            boolean success = reservationDAO.confirmReservation(passengerId, journeyId, requiredSeats);

            if (success) {
                response.sendRedirect("commuter-feed.jsp?msg=Seat reserved successfully!");
            } else {
                response.sendRedirect("commuter-feed.jsp?error=Requested seats exceed available capacity!");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("commuter-feed.jsp?error=Invalid input details!");
        }
    }
}
