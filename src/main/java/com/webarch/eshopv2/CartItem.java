package com.webarch.eshopv2;

public class CartItem extends Product{
    private int Quantity;

    public void setQuantity(int quantity) {
        Quantity = quantity;
    }

    public int getQuantity() {
        return Quantity;
    }
}
