package com.eliotfgn.twittercloneapi.repositories;

import com.eliotfgn.twittercloneapi.domain.models.Tweet;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TweetRepository extends JpaRepository<Tweet, Long> {
}