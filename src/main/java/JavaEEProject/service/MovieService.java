package JavaEEProject.service;

import JavaEEProject.model.Category;
import JavaEEProject.model.Movie;

import java.util.List;

public interface MovieService {
    Movie findById(long id);
    List<Movie> findAll();
    Movie findByMovieName(String movieName);
    void edit(Movie movie);
    void save(Movie movie);
    void delete(Movie movie);
}

