package com.eliotfgn.twittercloneapi.repositories;

import com.eliotfgn.twittercloneapi.domain.models.Feed;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FeedRepository extends JpaRepository<Feed, Long> {
}