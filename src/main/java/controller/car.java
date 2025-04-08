package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.carDAO;
import models.carModel;

/**
 * Servlet implementation class car
 */
@WebServlet("/car")
public class car extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private carDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public car() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init() {
    	dao = new carDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<carModel> carList = dao.getAllCars();
		System.out.println("Cars found in database: " + carList.size());

		// Optional: Print names to debug
		for (carModel car : carList) {
			System.out.println("Car: " + car.getCar_brand());
		}
		request.setAttribute("carList", carList);
		request.getRequestDispatcher("/pages/carList.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
