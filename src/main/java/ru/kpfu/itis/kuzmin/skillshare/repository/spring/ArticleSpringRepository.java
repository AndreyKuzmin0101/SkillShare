package ru.kpfu.itis.kuzmin.skillshare.repository.spring;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.kpfu.itis.kuzmin.skillshare.model.ArticleEntity;

import java.util.Optional;

@Repository
public interface ArticleSpringRepository extends JpaRepository<ArticleEntity, Long> {

    Optional<ArticleEntity> findByTitle(String title);
}