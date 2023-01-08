package com.eliotfgn.twittercloneapi.domain.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;
import java.util.Set;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Tweet{
    @Id
    private Long id;
    private String text;
    private String images;
    @ManyToOne
    private User author;
    private LocalDate createdAt;
    @OneToMany
    private Set<Tag> tags;
    @OneToMany
    private Set<User> mentions;
    @OneToMany
    private List<Reply> replies;
    @OneToMany
    private List<User> likedBy;
    @OneToMany
    private Set<User> repliedBy;
    @OneToMany
    private Set<User> retweetedBy;
}
