package ru.kpfu.itis.skillshare.mainservice.repository.spring;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.kpfu.itis.skillshare.mainservice.model.RoleEntity;

import java.util.Optional;

@Repository
public interface RoleSpringRepository extends JpaRepository<RoleEntity, Integer> {

    Optional<RoleEntity> findByName(String name);
}
