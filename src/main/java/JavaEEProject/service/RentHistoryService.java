package JavaEEProject.service;

import JavaEEProject.model.Category;
import JavaEEProject.model.RentHistory;

import java.util.List;

public interface RentHistoryService {
    RentHistory findById(long id);
    List<RentHistory> findAll();
    void edit(RentHistory rentHistory);
    void save(RentHistory rentHistory);
    void delete(RentHistory rentHistory);
}
