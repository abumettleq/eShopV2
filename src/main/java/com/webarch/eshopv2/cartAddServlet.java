package com.webarch.eshopv2;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.CropImageFilter;
import java.io.IOException;
import java.io.PrintWriter;

public class cartAddServlet extends HttpServlet {
    PrintWriter out;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        ProductView view = (ProductView)session.getAttribute("viewObject");

        int Pid = Integer.parseInt(request.getParameter("pid"));

        int index = view.findInCart(Pid);
        if(index == -1) // if product is not in the cart
        {
            int indexOfProduct = view.findInProduct(Pid);
            Product product = view.getProducts().get(indexOfProduct);

            CartItem item = new CartItem();
            item.setPid(product.getPid());
            item.setTitle(product.getTitle());
            item.setPrice(product.getPrice());
            item.setImageSrc(product.getImageSrc());
            item.setQuantity(1);

            view.addProductToCart(item);
        }
        else // if product is in the cart already, then update quantity only
        {
            int indexOfProduct = view.findInProduct(Pid);
            Product product = view.getProducts().get(indexOfProduct);

            CartItem item = view.getCart().get(index);
            item.setQuantity(item.getQuantity() + 1);
            item.setPrice(item.getPrice()+product.getPrice());
            view.updateItemInCart(index,item);
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        out = response.getWriter();
        out.println("<div class=\"alert success\">\n" +
                "\t\t<input type=\"checkbox\" id=\"alert2\"/>\n" +
                "\t\t<label class=\"close\" title=\"close\" for=\"alert2\">\n" +
                "      <i class=\"icon-remove\"></i>\n" +
                "    </label>\n" +
                "\t\t<p class=\"inner\">\n" +
                "\t\t\tItem added to cart successfully.\n" +
                "\t\t</p>\n" +
                "\t</div>");
        requestDispatcher.include(request,response);

    }
}
