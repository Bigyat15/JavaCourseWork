package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.carModelDAO;
import models.carModel;

/**
 * Servlet implementation class car
 */
@WebServlet("/car")
public class car extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private carModelDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public car() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init() {
    	dao = new carModelDAO();
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ArrayList<carModel> carList = new ArrayList<carModel>();
		try {
			carList = dao.getAllCars();
			for(carModel c:carList) {
				System.out.println("Car Name:"+c.getCarName());
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

}
