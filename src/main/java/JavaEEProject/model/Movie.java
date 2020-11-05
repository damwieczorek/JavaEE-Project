package JavaEEProject.model;



import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@Table(name="movie")
public class Movie {

    private Long id;
    private String movieName;
    private String movieDescription;
    private String movieDirector;
    private float movieRentPrice;
    private int movieRealiseDate;
    private String movieOriginCountry;
    private String moviePhoto;
    private String movieTrailer;

    private User user;

    private Category category;

    private List<Rating> rating;

    private List<Comments> comments;

    private List<RentHistory> rentHistory;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getMovieDescription() {
        return movieDescription;
    }

    public void setMovieDescription(String movieDescription) {
        this.movieDescription = movieDescription;
    }

    public String getMovieDirector() {
        return movieDirector;
    }

    public void setMovieDirector(String movieDirector) {
        this.movieDirector = movieDirector;
    }

    public float getMovieRentPrice() {
        return movieRentPrice;
    }

    public void setMovieRentPrice(float movieRentPrice) {
        this.movieRentPrice = movieRentPrice;
    }

    public int getMovieRealiseDate() {
        return movieRealiseDate;
    }

    public void setMovieRealiseDate(int movieRealiseDate) {
        this.movieRealiseDate = movieRealiseDate;
    }

    public String getMovieOriginCountry() {
        return movieOriginCountry;
    }

    public void setMovieOriginCountry(String movieOriginCountry) {
        this.movieOriginCountry = movieOriginCountry;
    }

    public String getMoviePhoto() {
        return moviePhoto;
    }

    public void setMoviePhoto(String moviePhoto) {
        this.moviePhoto = moviePhoto;
    }

    public String getMovieTrailer() {
        return movieTrailer;
    }

    public void setMovieTrailer(String movieTrailer) {
        this.movieTrailer = movieTrailer;
    }
    @ManyToOne
    @JoinColumn(name = "user_id")
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    @ManyToOne
    @JoinColumn(name = "category_id")
    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    @OneToMany(mappedBy = "movie")
    public List<Rating> getRating() {
        return rating;
    }

    public void setRating(List<Rating> rating) {
        this.rating = rating;
    }
    @OneToMany(mappedBy = "movie")
    public List<Comments> getComments() {
        return comments;
    }

    public void setComments(List<Comments> comments) {
        this.comments = comments;
    }
    @OneToMany(mappedBy = "movie")
    public List<RentHistory> getRentHistory() {
        return rentHistory;
    }

    public void setRentHistory(List<RentHistory> rentHistory) {
        this.rentHistory = rentHistory;
    }
}
