package com.webarch.eshopv2;

import java.sql.SQLException;
import java.util.ArrayList;

public class ProductController {
    private final ProductModel model;
    private final ProductView view;

    public ProductController(ProductModel m, ProductView v)
    {
        this.model = m;
        this.view = v;
    }

    public void fetchProductsFromModel() throws SQLException {
        view.setProducts(model.fetchProducts());
    }
}
