-- liquibase formatted sql

-- changeset eliot:1668176671426-1
CREATE TABLE feed
(
    id      BIGINT NOT NULL,
    user_id UUID,
    CONSTRAINT pk_feed PRIMARY KEY (id)
);

-- changeset eliot:1668176671426-2
CREATE TABLE feed_tweets
(
    feed_id   BIGINT NOT NULL,
    tweets_id BIGINT NOT NULL
);

-- changeset eliot:1668176671426-3
CREATE TABLE reply
(
    id         BIGINT NOT NULL,
    text       VARCHAR(255),
    images     VARCHAR(255),
    author_id  UUID,
    created_at date,
    post_id    BIGINT,
    CONSTRAINT pk_reply PRIMARY KEY (id)
);

-- changeset eliot:1668176671426-4
CREATE TABLE reply_liked_by
(
    reply_id    BIGINT NOT NULL,
    liked_by_id UUID   NOT NULL
);

-- changeset eliot:1668176671426-5
CREATE TABLE reply_mentions
(
    reply_id    BIGINT NOT NULL,
    mentions_id UUID   NOT NULL,
    CONSTRAINT pk_tweet_mentions PRIMARY KEY (reply_id, mentions_id)
);

-- changeset eliot:1668176671426-6
CREATE TABLE reply_replied_by
(
    reply_id      BIGINT NOT NULL,
    replied_by_id UUID   NOT NULL,
    CONSTRAINT pk_tweet_repliedby PRIMARY KEY (reply_id, replied_by_id)
);

-- changeset eliot:1668176671426-7
CREATE TABLE reply_replies
(
    reply_id   BIGINT NOT NULL,
    replies_id BIGINT NOT NULL
);

-- changeset eliot:1668176671426-8
CREATE TABLE reply_reply_to
(
    reply_id    BIGINT NOT NULL,
    reply_to_id UUID   NOT NULL
);

-- changeset eliot:1668176671426-9
CREATE TABLE reply_retweeted_by
(
    reply_id        BIGINT NOT NULL,
    retweeted_by_id UUID   NOT NULL,
    CONSTRAINT pk_tweet_retweetedby PRIMARY KEY (reply_id, retweeted_by_id)
);

-- changeset eliot:1668176671426-10
CREATE TABLE reply_tags
(
    reply_id BIGINT NOT NULL,
    tags_id  BIGINT NOT NULL,
    CONSTRAINT pk_tweet_tags PRIMARY KEY (reply_id, tags_id)
);

-- changeset eliot:1668176671426-11
CREATE TABLE retweet
(
    id                BIGINT NOT NULL,
    text              VARCHAR(255),
    images            VARCHAR(255),
    author_id         UUID,
    created_at        date,
    original_tweet_id BIGINT,
    quote             VARCHAR(255),
    CONSTRAINT pk_retweet PRIMARY KEY (id)
);

-- changeset eliot:1668176671426-12
CREATE TABLE retweet_liked_by
(
    retweet_id  BIGINT NOT NULL,
    liked_by_id UUID   NOT NULL
);

-- changeset eliot:1668176671426-13
CREATE TABLE retweet_mentions
(
    retweet_id  BIGINT NOT NULL,
    mentions_id UUID   NOT NULL,
    CONSTRAINT pk_tweet_mentions PRIMARY KEY (retweet_id, mentions_id)
);

-- changeset eliot:1668176671426-14
CREATE TABLE retweet_replied_by
(
    retweet_id    BIGINT NOT NULL,
    replied_by_id UUID   NOT NULL,
    CONSTRAINT pk_tweet_repliedby PRIMARY KEY (retweet_id, replied_by_id)
);

-- changeset eliot:1668176671426-15
CREATE TABLE retweet_replies
(
    retweet_id BIGINT NOT NULL,
    replies_id BIGINT NOT NULL
);

