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

public class JSPFilter implements Filter {
	public void init(FilterConfig config) throws ServletException {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws ServletException, IOException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		// Check if the request is for the restricted JSP file
		String requestedUrl = httpRequest.getRequestURL().toString();
		if (requestedUrl.endsWith(".jsp")) {

			// Check if the request is coming from the server itself
			String serverName = httpRequest.getServerName();
			int serverPort = httpRequest.getServerPort();
			String referer = httpRequest.getHeader("referer");
			if (referer == null || !referer.startsWith("http://" + serverName + ":" + serverPort)) {
				httpResponse.sendRedirect(httpRequest.getContextPath() + "/error.jsp");
				return;
			}
		}

		chain.doFilter(request, response);
	}

	public void destroy() {
	}
}