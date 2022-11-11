package com.eliotfgn.twittercloneapi.repositories;

import com.eliotfgn.twittercloneapi.domain.models.Reply;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReplyRepository extends JpaRepository<Reply, Long> {
}