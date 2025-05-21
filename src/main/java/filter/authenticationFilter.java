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
	    // pass the request along the filter chain
	    HttpServletRequest req = (HttpServletRequest) request;
	    HttpServletResponse res = (HttpServletResponse) response;
	    HttpSession session = req.getSession(false);
	    
	    String uri = req.getRequestURI();
	    String contextPath = req.getContextPath();

	    // Check if the user is already logged in
	    boolean loggedIn = (session != null && session.getAttribute("user_id") != null);

	    // Check if it's the login page
	    boolean isLoginPage = uri.endsWith("login.jsp") || uri.endsWith("/login");
	    boolean isRegisterPage = uri.endsWith("register.jsp") || uri.endsWith("/register");

	    if (loggedIn && (isLoginPage || isRegisterPage)) {
	        // If logged in and trying to access the login page, redirect them to the appropriate page
	        Integer userId = (Integer) session.getAttribute("user_id");
	        Boolean isAdmin = (Boolean) session.getAttribute("is_admin");

	        // Redirect based on user role
	        if (isAdmin != null && isAdmin) {
	            res.sendRedirect(contextPath + "/pages/adminDashboard.jsp");
	        } else {
	            res.sendRedirect(contextPath + "/car");
	        }
	        return;
	    }

	    // Other pages logic
	    boolean isAdminPage = uri.endsWith("adminDashboard"); // Adjust this based on your URL
	    boolean isAddToCartPage = uri.contains("cart.jsp") || uri.contains("cart.jsp"); // Adjust as per your project
	    boolean isUserDashboardPage = uri.contains("userDashboard.jsp");

	    // Handling user login status
	    if (isAdminPage || isAddToCartPage || isUserDashboardPage) {
	        // These pages need login
	        if (loggedIn) {
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