-- changeset eliot:1668176671426-16
CREATE TABLE retweet_retweeted_by
(
    retweet_id      BIGINT NOT NULL,
    retweeted_by_id UUID   NOT NULL,
    CONSTRAINT pk_tweet_retweetedby PRIMARY KEY (retweet_id, retweeted_by_id)
);

-- changeset eliot:1668176671426-17
CREATE TABLE retweet_tags
(
    retweet_id BIGINT NOT NULL,
    tags_id    BIGINT NOT NULL,
    CONSTRAINT pk_tweet_tags PRIMARY KEY (retweet_id, tags_id)
);

-- changeset eliot:1668176671426-18
CREATE TABLE tag
(
    id    BIGINT NOT NULL,
    label VARCHAR(255),
    CONSTRAINT pk_tag PRIMARY KEY (id)
);

-- changeset eliot:1668176671426-19
CREATE TABLE tag_tweets
(
    tag_id    BIGINT NOT NULL,
    tweets_id BIGINT NOT NULL
);

-- changeset eliot:1668176671426-20
CREATE TABLE tweet
(
    id         BIGINT NOT NULL,
    text       VARCHAR(255),
    images     VARCHAR(255),
    author_id  UUID,
    created_at date,
    CONSTRAINT pk_tweet PRIMARY KEY (id)
);

-- changeset eliot:1668176671426-21
CREATE TABLE tweet_liked_by
(
    tweet_id    BIGINT NOT NULL,
    liked_by_id UUID   NOT NULL
);

-- changeset eliot:1668176671426-22
CREATE TABLE tweet_mentions
(
    tweet_id    BIGINT NOT NULL,
    mentions_id UUID   NOT NULL,
    CONSTRAINT pk_tweet_mentions PRIMARY KEY (tweet_id, mentions_id)
);

-- changeset eliot:1668176671426-23
CREATE TABLE tweet_replied_by
(
    tweet_id      BIGINT NOT NULL,
    replied_by_id UUID   NOT NULL,
    CONSTRAINT pk_tweet_repliedby PRIMARY KEY (tweet_id, replied_by_id)
);

-- changeset eliot:1668176671426-24
CREATE TABLE tweet_replies
(
    tweet_id   BIGINT NOT NULL,
    replies_id BIGINT NOT NULL
);

-- changeset eliot:1668176671426-25
CREATE TABLE tweet_retweeted_by
(
    tweet_id        BIGINT NOT NULL,
    retweeted_by_id UUID   NOT NULL,
    CONSTRAINT pk_tweet_retweetedby PRIMARY KEY (tweet_id, retweeted_by_id)
);

-- changeset eliot:1668176671426-26
CREATE TABLE tweet_tags
(
    tweet_id BIGINT NOT NULL,
    tags_id  BIGINT NOT NULL,
    CONSTRAINT pk_tweet_tags PRIMARY KEY (tweet_id, tags_id)
);

-- changeset eliot:1668176671426-27
CREATE TABLE twitter_users
(
    id             UUID NOT NULL,
    email          VARCHAR(255),
    username       VARCHAR(255),
    password       VARCHAR(255),
    name           VARCHAR(255),
    bio            VARCHAR(255),
    profile_pic    VARCHAR(255),
    created_at     date,
    date_of_birth  date,
    location       VARCHAR(255),
    website        VARCHAR(255),
    profile_banner VARCHAR(255),
    is_verified    BOOLEAN,
    CONSTRAINT pk_twitter_users PRIMARY KEY (id)
);

-- changeset eliot:1668176671426-28
CREATE TABLE twitter_users_followers
(
    followers_id     UUID NOT NULL,
    twitter_users_id UUID NOT NULL
);

-- changeset eliot:1668176671426-29
CREATE TABLE twitter_users_following
(
    following_id     UUID NOT NULL,
    twitter_users_id UUID NOT NULL
);

