package JavaEEProject.repository;

import JavaEEProject.model.Category;
import JavaEEProject.model.Comments;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CommentsRepository extends JpaRepository<Comments,Long> {
    Comments findById(long id);
    List<Comments> findAll();
}
