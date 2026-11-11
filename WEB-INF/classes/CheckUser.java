// package com.medicare.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CheckUser")
public class CheckUser extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");

        try {
		 Class.forName("com.mysql.cj.jdbc.Driver");
            	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicine", "root", "root@123");
 // your DB class

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM login WHERE logname=?"
            );

            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                out.print("exists");
            } else {
                out.print("not");
            }

        } catch(Exception e) {
            out.print("error");
            e.printStackTrace();
        }
    }
}