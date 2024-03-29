-- 회원 상태 테이블
DROP TABLE "MEMBER_STATUS";

CREATE TABLE "MEMBER_STATUS" (
	"STATUS_CD"	NUMBER	 PRIMARY KEY,
	"STATUS_NM"	VARCHAR2(20)		NOT NULL
);
COMMENT ON COLUMN "MEMBER_STATUS"."STATUS_CD" IS '회원 상태 코드';
COMMENT ON COLUMN "MEMBER_STATUS"."STATUS_NM" IS '회원 상태 이름';


-- 회원 등급 테이블
DROP TABLE "MEMBER_GRADE";

CREATE TABLE "MEMBER_GRADE" (
	"GRADE_CD"	NUMBER		PRIMARY KEY,
	"GRADE_NM"	VARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "MEMBER_GRADE"."GRADE_CD" IS '회원 등급 코드';
COMMENT ON COLUMN "MEMBER_GRADE"."GRADE_NM" IS '회원 등급 이름';


-- 회원 테이블
DROP TABLE "MEMBER";

CREATE TABLE "MEMBER" (
	"MEMBER_NO"	NUMBER		PRIMARY KEY,
	"MEMBER_ID"	VARCHAR2(20)		NOT NULL,
	"MEMBER_PW"	VARCHAR2(20)		NOT NULL,
	"MEMBER_NM"	VARCHAR2(15)		NOT NULL,
	"MEMBER_PHONE"	VARCHAR2(13)		NOT NULL,
	"MEMBER_EMAIL"	VARCHAR2(50)		NOT NULL,
	"MEMBER_ADDR"	VARCHAR2(200)		NULL,
	"ENROLL_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS_CD"	NUMBER	REFERENCES MEMBER_STATUS,
	"GRADE_CD"	NUMBER	REFERENCES MEMBER_GRADE
);

COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원 번호';
COMMENT ON COLUMN "MEMBER"."MEMBER_ID" IS '회원 아이디';
COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '회원 비밀번호';
COMMENT ON COLUMN "MEMBER"."MEMBER_NM" IS '회원 이름';
COMMENT ON COLUMN "MEMBER"."MEMBER_PHONE" IS '회원 휴대폰 번호';
COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL" IS '회원 이메일';
COMMENT ON COLUMN "MEMBER"."MEMBER_ADDR" IS '회원 주소';
COMMENT ON COLUMN "MEMBER"."ENROLL_DT" IS '회원 가입일';
COMMENT ON COLUMN "MEMBER"."STATUS_CD" IS '회원 상태 코드';
COMMENT ON COLUMN "MEMBER"."GRADE_CD" IS '회원 등급 코드';


-- 게시글 상태 테이블
DROP TABLE "BOARD_STATUS";

CREATE TABLE "BOARD_STATUS" (
	"BOARD_STATUS_CD"	NUMBER	    PRIMARY KEY,
	"BOARD_STATUS_NM"	VARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "BOARD_STATUS"."BOARD_STATUS_CD" IS '게시글 상태 코드';
COMMENT ON COLUMN "BOARD_STATUS"."BOARD_STATUS_NM" IS '게시글 상태 이름';



-- 카테고리 테이블
DROP TABLE "CATEGORY";

CREATE TABLE "CATEGORY" (
	"CATEGORY_CD"	NUMBER		PRIMARY KEY,
	"CATEGORY_NM"	VARCHAR2(50)		NOT NULL
);

COMMENT ON COLUMN "CATEGORY"."CATEGORY_CD" IS '카테고리 코드';
COMMENT ON COLUMN "CATEGORY"."CATEGORY_NM" IS '카테고리 이름';



-- 게시판 테이블
DROP TABLE "BOARD";

CREATE TABLE "BOARD" (
	"BOARD_NO"	NUMBER		PRIMARY KEY,
	"BOARD_TITLE"	VARCHAR2(200)		NOT NULL,
	"BOARD_CONTENT"	CLOB		NOT NULL,
	"CREATE_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"MODIFY_DT"	DATE		NULL,
	"READ_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"MEMBER_NO"	NUMBER		REFERENCES MEMBER,
	"BOARD_STATUS_CD"	NUMBER		REFERENCES BOARD_STATUS,
	"CATEGORY_CD"	NUMBER		REFERENCES CATEGORY
);

COMMENT ON COLUMN "BOARD"."BOARD_NO" IS '게시글 번호';
COMMENT ON COLUMN "BOARD"."BOARD_TITLE" IS '게시글 제목';
COMMENT ON COLUMN "BOARD"."BOARD_CONTENT" IS '게시글 내용';
COMMENT ON COLUMN "BOARD"."CREATE_DT" IS '작성일';
COMMENT ON COLUMN "BOARD"."MODIFY_DT" IS '마지막 수정일';
COMMENT ON COLUMN "BOARD"."READ_COUNT" IS '조회수';
COMMENT ON COLUMN "BOARD"."MEMBER_NO" IS '회원 번호';
COMMENT ON COLUMN "BOARD"."BOARD_STATUS_CD" IS '게시글 상태 코드';
COMMENT ON COLUMN "BOARD"."CATEGORY_CD" IS '카테고리 코드';


-- 댓글 상태 테이블
DROP TABLE "REPLY_STATUS";

CREATE TABLE "REPLY_STATUS" (
	"REPLY_STATUS_CD"	NUMBER		PRIMARY KEY,
	"REPLY_STATUS_NM"	VARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "REPLY_STATUS"."REPLY_STATUS_CD" IS '댓글 상태 코드';
COMMENT ON COLUMN "REPLY_STATUS"."REPLY_STATUS_NM" IS '댓글 상태 이름';



-- 댓글 테이블
DROP TABLE "REPLY";

CREATE TABLE "REPLY" (
	"REPLY_NO"	NUMBER		PRIMARY KEY,
	"REPLY_CONTENT"	VARCHAR2(1000)		NOT NULL,
	"REPLY_CREATE_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"BOARD_NO"	NUMBER		REFERENCES BOARD,
	"MEMBER_NO"	NUMBER		REFERENCES MEMBER,
	"REPLY_STATUS_CD"	NUMBER		REFERENCES REPLY_STATUS
);

COMMENT ON COLUMN "REPLY"."REPLY_NO" IS '댓글 번호';
COMMENT ON COLUMN "REPLY"."REPLY_CONTENT" IS '댓글 내용';
COMMENT ON COLUMN "REPLY"."REPLY_CREATE_DT" IS '댓글 작성일';
COMMENT ON COLUMN "REPLY"."BOARD_NO" IS '게시글 번호';
COMMENT ON COLUMN "REPLY"."MEMBER_NO" IS '회원 번호';
COMMENT ON COLUMN "REPLY"."REPLY_STATUS_CD" IS '댓글 상태 코드';


-- 시퀀스 생성
CREATE SEQUENCE SEQ_MEMBER_NO; -- 회원 번호 시퀀스
CREATE SEQUENCE SEQ_BOARD_NO; -- 게시글 번호 시퀀스
CREATE SEQUENCE SEQ_REPLY_NO; -- 댓글 번호 시퀀스


--------------------------------------------------------------------------------
-- 샘플 데이터 --

-- 회원 상태 테이블
INSERT INTO MEMBER_STATUS VALUES(100, '정상');
INSERT INTO MEMBER_STATUS VALUES(101, '탈퇴');
INSERT INTO MEMBER_STATUS VALUES(102, '정지');

SELECT * FROM MEMBER_STATUS;
COMMIT;

-- 회원 등급 테이블
INSERT INTO MEMBER_GRADE VALUES(200, '일반회원');
INSERT INTO MEMBER_GRADE VALUES(201, '관리자');

SELECT * FROM MEMBER_GRADE;
COMMIT;


-- 회원 테이블

INSERT INTO MEMBER
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user01', 'pass01!', '유저일',
       '010-1234-1234', 'user01@kh.or.kr', 
       '서울시 중구 남대문로 120 대일빌딩 2층 KH정보교육원',
       DEFAULT, 100, 200);

COMMIT;

-- 로그인 SQL
-- 탈퇴회원 제외
SELECT MEMBER_NO, MEMBER_NM, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDR,
       ENROLL_DT, STATUS_CD, GRADE_CD
FROM MEMBER
WHERE MEMBER_ID = 'user01'
AND MEMBER_PW = 'pass01!'
AND STATUS_CD != 101;


-- 정지 회원 샘플데이터
INSERT INTO MEMBER
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user02', 'pass02!', '유저이',
       '010-1234-1234', 'user02@kh.or.kr', 
       '서울시 중구 남대문로 120 대일빌딩 2층 KH정보교육원',
       DEFAULT, 102, 200);

COMMIT;


-- MEMBER_PW 컬럼 크기 변경
ALTER TABLE MEMBER MODIFY MEMBER_PW VARCHAR2(100);

-- user01 비밀번호 변경
UPDATE MEMBER SET
MEMBER_PW = 'aBN5hiegXlvAovJLipPoPd5LB+xjPrAeu1tcAVg0p5MKGocvo6l825SD+ZMCOcHBFeGB7MnzH31SAnDzYYsSdg=='
WHERE MEMBER_ID = 'user01';

COMMIT;


-- STATUS_CD 기본값 지정
ALTER TABLE MEMBER MODIFY STATUS_CD DEFAULT 100;

-- GRADE_CD 기본값 지정
ALTER TABLE MEMBER MODIFY GRADE_CD DEFAULT 200;



-- 아이디 중복 검사
-- (탈퇴 회원 제외, 아이디가 일치하는 회원만 조회)
SELECT COUNT(*) FROM MEMBER
WHERE STATUS_CD != 101
AND MEMBER_ID = 'user200'  ;

-- 결과 1 == 중복 O
-- 결과 0 == 중복 X


-- 아이디로 회원 정보 검색(idSearch)
SELECT MEMBER_NM, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDR
FROM MEMBER
WHERE MEMBER_ID = 'user01'
AND STATUS_CD != 101
AND GRADE_CD = 200
;


COMMIT;

UPDATE MEMBER SET
		STATUS_CD = (SELECT STATUS_CD FROM MEMBER_STATUS WHERE STATUS_NM = '탈퇴')
		WHERE MEMBER_NO = '1' ;
		--AND MEMBER_PW = ?;
        
ROLLBACK;




---------------------------------------------------------------------------------------
-- CATEGORY 샘플 데이터
INSERT INTO CATEGORY VALUES(1, '잡담');
INSERT INTO CATEGORY VALUES(2, '질문');
INSERT INTO CATEGORY VALUES(3, '정보');

SELECT * FROM CATEGORY;
COMMIT;


-- BOARD_STATUS 샘플 데이터 추가
INSERT INTO BOARD_STATUS VALUES(300, '정상');
INSERT INTO BOARD_STATUS VALUES(301, '블라인드');
INSERT INTO BOARD_STATUS VALUES(302, '삭제');

SELECT * FROM BOARD_STATUS;
COMMIT;


-- BOARD 샘플 데이터 추가 (500개)
BEGIN
    FOR I IN 1..500 LOOP
        INSERT INTO BOARD
        VALUES(SEQ_BOARD_NO.NEXTVAL,
                SEQ_BOARD_NO.CURRVAL || '번째 게시글',
                SEQ_BOARD_NO.CURRVAL || '번째 게시글 입니다.',
                DEFAULT, DEFAULT, DEFAULT,
                4, 300, FLOOR(DBMS_RANDOM.VALUE(1,4)));
    END LOOP;
END;
/

SELECT COUNT(*) FROM BOARD; -- 500개 삽입 확인
COMMIT;


-- 게시글 상태가 섞여 있는 게시글 100개 생성
BEGIN
    FOR I IN 1..100 LOOP
        INSERT INTO BOARD
        VALUES(SEQ_BOARD_NO.NEXTVAL,
                SEQ_BOARD_NO.CURRVAL || '번째 게시글',
                SEQ_BOARD_NO.CURRVAL || '번째 게시글 입니다.',
                DEFAULT, DEFAULT, DEFAULT,
                4, 300 +  FLOOR(DBMS_RANDOM.VALUE(0,3)) 
                , FLOOR(DBMS_RANDOM.VALUE(1,4)) );
    END LOOP;
END;
/

COMMIT;

SELECT * FROM BOARD
ORDER BY BOARD_NO DESC;


-- 게시글 목록 조회
-- 글번호, 제목, 작성자, 조회수, 작성일, 카테고리, 상태명
        -- CREATE_DT, 
        -- 게시글 작성 시간으로 부터 1일이 지나지 않은 경우 -> 16:12 시간 작성
        -- 게시글 작성 시간으로 부터 1일이 지난 경우        -> 2021-12-12 날짜 작성  
       
       
SELECT BOARD_NO, BOARD_TITLE, MEMBER_NO, MEMBER_NM,READ_COUNT, 
        CASE WHEN SYSDATE - CREATE_DT < 1
             THEN TO_CHAR(  CREATE_DT, 'HH24:MI'  )  
             ELSE TO_CHAR(  CREATE_DT, 'YYYY-MM-DD'  )  
        END AS "CREATE_DT",
       CATEGORY_CD, CATEGORY_NM,
       BOARD_STATUS_CD, BOARD_STATUS_NM  
FROM BOARD
JOIN MEMBER USING(MEMBER_NO)
JOIN CATEGORY USING(CATEGORY_CD)
JOIN BOARD_STATUS USING(BOARD_STATUS_CD);


-- 게시글 목록 조회용 VIEW 생성
CREATE OR REPLACE VIEW BOARD_LIST AS
SELECT BOARD_NO, BOARD_TITLE, MEMBER_NO, MEMBER_NM,READ_COUNT, 
        CASE WHEN SYSDATE - CREATE_DT < 1
             THEN TO_CHAR(  CREATE_DT, 'HH24:MI'  )  
             ELSE TO_CHAR(  CREATE_DT, 'YYYY-MM-DD'  )  
        END AS "CREATE_DT",
       CATEGORY_CD, CATEGORY_NM,
       BOARD_STATUS_CD, BOARD_STATUS_NM  
FROM BOARD
JOIN MEMBER USING(MEMBER_NO)
JOIN CATEGORY USING(CATEGORY_CD)
JOIN BOARD_STATUS USING(BOARD_STATUS_CD);


-- 게시글 목록 조회 시 필요한 조건, 정렬
-- 정상,블라인드만 조회


SELECT * FROM
(SELECT ROWNUM RNUM, A.* 
    FROM (SELECT * FROM BOARD_LIST
        WHERE BOARD_STATUS_CD != 302
        ORDER BY BOARD_NO DESC) A)
WHERE RNUM BETWEEN 21 AND 30;

--> ROWNUM은 행의 번호를 1부터 세어주는 가상 컬럼 (반드시 1부터 시작)


SELECT COUNT(*) FROM BOARD
WHERE BOARD_STATUS_CD != 302;



-- 게시글 상세 조회
-- 2021년 12월 15일   10시 14분 34초
-- YYYY   MM   DD   HH24   MI   SS
-- 오라클 DB에서 "" 는 눈에 보이는 문자열 그대로를 인식
SELECT BOARD_NO, BOARD_TITLE, BOARD_CONTENT,
    MEMBER_NO, MEMBER_NM,
    TO_CHAR(CREATE_DT, 'YYYY"년" MM"월" DD"일" HH24"시" MI"분" SS"초"' ) CREATE_DT,
    TO_CHAR(MODIFY_DT, 'YYYY"년" MM"월" DD"일" HH24"시" MI"분" SS"초"' ) MODIFY_DT,
    CATEGORY_CD, CATEGORY_NM,
    READ_COUNT, BOARD_STATUS_NM
FROM BOARD
JOIN MEMBER USING(MEMBER_NO)
JOIN CATEGORY USING(CATEGORY_CD)
JOIN BOARD_STATUS USING(BOARD_STATUS_CD)
WHERE BOARD_NO = 580
AND BOARD_STATUS_CD != 302;

-- 마지막 수정일 확인
UPDATE BOARD SET
MODIFY_DT = SYSDATE
WHERE BOARD_NO = 597;

COMMIT;


SELECT * FROM CATEGORY;

INSERT INTO CATEGORY VALUES(4, '공지');
COMMIT;



-- 게시판 이미지 테이블
CREATE TABLE "BOARD_IMG" (
	"IMG_NO"	NUMBER		PRIMARY KEY,
	"IMG_PATH"	VARCHAR2(200)		NOT NULL,
	"IMG_NM"	VARCHAR2(30)		NOT NULL,
	"IMG_ORIGINAL"	VARCHAR2(100)		NOT NULL,
	"IMG_LEVEL"	NUMBER		NOT NULL,
	"BOARD_NO"	NUMBER  REFERENCES BOARD   NOT NULL
);

COMMENT ON COLUMN "BOARD_IMG"."IMG_NO" IS '이미지 번호';
COMMENT ON COLUMN "BOARD_IMG"."IMG_PATH" IS '이미지 경로';
COMMENT ON COLUMN "BOARD_IMG"."IMG_NM" IS '이미지명';
COMMENT ON COLUMN "BOARD_IMG"."IMG_ORIGINAL" IS '원본 이미지명';
COMMENT ON COLUMN "BOARD_IMG"."IMG_LEVEL" IS '이미지 위치 지정값 저장';
COMMENT ON COLUMN "BOARD_IMG"."BOARD_NO" IS '게시글 번호';


-- 이미지 번호 시퀀스
CREATE SEQUENCE SEQ_IMG_NO;



-- 다음 게시글 번호 조회
SELECT SEQ_BOARD_NO.NEXTVAL FROM DUAL  ;







