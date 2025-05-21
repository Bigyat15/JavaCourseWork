package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import DAO.categoryDAO;

import models.categoryModel;

/**
 * Servlet implementation class car
 */
@WebServlet("/car")
public class car extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private categoryDAO dao2;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public car() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init() {
    	
    	dao2 = new categoryDAO();
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Integer userID =(Integer) request.getSession().getAttribute("user_id");
		
		ArrayList<categoryModel> categoryList = dao2.getAllCategory();
		request.setAttribute("categoryList", categoryList);
		System.out.println("Category found successfully"+categoryList.size());
		for (categoryModel cat : categoryList) {
		    System.out.println("Category Name: " + cat.getCategory_name());
		    System.out.println("Category Description: " + cat.getCategory_description());
		}

	
		request.getRequestDispatcher("/pages/main.jsp").forward(request,response);
		
		
		

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}