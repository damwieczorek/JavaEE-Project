package JavaEEProject.service;

import JavaEEProject.model.Category;
import JavaEEProject.model.RentHistory;
import JavaEEProject.repository.RentHistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RentHistoryServiceImplementation implements RentHistoryService {
    @Autowired
    private RentHistoryRepository rentHistoryRepository;
    @Override
    public RentHistory findById(long id) {
        return rentHistoryRepository.findById(id);
    }

    @Override
    public List<RentHistory> findAll() {
        return rentHistoryRepository.findAll();
    }

    @Override
    public void edit(RentHistory rentHistory) {
        rentHistoryRepository.save(rentHistory);
    }

    @Override
    public void save(RentHistory rentHistory) {
        rentHistoryRepository.save(rentHistory);
    }

    @Override
    public void delete(RentHistory rentHistory) {
        rentHistoryRepository.delete(rentHistory);
    }
}
