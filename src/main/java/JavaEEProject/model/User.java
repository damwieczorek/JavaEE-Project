package JavaEEProject.model;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "user")
public class User{
private Long id;
private String username;
private String password;

private String passwordConfirm;

private Set< Role > roles;

private List<Rating> rating;

private Set<Movie> movie;

@Id
@GeneratedValue(strategy = GenerationType.AUTO)
public Long getId() {
        return id;
        }

public void setId(Long id) {
        this.id = id;
        }

public String getUsername() {
        return username;
        }

public void setUsername(String username) {
        this.username = username;
        }

public String getPassword() {
        return password;
        }

public void setPassword(String password) {
        this.password = password;
        }

@Transient
public String getPasswordConfirm() {
        return passwordConfirm;
        }

public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
        }

@ManyToMany
@JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
public Set < Role > getRoles() {
        return roles;
        }

public void setRoles(Set < Role > roles) {
        this.roles = roles;
        }
        @OneToMany(mappedBy = "user")
        public List<Rating> getRating() {
                return rating;
        }

        public void setRating(List<Rating> rating) {
                this.rating = rating;
        }
        @OneToMany(mappedBy = "user")
        public Set<Movie> getMovie() {
                return movie;
        }

        public void setMovie(Set<Movie> movie) {
                this.movie = movie;
        }
}
