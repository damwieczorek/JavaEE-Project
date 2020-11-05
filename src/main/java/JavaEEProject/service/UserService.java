package JavaEEProject.service;

import JavaEEProject.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
