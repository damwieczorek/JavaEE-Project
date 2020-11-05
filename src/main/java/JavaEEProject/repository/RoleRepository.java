package JavaEEProject.repository;


import JavaEEProject.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.List;

@Component
public interface RoleRepository extends JpaRepository<Role,Long> {
    HashSet<Role> findByName(String name);


}