<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Commuter Dashboard - Active Routes</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f6f9; }
        h2 { color: #1a365d; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; background: #fff; }
        th, td { border: 1px solid #cbd5e0; padding: 12px; text-align: left; }
        th { background-color: #2b6cb0; color: white; }
        .error { color: #c53030; font-weight: bold; background-color: #fff5f5; padding: 8px; border: 1px solid #feb2b2; }
        .success { color: #276749; font-weight: bold; background-color: #f0fff4; padding: 8px; border: 1px solid #9ae6b4; }
        .btn { background-color: #3182ce; color: white; padding: 6px 12px; border: none; cursor: pointer; border-radius: 4px; }
        .disabled-btn { background-color: #a0aec0; color: white; padding: 6px 12px; border: none; cursor: not-allowed; border-radius: 4px; }
    </style>
</head>
<body>
    <h2>Commuter Dashboard - Active Routes</h2>

    <% if (request.getParameter("msg") != null) { %>
        <p class="success"><%= request.getParameter("msg") %></p>
    <% } %>
    <% if (request.getParameter("error") != null) { %>
        <p class="error"><%= request.getParameter("error") %></p>
    <% } %>

    <table>
        <thead>
            <tr>
                <th>Trip ID</th>
                <th>Path (Origin → Dest)</th>
                <th>Fare/Seat</th>
                <th>Capacity</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>TR-801</td>
                <td>Navi Mumbai → Pune</td>
                <td>Rs 350.00</td>
                <td>2 Seats</td>
                <td>
                    <form action="ReserveSeatServlet" method="POST">
                        <input type="hidden" name="journeyId" value="801">
                        <input type="number" name="requiredSeats" min="1" max="2" value="1" required>
                        <button type="submit" class="btn">Book</button>
                    </form>
                </td>
            </tr>
            <tr>
                <td>TR-802</td>
                <td>Bandra → Andheri East</td>
                <td>Rs 50.00</td>
                <td>3 Seats</td>
                <td>
                    <form action="ReserveSeatServlet" method="POST">
                        <input type="hidden" name="journeyId" value="802">
                        <input type="number" name="requiredSeats" min="1" max="3" value="1" required>
                        <button type="submit" class="btn">Book</button>
                    </form>
                </td>
            </tr>
            <tr>
                <td>TR-803</td>
                <td>Thane → CST Mumbai</td>
                <td>Rs 120.00</td>
                <td>1 Seat</td>
                <td>
                    <form action="ReserveSeatServlet" method="POST">
                        <input type="hidden" name="journeyId" value="803">
                        <input type="number" name="requiredSeats" min="1" max="1" value="1" required>
                        <button type="submit" class="btn">Book</button>
                    </form>
                </td>
            </tr>
            <tr>
                <td>TR-804</td>
                <td>Vashi → Borivali</td>
                <td>Rs 200.00</td>
                <td>0 Seats</td>
                <td>
                    <button type="button" class="disabled-btn" disabled>Full</button>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>
