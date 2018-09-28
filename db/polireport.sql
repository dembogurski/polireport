--
-- ER/Studio 8.0 SQL Code Generation
-- Project :      DATA MODEL
--
-- Date Created : Friday, September 28, 2018 13:57:12
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: dispositivos 
--

CREATE TABLE dispositivos(
    frec_actualiz_gps    INT,
    nick                 VARCHAR(24)     NOT NULL,
    uuid                 VARCHAR(200)    NOT NULL,
    tiempo_limite        INT,
    radio_aviso          INT,
    audio_auto_play      INT,
    PRIMARY KEY (nick, uuid)
)ENGINE=INNODB
;



-- 
-- TABLE: reportes 
--

CREATE TABLE reportes(
    id_rep       CHAR(10)        NOT NULL,
    id_tipo      VARCHAR(10)     NOT NULL,
    id_sesion    INT             NOT NULL,
    nick         VARCHAR(24)     NOT NULL,
    uuid         VARCHAR(200)    NOT NULL,
    fecha        DATETIME,
    latitude     VARCHAR(20),
    longitude    VARCHAR(20),
    PRIMARY KEY (id_rep)
)ENGINE=INNODB
;



-- 
-- TABLE: sesiones 
--

CREATE TABLE sesiones(
    id_sesion       INT             NOT NULL,
    fecha           DATETIME,
    uuid            VARCHAR(200)    NOT NULL,
    nick            VARCHAR(24)     NOT NULL,
    ip              VARCHAR(20),
    estado          VARCHAR(10),
    fecha_cierre    DATETIME,
    PRIMARY KEY (id_sesion, uuid, nick)
)ENGINE=INNODB
;



-- 
-- TABLE: tipos_rep 
--

CREATE TABLE tipos_rep(
    id_tipo    VARCHAR(10)     NOT NULL,
    descrip    VARCHAR(100),
    PRIMARY KEY (id_tipo)
)ENGINE=INNODB
;



-- 
-- TABLE: usuarios 
--

CREATE TABLE usuarios(
    nick          VARCHAR(24)     NOT NULL,
    nombre        VARCHAR(100),
    email         VARCHAR(100),
    passw         VARCHAR(256),
    tel           VARCHAR(20),
    fecha_reg     DATE,
    puntos        INT,
    auto_login    INT,
    imagen        VARCHAR(100),
    estado        VARCHAR(10),
    PRIMARY KEY (nick)
)ENGINE=INNODB
;



-- 
-- TABLE: dispositivos 
--

ALTER TABLE dispositivos ADD CONSTRAINT Refusuarios101 
    FOREIGN KEY (nick)
    REFERENCES usuarios(nick)
;


-- 
-- TABLE: reportes 
--

ALTER TABLE reportes ADD CONSTRAINT Reftipos_rep31 
    FOREIGN KEY (id_tipo)
    REFERENCES tipos_rep(id_tipo)
;

ALTER TABLE reportes ADD CONSTRAINT Refsesiones61 
    FOREIGN KEY (id_sesion, nick, uuid)
    REFERENCES sesiones(id_sesion, uuid, nick)
;


-- 
-- TABLE: sesiones 
--

ALTER TABLE sesiones ADD CONSTRAINT Refdispositivos91 
    FOREIGN KEY (uuid, nick)
    REFERENCES dispositivos(nick, uuid)
;


