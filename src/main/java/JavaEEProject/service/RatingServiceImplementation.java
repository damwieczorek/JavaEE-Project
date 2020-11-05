package JavaEEProject.service;

import JavaEEProject.model.Category;
import JavaEEProject.model.Rating;
import JavaEEProject.repository.RatingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RatingServiceImplementation implements RatingService {
    @Autowired
    private RatingRepository ratingRepository;
    @Override
    public Rating findById(long id) {
        return ratingRepository.findById(id);
    }

    @Override
    public List<Rating> findAll() {
        return ratingRepository.findAll();
    }

    @Override
    public void edit(Rating rating) {
        ratingRepository.save(rating);
    }

    @Override
    public void save(Rating rating) {
        ratingRepository.save(rating);
    }

    @Override
    public void delete(Rating rating) {
        ratingRepository.delete(rating);
    }
}
