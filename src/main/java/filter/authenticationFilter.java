package filter;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.loginModel;

/**
 * Servlet Filter implementation class authenticationFilter
 */
@WebFilter("/*")
public class authenticationFilter  implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public authenticationFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(false);
		
		
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String userIdParam = request.getParameter("user_id");
		String firstName = request.getParameter("first_name");
		String lastName = request.getParameter("last_name");
		String dob = request.getParameter("dob");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone_number");
        String password = request.getParameter("password");
        String createdAtParam = request.getParameter("created_at");
        String updatedAtParam = request.getParameter("updated_at");

        LocalDateTime createdAt = null;
        LocalDateTime updatedAt = null;

        try {
            if (createdAtParam != null && !createdAtParam.trim().isEmpty()) {
                createdAt = LocalDateTime.parse(createdAtParam);  // You can add DateTimeFormatter if needed
                System.out.println("Created At Param: " + createdAtParam);

            }
            if (updatedAtParam != null && !updatedAtParam.trim().isEmpty()) {
                updatedAt = LocalDateTime.parse(updatedAtParam);
            }
        } catch (Exception e) {
            res.sendRedirect(contextPath + "/pages/login.jsp?error=invalidDateTimeFormat");
            return;
        }



        // Check if user_id is not null and can be parsed to an integer
        Integer userID = null;
        if (userIdParam != null && !userIdParam.trim().isEmpty()) {
            try {
                userID = Integer.parseInt(userIdParam);
            } catch (NumberFormatException e) {
                res.sendRedirect(contextPath + "/pages/login.jsp?error=invalidUserId");
                return;
            }
        }
		boolean isLoginPage = uri.endsWith("login.jsp");
		boolean isLoginServlet = uri.endsWith("/login");
		
		boolean isAdminPage = uri.contains("adminDashboard.jsp"); // Adjust this based on your URL
	    boolean isAddToCartPage = uri.contains("cart.jsp") || uri.contains("cart.jsp"); // Adjust as per your project
	    
	    
		
		loginModel login = new loginModel(userID,firstName,lastName,dob,email,phoneNumber,password,false,createdAt,updatedAt);
		loginModel result = new loginModel(userID,firstName,lastName,dob,email,phoneNumber,password,false,createdAt,updatedAt);
		boolean loggedIn = (session != null && session.getAttribute("user_id") != null);
		boolean alreadyRedirected = (session != null && session.getAttribute("redirected")!=null);
		
//		if(loggedIn && !alreadyRedirected) {
//			Integer userId = (Integer) session.getAttribute("user_id");
//			Boolean isAdmin = (Boolean) session.getAttribute("is_admin");
//			session.setAttribute("redirected",true);
//			if (isAdmin != null && isAdmin) {
//	            res.sendRedirect(contextPath + "/pages/adminDashboard.jsp");
//	        } else {
//	            res.sendRedirect(contextPath + "/car");
//	        }
//			return;
//		}
		
		
		
		if (isAdminPage || isAddToCartPage) {
	        // These pages need login
	        if (loggedIn || isLoginPage || isLoginServlet) {
	            chain.doFilter(request, response);
	        } else {
	            res.sendRedirect(contextPath + "/pages/login.jsp"); 
	        }
	    } else {
	        // Public pages - no login required
	        chain.doFilter(request, response);
	    }
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