-- changeset eliot:1668176671426-30
CREATE TABLE twitter_users_tweets
(
    tweets_id        BIGINT NOT NULL,
    twitter_users_id UUID   NOT NULL
);

-- changeset eliot:1668176671426-31
ALTER TABLE feed_tweets
    ADD CONSTRAINT uc_feed_tweets_tweets UNIQUE (tweets_id);

-- changeset eliot:1668176671426-32
ALTER TABLE reply_liked_by
    ADD CONSTRAINT uc_reply_liked_by_likedby UNIQUE (liked_by_id);

-- changeset eliot:1668176671426-33
ALTER TABLE reply_mentions
    ADD CONSTRAINT uc_reply_mentions_mentions UNIQUE (mentions_id);

-- changeset eliot:1668176671426-34
ALTER TABLE reply_replied_by
    ADD CONSTRAINT uc_reply_replied_by_repliedby UNIQUE (replied_by_id);

-- changeset eliot:1668176671426-35
ALTER TABLE reply_replies
    ADD CONSTRAINT uc_reply_replies_replies UNIQUE (replies_id);

-- changeset eliot:1668176671426-36
ALTER TABLE reply_reply_to
    ADD CONSTRAINT uc_reply_reply_to_replyto UNIQUE (reply_to_id);

-- changeset eliot:1668176671426-37
ALTER TABLE reply_retweeted_by
    ADD CONSTRAINT uc_reply_retweeted_by_retweetedby UNIQUE (retweeted_by_id);

-- changeset eliot:1668176671426-38
ALTER TABLE reply_tags
    ADD CONSTRAINT uc_reply_tags_tags UNIQUE (tags_id);

-- changeset eliot:1668176671426-39
ALTER TABLE retweet_liked_by
    ADD CONSTRAINT uc_retweet_liked_by_likedby UNIQUE (liked_by_id);

-- changeset eliot:1668176671426-40
ALTER TABLE retweet_mentions
    ADD CONSTRAINT uc_retweet_mentions_mentions UNIQUE (mentions_id);

-- changeset eliot:1668176671426-41
ALTER TABLE retweet_replied_by
    ADD CONSTRAINT uc_retweet_replied_by_repliedby UNIQUE (replied_by_id);

-- changeset eliot:1668176671426-42
ALTER TABLE retweet_replies
    ADD CONSTRAINT uc_retweet_replies_replies UNIQUE (replies_id);

-- changeset eliot:1668176671426-43
ALTER TABLE retweet_retweeted_by
    ADD CONSTRAINT uc_retweet_retweeted_by_retweetedby UNIQUE (retweeted_by_id);

-- changeset eliot:1668176671426-44
ALTER TABLE retweet_tags
    ADD CONSTRAINT uc_retweet_tags_tags UNIQUE (tags_id);

-- changeset eliot:1668176671426-45
ALTER TABLE tag_tweets
    ADD CONSTRAINT uc_tag_tweets_tweets UNIQUE (tweets_id);

-- changeset eliot:1668176671426-46
ALTER TABLE tweet_liked_by
    ADD CONSTRAINT uc_tweet_liked_by_likedby UNIQUE (liked_by_id);

-- changeset eliot:1668176671426-47
ALTER TABLE tweet_mentions
    ADD CONSTRAINT uc_tweet_mentions_mentions UNIQUE (mentions_id);

-- changeset eliot:1668176671426-48
ALTER TABLE tweet_replied_by
    ADD CONSTRAINT uc_tweet_replied_by_repliedby UNIQUE (replied_by_id);

-- changeset eliot:1668176671426-49
ALTER TABLE tweet_replies
    ADD CONSTRAINT uc_tweet_replies_replies UNIQUE (replies_id);

-- changeset eliot:1668176671426-50
ALTER TABLE tweet_retweeted_by
    ADD CONSTRAINT uc_tweet_retweeted_by_retweetedby UNIQUE (retweeted_by_id);

