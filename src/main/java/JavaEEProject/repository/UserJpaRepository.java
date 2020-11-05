package JavaEEProject.repository;

import JavaEEProject.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface UserJpaRepository extends JpaRepository<User,Long> {
    User findByUsername(String username);


}
