package JavaEEProject.repository;

import JavaEEProject.model.Movie;
import JavaEEProject.model.Rating;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RatingRepository  extends JpaRepository<Rating,Long> {
    Rating findById(long id);
    List<Rating> findAll();
}
