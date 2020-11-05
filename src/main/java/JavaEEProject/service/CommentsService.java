package JavaEEProject.service;

import JavaEEProject.model.Category;
import JavaEEProject.model.Comments;

import java.util.List;

public interface CommentsService {
    Comments findById(long id);
    List<Comments> findAll();
    void edit(Comments comments);
    void save(Comments comments);
    void delete(Comments comments);
}
