package JavaEEProject.service;

import JavaEEProject.model.Category;
import JavaEEProject.model.Rating;

import java.util.List;

public interface RatingService {
    Rating findById(long id);
    List<Rating> findAll();
    void edit(Rating rating);
    void save(Rating rating);
    void delete(Rating rating);
}
