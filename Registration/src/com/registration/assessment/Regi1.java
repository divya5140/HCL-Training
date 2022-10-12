package com.registration.assessment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/Regi1")
public class Regi1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		response.setContentType("text/html");
		try {
			PrintWriter pw=response.getWriter();
			Class.forName("com.mysql.cj.jdbc.Driver");
			String fname=request.getParameter("firstname");
			String lname=request.getParameter("lastname");
			String phNum=request.getParameter("phonenumber");
			String email=request.getParameter("email");
			
			java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/database1","root","Divya@514");
			String query1="insert into register values(?,?,?,?)";
			PreparedStatement pt=con.prepareStatement(query1);
		    pt.setString(1,fname);
		    pt.setString(2, lname);
		    pt.setString(3, phNum);
		    pt.setString(4,email);

		    pt.execute();
		    
		    
		    String[] val=request.getParameterValues("lang");
		    String query2="insert into language values (?,?)";
		    PreparedStatement pt1=con.prepareStatement(query2);
		    for(int i=0;i<val.length;i++)
		    {
		    	pt1.setString(1,email);
		    	pt1.setString(2,val[i] );
		    	pt1.execute();
		    }
		    response.sendRedirect("success.jsp");
		          
		    
		    
		   
		   
	        
		}

catch(SQLException e){
	System.out.println("Could not connect to the database"+e.getMessage());
	e.printStackTrace();
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}	
	}

}
