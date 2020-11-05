package JavaEEProject.service;

import JavaEEProject.model.Category;
import JavaEEProject.model.Comments;
import JavaEEProject.repository.CommentsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentsServiceImplementation implements CommentsService {
    @Autowired
    private CommentsRepository commentsRepository;
    @Override
    public Comments findById(long id) {
        return commentsRepository.findById(id);
    }

    @Override
    public List<Comments> findAll() {
        return commentsRepository.findAll();
    }

    @Override
    public void edit(Comments comments) {
        commentsRepository.save(comments);
    }

    @Override
    public void save(Comments comments) {
        commentsRepository.save(comments);
    }

    @Override
    public void delete(Comments comments) {
        commentsRepository.delete(comments);
    }
}
