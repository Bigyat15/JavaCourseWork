//package controller;
//
//import java.io.IOException;
//import java.util.ArrayList;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import DAO.productImageModelDAO;
//import DAO.productModelDAO;
//import models.productImageModel;
//import models.productModel;
//
///**
// * Servlet implementation class store
// */
//@WebServlet("/store")
//public class store extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//    private productModelDAO dao;
//    private productImageModelDAO dao1;
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public store() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//    public void init() {
//    	dao = new productModelDAO();
//    	dao1 = new productImageModelDAO();
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Retrieve all product details
//        
//        // Get the car_id parameter from the request
//        String carName = request.getParameter("car_name");
//       
//         ArrayList<productImageModel> imageList = dao1.getProductImage(carName);  // Pass carId to the method
//         System.out.println("ImageList: " + imageList.size());
//         request.setAttribute("imageList", imageList);
//            
//        
//        request.getRequestDispatcher("/pages/store.jsp").forward(request, response);
//    }
//
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
//
//}
