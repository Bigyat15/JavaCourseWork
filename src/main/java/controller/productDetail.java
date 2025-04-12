package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.productImageModelDAO;
import models.productImageModel;

/**
 * Servlet implementation class productDetail
 */
@WebServlet("/productDetail")
public class productDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private productImageModelDAO dao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productDetail() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init() {
    	dao = new productImageModelDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String carName = request.getParameter("car_name");
		ArrayList<productImageModel> imageList = dao.getProductImage(carName);
		System.out.println("ImageList: " + imageList.size());
		request.setAttribute("imageList", imageList);
		request.getRequestDispatcher("/pages/productDetailPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
