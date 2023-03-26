package com.webarch.eshopv2;

import sun.rmi.server.Dispatcher;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

public class cartAuthFilter implements Filter {
    FilterConfig filterConfig = null;
    public void init(FilterConfig config) {
        filterConfig = config;
    }

    public void destroy() {
        filterConfig = null;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException
    {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession(false);

        if(session == null || session.getAttribute("viewObject") == null)
        {
            ProductView view = new ProductView();
            ProductModel model = null;
            try {
                model = new ProductModel();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            ProductController controller = new ProductController(model,view);
            try {
                controller.fetchProductsFromModel();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            session = ((HttpServletRequest) request).getSession(true);
            session.setAttribute("viewObject",view);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            requestDispatcher.include(request,response);
        }
        else chain.doFilter(request, response);
    }

}
