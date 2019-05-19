/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package isd.model;

/**
 *
 * @author Mougi
 */
public class Movie {
    private int ID;
    private String Name;
    private String Genre;
    private String Decription;
    private String PosterRef;
    private Double Price;
    private int Stock;
    private int Sold;

    public Movie(int ID, String Name, String Genre, String Decription, String PosterRef, Double Price, int Stock, int Sold) {
        this.ID = ID;
        this.Name = Name;
        this.Genre = Genre;
        this.Decription = Decription;
        this.PosterRef = PosterRef;
        this.Price = Price;
        this.Stock = Stock;
        this.Sold = Sold;
    }
    
    public Movie(){
        
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getGenre() {
        return Genre;
    }

    public void setGenre(String Genre) {
        this.Genre = Genre;
    }

    public String getDecription() {
        return Decription;
    }

    public void setDecription(String Decription) {
        this.Decription = Decription;
    }

    public String getPosterRef() {
        return PosterRef;
    }

    public void setPosterRef(String PosterRef) {
        this.PosterRef = PosterRef;
    }

    public Double getPrice() {
        return Price;
    }

    public void setPrice(Double Price) {
        this.Price = Price;
    }

    public int getStock() {
        return Stock;
    }

    public void setStock(int Stock) {
        this.Stock = Stock;
    }

    public int getSold() {
        return Sold;
    }

    public void setSold(int Sold) {
        this.Sold = Sold;
    }


    
    
    
}
