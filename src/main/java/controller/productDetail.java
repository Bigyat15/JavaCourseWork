package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.categoryDAO;
import DAO.colorModelDAO;
import DAO.productImageModelDAO;
import DAO.productModelDAO;
import models.categoryModel;
import models.colorModel;
import models.productImageModel;
import models.productModel;

/**
 * Servlet implementation class productDetail
 */
@WebServlet("/productDetail")
public class productDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private productImageModelDAO dao;
//    private productModelDAO dao1;
    private colorModelDAO dao2;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productDetail() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init() {
    	dao = new productImageModelDAO();
//    	dao1 = new productModelDAO();
    	dao2 = new colorModelDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String carName = request.getParameter("car_name");
		if(carName == null || carName.trim().isEmpty()) {
			request.getRequestDispatcher("/pages/somethingWentWrong.jsp").forward(request, response);
			return;
		}
		System.out.println("CarName: "+ carName);
		ArrayList<productImageModel> imageList = dao.getProductImage(carName);
		System.out.println("ImageList: " + imageList.size());
		request.setAttribute("imageList", imageList);

		try {
			ArrayList<colorModel> colorList = dao2.getColorList(carName);
			System.out.println("colorList: "+colorList.size());
			request.setAttribute("colorList", colorList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
//		ArrayList<productModel> productList = dao1.getAllProductDetail();
//		System.out.println("productList" + productList.size());
//		request.setAttribute("productList", productList);
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
