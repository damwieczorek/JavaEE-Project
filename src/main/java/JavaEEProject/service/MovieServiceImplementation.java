package JavaEEProject.service;

import JavaEEProject.model.Category;
import JavaEEProject.model.Movie;
import JavaEEProject.repository.MovieRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MovieServiceImplementation implements MovieService {
    @Autowired
    private  MovieRepository  movieRepository;

    @Override
    public Movie findById(long id) {
        return movieRepository.findById(id);
    }

    @Override
    public List<Movie> findAll() {
        return movieRepository.findAll();
    }

    @Override
    public Movie findByMovieName(String movieName) {
        return movieRepository.findByMovieName(movieName);
    }

    @Override
    public void edit(Movie movie) {
        movieRepository.save(movie);
    }

    @Override
    public void save(Movie movie) {
        movieRepository.save(movie);
    }

    @Override
    public void delete(Movie movie) {
        movieRepository.delete(movie);
    }
}
