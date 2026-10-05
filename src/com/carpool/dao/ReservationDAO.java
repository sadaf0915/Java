package com.carpool.dao;

import com.carpool.util.DatabaseConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReservationDAO {

    public boolean confirmReservation(int passengerId, int journeyId, int requiredSeats) {
        boolean transactionSuccess = false;
        String checkCapQuery = "SELECT seat_count FROM tbl_journeys WHERE journey_id = ?";
        String insertResQuery = "INSERT INTO tbl_reservations (member_id, journey_id, seats) VALUES (?, ?, ?)";
        String decrementQuery = "UPDATE tbl_journeys SET seat_count = seat_count - ? WHERE journey_id = ?";

        try (Connection dbConn = DatabaseConfig.getConnection()) {
            dbConn.setAutoCommit(false); // Initialize atomic transaction

            // Verify sufficient capacity
            PreparedStatement capStmt = dbConn.prepareStatement(checkCapQuery);
            capStmt.setInt(1, journeyId);
            ResultSet resultSet = capStmt.executeQuery();

            if (resultSet.next() && resultSet.getInt("seat_count") >= requiredSeats) {
                // Log the reservation
                PreparedStatement resStmt = dbConn.prepareStatement(insertResQuery);
                resStmt.setInt(1, passengerId);
                resStmt.setInt(2, journeyId);
                resStmt.setInt(3, requiredSeats);
                resStmt.executeUpdate();

                // Deduct the seats
                PreparedStatement decStmt = dbConn.prepareStatement(decrementQuery);
                decStmt.setInt(1, requiredSeats);
                decStmt.setInt(2, journeyId);
                decStmt.executeUpdate();

                dbConn.commit(); // Finalize changes
                transactionSuccess = true;
            } else {
                dbConn.rollback(); // Abort if constraints fail
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return transactionSuccess;
    }
}
