package com.webarch.eshopv2;

import java.util.ArrayList;


public class ProductView {
    private ArrayList<CartItem> Cart; // used to store user's chosen items in cart and show them to the user
    private ArrayList<Product> Products; // used to store products fetched from database and show them to the user

    public ProductView()
    {
        this.Cart = new ArrayList<CartItem>();
        this.Products = new ArrayList<Product>();
    }

    public ArrayList<CartItem> getCart() {
        return Cart;
    }

    public void addProductToCart(CartItem cartItem)
    {
        this.Cart.add(cartItem);
    }

    public void updateItemInCart(int index, CartItem item)
    {
        this.Cart.set(index,item);
    }

    public void removeProductFromCart(int index)
    {
        this.Cart.remove(index);
    }

    public void setProducts(ArrayList<Product> products) {
        Products = products;
    }

    public ArrayList<Product> getProducts() {
        return Products;
    }

    public int getProductsSize()
    {
        return this.Products.size();
    }

    public void emptyCart()
    {
        this.Cart.clear();
    }

    public int findInCart(int value)
    {
        int index = 0;
        for(CartItem item : this.Cart)
        {
            if(item.getPid() == value) return index;
            else index++;
        }
        return -1;
    }

    public int findInProduct(int value)
    {
        int index = 0;
        for(Product product : this.Products)
        {
            if(product.getPid() == value) return index;
            else index++;
        }
        return -1;
    }

    public int getCartTotal()
    {
        if(this.Cart.isEmpty()) return 0;
        int total = 0;
        for(CartItem item : this.Cart)
        {
            total = total + item.getPrice();
        }
        return total;
    }
}
