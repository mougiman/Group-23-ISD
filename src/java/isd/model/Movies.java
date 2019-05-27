/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package isd.model;

import java.util.ArrayList;

/**
 *
 * @author Mougi
 */
public class Movies {
     private ArrayList<Movie> list = new ArrayList<Movie>();
 
    public ArrayList<Movie> getMovies() {
        return list;
    }
    
    public void addMovie(Movie movie) {
        list.add(movie);
    }
    public void removeMovie(Movie movie) {
        list.remove(movie);
    }
    
    public Movie getMovie(String name) {
        for (Movie movie : list) {
            if (movie.getName().equals(name)) {
                return movie;
            }
        }
        return null;
    }
}
