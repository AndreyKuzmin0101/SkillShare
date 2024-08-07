package ru.kpfu.itis.skillshare.mainservice.model;

import jakarta.persistence.*;
import lombok.*;

import java.sql.Date;
import java.util.List;

@Table(name = "articles")
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class ArticleEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(length = 128)
    private String title;
    private String content;
    private String cover;
    private String description;
    @Column(name = "publication_date")
    private Date publicationDate;
    @Column(name = "moderation_status")
    private String moderationStatus;
    private Long views;
    @Transient
    private Long rating;

    @ManyToOne
    private UserEntity author;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "article_tag",
            joinColumns = @JoinColumn(name = "article_id"),
            inverseJoinColumns = @JoinColumn(name = "tag_id"))
    private List<TagEntity> tags;
}
