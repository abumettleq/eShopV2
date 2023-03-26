package com.webarch.eshopv2;

public class Product {
    private int Pid, Price;
    private String Title, imageSrc;

    public void setPrice(int price) {
        Price = price;
    }

    public void setImageSrc(String imageSrc) {
        this.imageSrc = imageSrc;
    }

    public void setPid(int pid) {
        Pid = pid;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public int getPrice() {
        return Price;
    }

    public int getPid() {
        return Pid;
    }

    public String getTitle() {
        return Title;
    }

    public String getImageSrc() {
        return imageSrc;
    }
}
