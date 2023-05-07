package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Auth;
import model.User;

/**
 * Servlet Filter implementation class LoginFilter
 */
public class AdminAreaFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpSession session = ((HttpServletRequest) request).getSession();
		String loggedInUserName = (String) session.getAttribute("loggedInUserName");
		if (loggedInUserName != null) {
			Auth authModel = new Auth();
			User loggedInUser = authModel.getUserWithUserName(loggedInUserName);
			if (loggedInUser.getAccountType().equals("admin")) {
				chain.doFilter(request, response);
			}
		}
		((HttpServletResponse) response)
				.sendRedirect("/error?type=Admin+Area&message=You+need+to-login-as-admin-to-access-this.");
	}

	public void destroy() {

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
