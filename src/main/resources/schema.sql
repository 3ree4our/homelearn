SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `CART_COURSE`;
DROP TABLE IF EXISTS `CART`;
DROP TABLE IF EXISTS `ENROLLED_COURSE`;
DROP TABLE IF EXISTS `REVIEW`;
DROP TABLE IF EXISTS `PAYMENT_HISTORY`;
DROP TABLE IF EXISTS `ORDERS`;
DROP TABLE IF EXISTS `CHAPTER`;
DROP TABLE IF EXISTS `COURSE`;
DROP TABLE IF EXISTS `MEMBER_ROLE`;
DROP TABLE IF EXISTS `SUBJECT`;
DROP TABLE IF EXISTS `IMAGE`;
DROP TABLE IF EXISTS `MEMBER`;
DROP TABLE IF EXISTS `FILE`;
DROP TABLE IF EXISTS `REFRESH_TOKEN`;
DROP TABLE IF EXISTS `ROLE`;



create table member(
                       id          bigint auto_increment primary key,
                       email       varchar(50)                           not null,
                       password    varchar(255)                          not null,
                       nickname    varchar(30)                           not null,
                       created_at  timestamp default current_timestamp() null,
                       modified_at timestamp                             null,
                       delete_yn   bit       default b'0'                null,
                       constraint email unique (email)
);

CREATE TABLE `SUBJECT` (
                           `ID` BIGINT NOT NULL AUTO_INCREMENT,
                           `NAME` VARCHAR(20) NOT NULL,
                           `CREATED_AT` TIMESTAMP NOT NULL,
                           `MODIFIED_AT` TIMESTAMP NULL,
                           PRIMARY KEY (`ID`)
);

CREATE TABLE `COURSE` (
                          `ID` BIGINT NOT NULL AUTO_INCREMENT,
                          `SUBJECT_ID` BIGINT NOT NULL,
                          `TEACHER_ID` BIGINT NOT NULL,
                          `NAME` VARCHAR(255) NOT NULL,
                          `DESCRIPTION` VARCHAR(5000) NOT NULL,
                          `PRICE` INT NOT NULL,
                          `PERIOD` INT NOT NULL,
                          `DELETE_YN` BIT DEFAULT b'0',
                          `CREATED_AT` TIMESTAMP NOT NULL,
                          `MODIFIED_AT` TIMESTAMP NULL,
                          PRIMARY KEY (`ID`),
                          FOREIGN KEY (`SUBJECT_ID`) REFERENCES `SUBJECT`(`ID`),
                          FOREIGN KEY (`TEACHER_ID`) REFERENCES `MEMBER`(`ID`)
);

CREATE TABLE `CHAPTER` (
                           `ID`    BIGINT auto_increment NOT NULL PRIMARY KEY,
                           `COURSE_ID` BIGINT  NOT NULL,
                           `URL`   VARCHAR(5000)   NOT NULL,
                           `CHAPTER_NAME` VARCHAR(5000)    NOT NULL,
                           `NAME`  VARCHAR(255)    NOT NULL,
                           `RUNNING_TIME`  INT NOT NULL,
                           `CREATED_AT`    TIMESTAMP   NOT NULL,
                           `MODIFIED_AT`   TIMESTAMP   NULL,
                           FOREIGN KEY (COURSE_ID) REFERENCES COURSE (ID) ON DELETE CASCADE
);

CREATE TABLE `ORDERS` (
                          `IMP_UID`	VARCHAR(255) NOT NULL,
                          `ORDERER_ID`	BIGINT NOT NULL,
                          `MERCHANT_UID`	VARCHAR(255) NOT NULL,
                          `CREATED_AT`	TIMESTAMP NOT NULL,
                          `MODIFIED_AT`	TIMESTAMP NULL,
                          PRIMARY KEY (`IMP_UID`),
                          FOREIGN KEY (`ORDERER_ID`) REFERENCES `MEMBER`(`ID`)
);

CREATE TABLE `ENROLLED_COURSE` (
                                   `ID` BIGINT NOT NULL AUTO_INCREMENT,
                                   `COURSE_ID` BIGINT NOT NULL,
                                   `IMP_UID` VARCHAR(255) NOT NULL,
                                   `STUDENT_ID` BIGINT NOT NULL,
                                   `IS_REFUNDED` BIT(1) DEFAULT 0 NOT NULL,
                                   `IS_STARTED` BIT(1) DEFAULT 0 NOT NULL,
                                   `CREATED_AT` TIMESTAMP NOT NULL,
                                   `MODIFIED_AT` TIMESTAMP NULL,
                                   PRIMARY KEY (`ID`),
                                   FOREIGN KEY (`COURSE_ID`) REFERENCES `COURSE`(`ID`),
                                   FOREIGN KEY (`IMP_UID`) REFERENCES `ORDERS`(`IMP_UID`),
                                   FOREIGN KEY (`STUDENT_ID`) REFERENCES `MEMBER`(`ID`)
);

