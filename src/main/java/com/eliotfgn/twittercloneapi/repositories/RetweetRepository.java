package com.eliotfgn.twittercloneapi.repositories;

import com.eliotfgn.twittercloneapi.domain.models.Retweet;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RetweetRepository extends JpaRepository<Retweet, Long> {
}