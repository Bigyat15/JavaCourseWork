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
//import DAO.productModelDAO;
//import models.productModel;
//
///**
// * Servlet implementation class productMain
// */
//@WebServlet("/productMain")
//public class productMain extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//    private productModelDAO dao;
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public productMain() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//    public void init() {
//    	dao = new productModelDAO();
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		ArrayList<productModel> productList = dao.getAllProductDetail();
//        System.out.println("car: " + productList.size());
//        request.setAttribute("productList", productList);
//        request.getRequestDispatcher("/pages/productDetail.jsp").forward(request, response);
//	}
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
