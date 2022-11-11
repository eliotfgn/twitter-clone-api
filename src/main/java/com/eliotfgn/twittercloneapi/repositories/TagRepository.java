package com.eliotfgn.twittercloneapi.repositories;

import com.eliotfgn.twittercloneapi.domain.models.Tag;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TagRepository extends JpaRepository<Tag, Long> {
}