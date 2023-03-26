package com.webarch.eshopv2;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class cartEditServlet extends HttpServlet {
    PrintWriter out;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int tid = Integer.parseInt(request.getParameter("tid"));
        int newQuantity = Integer.parseInt(request.getParameter("newQuantity"));

        HttpSession session = request.getSession(false);
        ProductView view = (ProductView) session.getAttribute("viewObject");

        CartItem tempItem = view.getCart().get(tid);

        CartItem newItem = new CartItem();
        newItem.setQuantity(newQuantity);
        newItem.setPrice(newQuantity*(tempItem.getPrice()/tempItem.getQuantity()));
        newItem.setImageSrc(tempItem.getImageSrc());
        newItem.setTitle(tempItem.getTitle());
        newItem.setPid(tempItem.getPid());
        view.updateItemInCart(tid,newItem);

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
}
