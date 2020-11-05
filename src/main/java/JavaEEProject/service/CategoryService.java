package JavaEEProject.service;

import JavaEEProject.model.Category;

import java.util.List;

public interface CategoryService {

    Category findById(long id);
    List<Category> findAll();

    void edit(Category category);
    void save(Category category);
    void delete(Category category);
}
