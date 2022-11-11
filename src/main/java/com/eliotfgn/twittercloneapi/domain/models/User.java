package com.eliotfgn.twittercloneapi.domain.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Entity(name = "twitter_users")
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class User {
    @Id
    private UUID id;
    private String email;
    private String username;
    private String password;
    private String name;
    private String bio;
    private String profilePic;
    private LocalDate createdAt;
    private LocalDate dateOfBirth;
    private String location;
    private String website;
    private String profileBanner;
    @ManyToMany
    private List<User> following;
    @ManyToMany
    private List<User> followers;
    private Boolean isVerified;
    @OneToMany
    private List<Tweet> tweets;
}
