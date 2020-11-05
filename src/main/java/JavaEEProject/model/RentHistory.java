package JavaEEProject.model;


import javax.persistence.*;

@Entity
@Table(name="RentHistory")
public class RentHistory {

    private Long id;
    private String rentDate;
    private String rentDateReturn;
    private int rentTime;

    private Movie movie;

    private User user;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRentDate() {
        return rentDate;
    }

    public String getRentDateReturn() {
        return rentDateReturn;
    }

    public void setRentDateReturn(String rentDateReturn) {
        this.rentDateReturn = rentDateReturn;
    }

    public void setRentDate(String rentDate) {
        this.rentDate = rentDate;
    }

    public int getRentTime() {
        return rentTime;
    }

    public void setRentTime(int rentTime) {
        this.rentTime = rentTime;
    }
    @ManyToOne
    @JoinColumn(name = "movie_id")
    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }
    @ManyToOne
    @JoinColumn(name = "user_id")
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