-- changeset eliot:1668176671426-51
ALTER TABLE tweet_tags
    ADD CONSTRAINT uc_tweet_tags_tags UNIQUE (tags_id);

-- changeset eliot:1668176671426-52
ALTER TABLE twitter_users_tweets
    ADD CONSTRAINT uc_twitter_users_tweets_tweets UNIQUE (tweets_id);

-- changeset eliot:1668176671426-53
ALTER TABLE feed
    ADD CONSTRAINT FK_FEED_ON_USER FOREIGN KEY (user_id) REFERENCES twitter_users (id);

-- changeset eliot:1668176671426-54
ALTER TABLE reply
    ADD CONSTRAINT FK_REPLY_ON_AUTHOR FOREIGN KEY (author_id) REFERENCES twitter_users (id);

-- changeset eliot:1668176671426-55
ALTER TABLE retweet
    ADD CONSTRAINT FK_RETWEET_ON_AUTHOR FOREIGN KEY (author_id) REFERENCES twitter_users (id);

-- changeset eliot:1668176671426-56
ALTER TABLE tweet
    ADD CONSTRAINT FK_TWEET_ON_AUTHOR FOREIGN KEY (author_id) REFERENCES twitter_users (id);

-- changeset eliot:1668176671426-57
ALTER TABLE feed_tweets
    ADD CONSTRAINT fk_feetwe_on_feed FOREIGN KEY (feed_id) REFERENCES feed (id);

-- changeset eliot:1668176671426-58
ALTER TABLE feed_tweets
    ADD CONSTRAINT fk_feetwe_on_tweet FOREIGN KEY (tweets_id) REFERENCES tweet (id);

-- changeset eliot:1668176671426-59
ALTER TABLE reply_liked_by
    ADD CONSTRAINT fk_replikby_on_reply FOREIGN KEY (reply_id) REFERENCES reply (id);

-- changeset eliot:1668176671426-60
ALTER TABLE reply_liked_by
    ADD CONSTRAINT fk_replikby_on_user FOREIGN KEY (liked_by_id) REFERENCES twitter_users (id);

-- changeset eliot:1668176671426-61
ALTER TABLE reply_mentions
    ADD CONSTRAINT fk_repmen_on_reply FOREIGN KEY (reply_id) REFERENCES reply (id);

-- changeset eliot:1668176671426-62
ALTER TABLE reply_mentions
    ADD CONSTRAINT fk_repmen_on_user FOREIGN KEY (mentions_id) REFERENCES twitter_users (id);

-- changeset eliot:1668176671426-63
ALTER TABLE reply_replies
    ADD CONSTRAINT fk_reprep_on_replies FOREIGN KEY (replies_id) REFERENCES reply (id);

-- changeset eliot:1668176671426-64
ALTER TABLE reply_replies
    ADD CONSTRAINT fk_reprep_on_reply FOREIGN KEY (reply_id) REFERENCES reply (id);

-- changeset eliot:1668176671426-65
ALTER TABLE reply_replied_by
    ADD CONSTRAINT fk_reprepby_on_reply FOREIGN KEY (reply_id) REFERENCES reply (id);

-- changeset eliot:1668176671426-66
ALTER TABLE reply_replied_by
    ADD CONSTRAINT fk_reprepby_on_user FOREIGN KEY (replied_by_id) REFERENCES twitter_users (id);

-- changeset eliot:1668176671426-67
ALTER TABLE reply_reply_to
    ADD CONSTRAINT fk_reprepto_on_reply FOREIGN KEY (reply_id) REFERENCES reply (id);

-- changeset eliot:1668176671426-68
ALTER TABLE reply_reply_to
    ADD CONSTRAINT fk_reprepto_on_user FOREIGN KEY (reply_to_id) REFERENCES twitter_users (id);

-- changeset eliot:1668176671426-69
ALTER TABLE reply_retweeted_by
    ADD CONSTRAINT fk_repretby_on_reply FOREIGN KEY (reply_id) REFERENCES reply (id);

