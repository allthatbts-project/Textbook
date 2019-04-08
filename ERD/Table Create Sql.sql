CREATE TABLE `tb_auth` (
  `USER_NO` varchar(8) NOT NULL COMMENT '회원번호',
  `ACCESS_TOKEN` varchar(500) NOT NULL COMMENT '엑세스 토큰',
  `REFRESH_TOKEN` varchar(500) NOT NULL COMMENT '리프레시 토큰',
  `SCOPE` varchar(500) DEFAULT NULL COMMENT '권한범위',
  `ACCESS_EXPIRE_DT` datetime DEFAULT NULL COMMENT '액세스 토큰 만료일',
  `REFRESH_EXPIRE_DT` datetime NOT NULL COMMENT '리프레시 토큰 만료일',
  `CREATE_DT` datetime NOT NULL COMMENT '생성일',
  `UPDATE_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`USER_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='인증 테이블';


CREATE TABLE `tb_board` (
  `SEQ` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '순번',
  `BOARD_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '게시판ID',
  `CATEGORY_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '카테고리ID',
  `SUBJECT` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '제목',
  `CONTENTS` varchar(4000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '내용',
  `READ_CNT` int(11) NOT NULL COMMENT '조회수',
  `RECOMMEND_CNT` int(11) NOT NULL COMMENT '추천수',
  `COMMENTS_CNT` int(11) NOT NULL COMMENT '댓글수',
  `IMAGE_EXIST_YN` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '이미지 여부',
  `NICKNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '닉네임',
  `SECRET` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '비밀번호',
  `DELETED_YN` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '삭제여부',
  `DELETED_DT` datetime DEFAULT NULL COMMENT '삭제일자',
  `CREATE_USER` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '생성자',
  `CREATE_DT` datetime NOT NULL COMMENT '생성일',
  `UPDATE_USER` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPDATE_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='게시물 테이블';

CREATE TABLE `tb_board_category` (
  `SEQ` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '순번',
  `BOARD_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '게시판ID',
  `CATEGORY_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '카테고리ID',
  `CATEGORY_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '카테고리명',
  `CREATE_USER` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '생성자',
  `CREATE_DT` datetime NOT NULL COMMENT '생성일',
  `UPDATE_USER` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPDATE_DT` datetime DEFAULT NULL COMMENT '수정일'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='게시판 카테고리 테이블';

CREATE TABLE `tb_board_image` (
  `SEQ` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '순번',
  `BOARD_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '게시판ID',
  `BOARD_SEQ` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '게시물 순번',
  `FILE_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '저장 경로',
  `FILE_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '파일명',
  `FILE_EXT` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '확장자',
  `FILE_SIZE` int(11) NOT NULL COMMENT '파일용량',
  `FILE_URL` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'URL',
  `CREATE_USER` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '생성자',
  `CREATE_DT` datetime NOT NULL COMMENT '생성일',
  `UPDATE_USER` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPDATE_DATETIME` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='이미지 테이블';

CREATE TABLE `tb_code` (
  `SEQ` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '순번',
  `CLASS_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '클래스명',
  `TABLE_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '테이블명',
  `COL_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '컬럼명',
  `CODE` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '코드',
  `CODE_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '코드명',
  `CREATE_USER` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '생성자',
  `CREATE_DT` datetime NOT NULL COMMENT '생성일',
  `UPDATE_USER` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPDATE_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='코드 테이블';

CREATE TABLE `tb_comment` (
  `SEQ` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '순번',
  `BOARD_SEQ` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '게시물 순번',
  `PARENT_COMMENT_SEQ` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '부모 댓글 순번',
  `DEPTH` int(11) NOT NULL COMMENT '댓글 깊이',
  `COMMENTS` varchar(4000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '댓글 내용',
  `RECOMMEND_CNT` int(11) NOT NULL COMMENT '추천수',
  `COMMENTS_CNT` int(11) NOT NULL COMMENT '댓글수',
  `DELETED_YN` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '삭제유무',
  `DELETED_DT` datetime DEFAULT NULL COMMENT '삭제일자',
  `CREATE_USER` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '생성자',
  `CREATE_DT` datetime NOT NULL COMMENT '생성일',
  `UPDATE_USER` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPDATE_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='댓글 테이블';

CREATE TABLE `tb_instagram_data` (
  `ID` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `INSTAGRAM_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `USER_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `IMAGE_URL` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DELETED_YN` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `DELETED_DT` datetime DEFAULT NULL,
  `CREATE_DT` datetime NOT NULL,
  `UPDATE_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='인스타그램 데이터 테이블';

CREATE TABLE `tb_log` (
  `SEQ` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `APP` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `LOG_TIME` datetime DEFAULT NULL,
  `LOG_LEVEL` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `MESSAGE` varchar(4000) CHARACTER SET utf8 DEFAULT NULL,
  `EXCEPTION` varchar(4000) CHARACTER SET utf8 DEFAULT NULL,
  `LOGGER` varchar(4000) CHARACTER SET utf8 DEFAULT NULL,
  `CALLSITE` varchar(4000) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=668 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='로그 테이블';

CREATE TABLE `tb_media` (
  `SEQ` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SUBJECT` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MEDIA_TYPE` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `LINK_URL` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `THUMBNAIL_URL` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MEDIA_CREATE_DT` datetime DEFAULT NULL,
  `RECOMMEND_CNT` int(11) DEFAULT NULL,
  `VIEW_CNT` int(11) DEFAULT NULL,
  `CREATE_USER` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `CREATE_DT` datetime NOT NULL,
  `UPDATE_USER` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `UPDATE_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='미디어 테이블';

CREATE TABLE `tb_recommend` (
  `SEQ` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '순번',
  `BOARD_SEQ` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '게시물 순번',
  `COMMENT_SEQ` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '댓글 순번',
  `RECOMMEND_TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '추천 종류',
  `CREATE_USER` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '생성자',
  `CREATE_DT` datetime NOT NULL COMMENT '생성일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='추천 테이블';

CREATE TABLE `tb_tag` (
  `SEQ` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '순번',
  `BOARD_SEQ` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '게시물 순번',
  `TAG` varchar(4000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '태그',
  `CREATE_USER` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '생성자',
  `CREATE_DT` datetime NOT NULL COMMENT '생성일',
  `UPDATE_USER` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPDATE_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='태그 테이블';

CREATE TABLE `tb_twitter_data` (
  `id` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TWITTER_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCOUNT_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `TWEET_TEXT` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HASHTAGS` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `RETWEET_CNT` int(11) DEFAULT NULL,
  `URL` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DELETED_YN` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `DELETED_DT` datetime DEFAULT NULL,
  `CREATE_DT` datetime NOT NULL,
  `UPDATE_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='트위터 데이터 테이블';

CREATE TABLE `tb_user` (
  `USER_NO` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '회원번호',
  `NICKNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '닉네임',
  `EMAIL` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '이메일',
  `SECRET` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '비밀번호',
  `CREATE_DT` datetime NOT NULL COMMENT '생성일',
  `UPDATE_DT` datetime DEFAULT NULL COMMENT '수정일',
  `AUTH_TYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '인증방식',
  `CONFIRM_YN` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '인증여부',
  PRIMARY KEY (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='회원 테이블';

CREATE TABLE `tb_user_authority` (
  `SEQ` int(11) NOT NULL COMMENT '순번',
  `USER_NO` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '회원번호',
  `USER_GRADE` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '회원등급',
  `CREATE_USER` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '생성자',
  `CREATE_DT` datetime NOT NULL COMMENT '생성일',
  `UPDATE_USER` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPDATE_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`,`USER_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='회원 권한 테이블';

CREATE TABLE `tb_youtube_data` (
  `ID` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `YOUTUBE_ID` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `CHANNEL_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `THUMBNAIL_IMG_URL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VIEW_CNT` bigint(20) DEFAULT NULL,
  `LIKE_CNT` bigint(20) DEFAULT NULL,
  `DISLIKE_CNT` bigint(20) DEFAULT NULL,
  `COMMENT_CNT` bigint(20) DEFAULT NULL,
  `PUBLISH_DT` datetime DEFAULT NULL,
  `URL` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DELETED_YN` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `DELETED_DT` datetime DEFAULT NULL,
  `CREATE_DT` datetime NOT NULL,
  `UPDATE_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='유튜브 데이터 테이블';
