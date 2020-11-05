package JavaEEProject.model;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@Table(name="category")
public class Category {

    private Long id;
    private String category;

    private List<Movie> movie;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
    @OneToMany(mappedBy = "category")
    public List<Movie> getMovie() {
        return movie;
    }

    public void setMovie(List<Movie> movie) {
        this.movie = movie;
    }
}
