package com.webarch.eshopv2;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class cartRemoveServlet extends HttpServlet {
    PrintWriter out;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("removal");
        HttpSession session = request.getSession(false);
        ProductView view = (ProductView) session.getAttribute("viewObject");

        switch (type)
        {
            case "all":
                view.emptyCart();
                break;
            case "one":
                int tid = Integer.parseInt(request.getParameter("tid"));
                view.removeProductFromCart(tid);
                break;
            default:
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart.jsp");
                out = response.getWriter();
                out.println("<div class=\"alert error\">\n" +
                        "\t\t<input type=\"checkbox\" id=\"alert2\"/>\n" +
                        "\t\t<label class=\"close\" title=\"close\" for=\"alert2\">\n" +
                        "      <i class=\"icon-remove\"></i>\n" +
                        "    </label>\n" +
                        "\t\t<p class=\"inner\">\n" +
                        "\t\t\tError: Type Of Removal Wasn't Given.\n" +
                        "\t\t</p>\n" +
                        "\t</div>");
                requestDispatcher.include(request,response);
                return;
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart.jsp");
        out = response.getWriter();
        out.println("<div class=\"alert success\">\n" +
                "\t\t<input type=\"checkbox\" id=\"alert2\"/>\n" +
                "\t\t<label class=\"close\" title=\"close\" for=\"alert2\">\n" +
                "      <i class=\"icon-remove\"></i>\n" +
                "    </label>\n" +
                "\t\t<p class=\"inner\">\n" +
                "\t\t\tCart updated successfully.\n" +
                "\t\t</p>\n" +
                "\t</div>");
        requestDispatcher.include(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