create table member_role(
                            member_id bigint not null,
                            role_id   bigint not null,
                            constraint fk_member_id foreign key (member_id) references member (id),
                            constraint fk_role_id foreign key (role_id) references role (id)
);

CREATE TABLE `CART` (
                        `STUDENT_ID` BIGINT NOT NULL,
                        `CREATED_AT` TIMESTAMP NOT NULL,
                        `MODIFIED_AT` TIMESTAMP NULL,
                        PRIMARY KEY (`STUDENT_ID`),
                        FOREIGN KEY (`STUDENT_ID`) REFERENCES `MEMBER`(`ID`)
);

CREATE TABLE `CART_COURSE` (
                               `ID` BIGINT NOT NULL AUTO_INCREMENT,
                               `STUDENT_ID` BIGINT NOT NULL,
                               `COURSE_ID` BIGINT NOT NULL,
                               `CREATED_AT` TIMESTAMP NOT NULL,
                               `MODIFIED_AT` TIMESTAMP NULL,
                               PRIMARY KEY (`ID`),
                               FOREIGN KEY (`STUDENT_ID`) REFERENCES `CART`(`STUDENT_ID`),
                               FOREIGN KEY (`COURSE_ID`) REFERENCES `COURSE`(`ID`)
);

CREATE TABLE `PAYMENT_HISTORY` (
                                   `ID` BIGINT NOT NULL AUTO_INCREMENT,
                                   `ORDERER_ID`	BIGINT	NOT NULL,
                                   `IMP_UID`	VARCHAR(255)	NOT NULL,
                                   `PAID_AMOUNT`	INT NULL,
                                   `REFUNDED_AMOUNT`	INT NULL,
                                   `REMAINED_AMOUNT`	INT NOT NULL,
                                   `CREATED_AT`	TIMESTAMP NOT NULL,
                                   PRIMARY KEY (`ID`),
                                   FOREIGN KEY (`ORDERER_ID`) REFERENCES `MEMBER`(`ID`),
                                   FOREIGN KEY (`IMP_UID`) REFERENCES `ORDERS`(`IMP_UID`)
);

CREATE TABLE `REVIEW` (
                          `ID` BIGINT NOT NULL AUTO_INCREMENT,
                          `COURSE_ID` BIGINT NOT NULL,
                          `STUDENT_ID` BIGINT NOT NULL,
                          `CONTENT` VARCHAR(5000) NOT NULL,
                          `SCORE` INT NOT NULL,
                          `CREATED_AT` TIMESTAMP NOT NULL,
                          `MODIFIED_AT` TIMESTAMP NULL,
                          PRIMARY KEY (`ID`),
                          FOREIGN KEY (`COURSE_ID`) REFERENCES `COURSE`(`ID`),
                          FOREIGN KEY (`STUDENT_ID`) REFERENCES `MEMBER`(`ID`)
);

CREATE TABLE `IMAGE` (
                         `ID` BIGINT NOT NULL AUTO_INCREMENT,
                         `TARGET_ID` BIGINT NOT NULL,
                         `TARGET_TYPE` BIGINT NOT NULL,
                         `NAME` VARCHAR(255) NULL,
                         `IMAGE_FILE` BLOB NOT NULL,
                         `CREATED_AT` TIMESTAMP NOT NULL,
                         `MODIFIED_AT` TIMESTAMP NULL,
                         PRIMARY KEY (`ID`)
);

create table file(
                     id            bigint auto_increment primary key,
                     reference_key bigint       not null,
                     original_name varchar(60)  not null,
                     save_name     varchar(255) not null,
                     file_path     varchar(255) not null
);

create table refresh_token(
                              id bigint auto_increment primary key,
                              username      varchar(50)  not null,
                              refresh_token varchar(500) not null,
                              expiration    timestamp    not null
);

ALTER TABLE course ADD COLUMN FNAME VARCHAR(3000) DEFAULT '' AFTER period,
    ADD COLUMN OFNAME VARCHAR(3000) DEFAULT '' AFTER FNAME,
    ADD COLUMN FSIZE INT DEFAULT 0 AFTER OFNAME,
    ADD COLUMN FFNAME VARCHAR(3000) DEFAULT '' AFTER period;

-- auto-generated definition
create table role(
                     id bigint auto_increment primary key,
                     role        varchar(15)                           not null,
                     created_at  timestamp default current_timestamp() null,
                     modified_at timestamp                             null
);