-- changeset eliot:1668176671426-70
ALTER TABLE reply_retweeted_by
    ADD CONSTRAINT fk_repretby_on_user FOREIGN KEY (retweeted_by_id) REFERENCES twitter_users (id);

-- changeset eliot:1668176671426-71
ALTER TABLE reply_tags
    ADD CONSTRAINT fk_reptag_on_reply FOREIGN KEY (reply_id) REFERENCES reply (id);

-- changeset eliot:1668176671426-72
ALTER TABLE reply_tags
    ADD CONSTRAINT fk_reptag_on_tag FOREIGN KEY (tags_id) REFERENCES tag (id);

-- changeset eliot:1668176671426-73
ALTER TABLE retweet_liked_by
    ADD CONSTRAINT fk_retlikby_on_retweet FOREIGN KEY (retweet_id) REFERENCES retweet (id);

-- changeset eliot:1668176671426-74
ALTER TABLE retweet_liked_by
    ADD CONSTRAINT fk_retlikby_on_user FOREIGN KEY (liked_by_id) REFERENCES twitter_users (id);

-- changeset eliot:1668176671426-75
ALTER TABLE retweet_mentions
    ADD CONSTRAINT fk_retmen_on_retweet FOREIGN KEY (retweet_id) REFERENCES retweet (id);

-- changeset eliot:1668176671426-76
ALTER TABLE retweet_mentions
    ADD CONSTRAINT fk_retmen_on_user FOREIGN KEY (mentions_id) REFERENCES twitter_users (id);

-- changeset eliot:1668176671426-77
ALTER TABLE retweet_replies
    ADD CONSTRAINT fk_retrep_on_reply FOREIGN KEY (replies_id) REFERENCES reply (id);

-- changeset eliot:1668176671426-78
ALTER TABLE retweet_replies
    ADD CONSTRAINT fk_retrep_on_retweet FOREIGN KEY (retweet_id) REFERENCES retweet (id);

-- changeset eliot:1668176671426-79
ALTER TABLE retweet_replied_by
    ADD CONSTRAINT fk_retrepby_on_retweet FOREIGN KEY (retweet_id) REFERENCES retweet (id);

-- changeset eliot:1668176671426-80
ALTER TABLE retweet_replied_by
    ADD CONSTRAINT fk_retrepby_on_user FOREIGN KEY (replied_by_id) REFERENCES twitter_users (id);

-- changeset eliot:1668176671426-81
ALTER TABLE retweet_retweeted_by
    ADD CONSTRAINT fk_retretby_on_retweet FOREIGN KEY (retweet_id) REFERENCES retweet (id);

-- changeset eliot:1668176671426-82
ALTER TABLE retweet_retweeted_by
    ADD CONSTRAINT fk_retretby_on_user FOREIGN KEY (retweeted_by_id) REFERENCES twitter_users (id);

-- changeset eliot:1668176671426-83
ALTER TABLE retweet_tags
    ADD CONSTRAINT fk_rettag_on_retweet FOREIGN KEY (retweet_id) REFERENCES retweet (id);

-- changeset eliot:1668176671426-84
ALTER TABLE retweet_tags
    ADD CONSTRAINT fk_rettag_on_tag FOREIGN KEY (tags_id) REFERENCES tag (id);

-- changeset eliot:1668176671426-85
ALTER TABLE tag_tweets
    ADD CONSTRAINT fk_tagtwe_on_tag FOREIGN KEY (tag_id) REFERENCES tag (id);

-- changeset eliot:1668176671426-86
ALTER TABLE tag_tweets
    ADD CONSTRAINT fk_tagtwe_on_tweet FOREIGN KEY (tweets_id) REFERENCES tweet (id);

-- changeset eliot:1668176671426-87
ALTER TABLE tweet_liked_by
    ADD CONSTRAINT fk_twelikby_on_tweet FOREIGN KEY (tweet_id) REFERENCES tweet (id);

