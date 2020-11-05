package JavaEEProject.repository;

import JavaEEProject.model.Category;
import JavaEEProject.model.Rating;
import JavaEEProject.model.RentHistory;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RentHistoryRepository extends JpaRepository<RentHistory,Long> {
    RentHistory findById(long id);
    List<RentHistory> findAll();
}
