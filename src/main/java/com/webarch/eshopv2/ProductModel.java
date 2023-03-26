package com.webarch.eshopv2;
import java.sql.*;
import java.util.ArrayList;

public class ProductModel {
    private final Connection connect;
    private final Statement statement;
    private ResultSet resultSet;

    public ProductModel() throws Exception
    {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connect = DriverManager.getConnection("jdbc:mysql://localhost/ofsmsdb?user=root&password=");
        statement = connect.createStatement();
    }

    public ArrayList<Product> fetchProducts() throws SQLException {
        String sql = "select ProductID,ProductTitle,SalePrice,Image from tblproducts";
        resultSet = statement.executeQuery(sql);
        ArrayList<Product> Products = new ArrayList<Product>();
        while (resultSet.next())
        {
            Product product = new Product();
            product.setPid(resultSet.getInt(1));
            product.setTitle(resultSet.getString(2));
            product.setPrice(resultSet.getInt(3));
            product.setImageSrc(resultSet.getString(4));
            Products.add(product);
        }
        return Products;
    }

}
