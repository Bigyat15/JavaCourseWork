package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.categoryDAO;
import DAO.productModelDAO;
import models.categoryModel;
import models.productModel;

/**
 * Servlet implementation class productMain
 */
@WebServlet("/store")
public class store extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private productModelDAO dao;
    private categoryDAO dao1;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public store() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init() {
    	dao = new productModelDAO();
    	dao1 = new categoryDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String categoryName = request.getParameter("category");
		String search = request.getParameter("search");
		ArrayList<productModel> productList;
		if(search != null && !search.isEmpty()) {
			productList = dao.searchCars(search); 
            System.out.println("Search results for: " + search + ", Products found: " + productList.size());
		}else if(categoryName !=null && !categoryName.isEmpty()) {
			productList = dao.getProductsByCategoryName(categoryName);
            System.out.println("Filtered by category: " + categoryName + ", Products found: " + productList.size());
		}else {
			productList = dao.getAllProductDetail();
			System.out.println("All products loaded: " + productList.size());
        
		}
        System.out.println("car: " + productList.size());
        request.setAttribute("productList", productList);
        
        ArrayList<categoryModel> allCategories = dao1.getAllCategory(); // For dropdown or links
        request.setAttribute("productList", productList);
        request.setAttribute("categoryList", allCategories);
        request.getRequestDispatcher("/pages/store.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
