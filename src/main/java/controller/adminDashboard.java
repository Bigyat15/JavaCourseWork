package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.loginModelDAO;

import DAO.productModelDAO;
import models.loginModel;

import models.productModel;

/**
 * Servlet implementation class adminDashboard
 */
@WebServlet("/adminDashboard")
public class adminDashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private loginModelDAO dao;
    private productModelDAO dao1;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminDashboard() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init() {
    	dao = new loginModelDAO();
    	dao1 = new productModelDAO();
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<loginModel> loginList;
		ArrayList<productModel> productList = new ArrayList<>();
		try {
			
			loginList = dao.getAllUserInfo();
			request.setAttribute("loginList",loginList);
			
		
			
	        productList = dao1.getAllProductDetail();
			request.setAttribute("productList", productList);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("/pages/adminDashboard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
