package com.eliotfgn.twittercloneapi.domain.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Reply extends Tweet{
    @ManyToOne
    private Tweet post;
    @OneToMany
    private List<User> replyTo;
}