-- changeset eliot:1668176671426-88
ALTER TABLE tweet_liked_by
    ADD CONSTRAINT fk_twelikby_on_user FOREIGN KEY (liked_by_id) REFERENCES twitter_users (id);

-- changeset eliot:1668176671426-89
ALTER TABLE tweet_mentions
    ADD CONSTRAINT fk_twemen_on_tweet FOREIGN KEY (tweet_id) REFERENCES tweet (id);

-- changeset eliot:1668176671426-90
ALTER TABLE tweet_mentions
    ADD CONSTRAINT fk_twemen_on_user FOREIGN KEY (mentions_id) REFERENCES twitter_users (id);

-- changeset eliot:1668176671426-91
ALTER TABLE tweet_replies
    ADD CONSTRAINT fk_twerep_on_reply FOREIGN KEY (replies_id) REFERENCES reply (id);

-- changeset eliot:1668176671426-92
ALTER TABLE tweet_replies
    ADD CONSTRAINT fk_twerep_on_tweet FOREIGN KEY (tweet_id) REFERENCES tweet (id);

-- changeset eliot:1668176671426-93
ALTER TABLE tweet_replied_by
    ADD CONSTRAINT fk_twerepby_on_tweet FOREIGN KEY (tweet_id) REFERENCES tweet (id);

-- changeset eliot:1668176671426-94
ALTER TABLE tweet_replied_by
    ADD CONSTRAINT fk_twerepby_on_user FOREIGN KEY (replied_by_id) REFERENCES twitter_users (id);

-- changeset eliot:1668176671426-95
ALTER TABLE tweet_retweeted_by
    ADD CONSTRAINT fk_tweretby_on_tweet FOREIGN KEY (tweet_id) REFERENCES tweet (id);

-- changeset eliot:1668176671426-96
ALTER TABLE tweet_retweeted_by
    ADD CONSTRAINT fk_tweretby_on_user FOREIGN KEY (retweeted_by_id) REFERENCES twitter_users (id);

-- changeset eliot:1668176671426-97
ALTER TABLE tweet_tags
    ADD CONSTRAINT fk_twetag_on_tag FOREIGN KEY (tags_id) REFERENCES tag (id);

-- changeset eliot:1668176671426-98
ALTER TABLE tweet_tags
    ADD CONSTRAINT fk_twetag_on_tweet FOREIGN KEY (tweet_id) REFERENCES tweet (id);

-- changeset eliot:1668176671426-99
ALTER TABLE twitter_users_followers
    ADD CONSTRAINT fk_twiusefol_on_followers FOREIGN KEY (followers_id) REFERENCES twitter_users (id);

-- changeset eliot:1668176671426-100
ALTER TABLE twitter_users_following
    ADD CONSTRAINT fk_twiusefol_on_following FOREIGN KEY (following_id) REFERENCES twitter_users (id);

-- changeset eliot:1668176671426-101
ALTER TABLE twitter_users_followers
    ADD CONSTRAINT fk_twiusefol_on_twitter_users FOREIGN KEY (twitter_users_id) REFERENCES twitter_users (id);

-- changeset eliot:1668176671426-102
ALTER TABLE twitter_users_following
    ADD CONSTRAINT "fk_twiusefol_on_twitter_userssldtqQ" FOREIGN KEY (twitter_users_id) REFERENCES twitter_users (id);

-- changeset eliot:1668176671426-103
ALTER TABLE twitter_users_tweets
    ADD CONSTRAINT fk_twiusetwe_on_tweet FOREIGN KEY (tweets_id) REFERENCES tweet (id);

-- changeset eliot:1668176671426-104
ALTER TABLE twitter_users_tweets
    ADD CONSTRAINT fk_twiusetwe_on_user FOREIGN KEY (twitter_users_id) REFERENCES twitter_users (id);

