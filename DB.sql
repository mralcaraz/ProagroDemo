
CREATE DATABASE TEST_PROAGRO;
GRANT SELECT,INSERT,UPDATE,DELETE ON TEST_PROAGRO TO crud_user;

CREATE TABLE GEORREFERENCIAS (
	ID_GEORREFERENCIA INT NOT NULL,
	ID_ESTADO INT NOT NULL,
	LATITUD DECIMAL(14,10) NOT NULL,
	LONGITUD DECIMAL(14,10) NOT NULL
	);

CREATE TABLE USUARIO (
	ID_USUARIO INT NOT NULL,
	CONTRASENIA VARCHAR(20) NOT NULL,
	NOMBRE VARCHAR(100) NOT NULL,
	FECHA_NACIMIENTO DATE NOT NULL,
	RFC CHAR(13) NOT NULL
	);

CREATE TABLE ESTADO (
	ID_ESTADO INT NOT NULL,
	NOMBRE_ESTADO VARCHAR(50) NOT NULL,
	CLAVE_ESTADO VARCHAR(5) NOT NULL
	);

CREATE TABLE PERMISOS (
	ID_PERMISO INT IDENTITY(1,1) NOT NULL,
	ID_USUARIO INT NOT NULL,
	ID_ESTADO INT NOT NULL
	);

ALTER TABLE georreferencias
ADD CONSTRAINT PK_GEORREFERENCIAS PRIMARY KEY(id_georreferencia);
ALTER TABLE usuario
ADD CONSTRAINT PK_USUARIO PRIMARY KEY(id_usuario);
ALTER TABLE estado
ADD CONSTRAINT PK_ESTADO PRIMARY KEY(id_estado);
ALTER TABLE permisos
ADD CONSTRAINT PK_PERMISOS PRIMARY KEY(id_permiso);

ALTER TABLE georreferencias
ADD CONSTRAINT FK_GEORREFERENCIA_ESTADO FOREIGN KEY(id_estado)
REFERENCES estado(id_estado);
ALTER TABLE permisos
ADD CONSTRAINT FK_PERMISOS_USUARIO FOREIGN KEY(id_usuario)
REFERENCES usuario(id_usuario)
ON DELETE CASCADE;
ALTER TABLE permisos
ADD CONSTRAINT FK_PERMISOS_ESTADO FOREIGN KEY(id_estado)
REFERENCES estado(id_estado)
ON DELETE CASCADE;



INSERT INTO  usuario(id_usuario, contrasenia, nombre, fecha_nacimiento, rfc) VALUES (1, 'abcde', 'PORCICULTORES EL HIBRIDO S DE RL', '20050111', 'PHI0501116U3');
INSERT INTO  usuario(id_usuario, contrasenia, nombre, fecha_nacimiento, rfc) VALUES (2, 'abcde', 'AGROPECUARIA EL GIGANTE S.A. DE C.V.', '20000114', 'AGI000114C70');
INSERT INTO  usuario(id_usuario, contrasenia, nombre, fecha_nacimiento, rfc) VALUES (3, 'abcde', 'PROVEEDORES AGROALIMENTARIOS DEL DISTRITO DE RIEGO 01 SPR DE RL', '20040528', 'PAD0405282B1');
INSERT INTO  usuario(id_usuario, contrasenia, nombre, fecha_nacimiento, rfc) VALUES (4, 'abcde', 'EL SILOGISMO SPR DE RL', '19971106', 'SIL971106652');
INSERT INTO  usuario(id_usuario, contrasenia, nombre, fecha_nacimiento, rfc) VALUES (5, 'abcde', 'PRODUCTORES UNIDOS DE LAGOS, S.C. DE R.L. DE C.V.', '20050711', 'PUL0507113N6');
INSERT INTO  usuario(id_usuario, contrasenia, nombre, fecha_nacimiento, rfc) VALUES (6, 'abcde', 'ALIMENTOS PROCESADOS EL ZARCO S DE R.L. M.I. DE C.V.', '20060201', 'APZ060201412');
INSERT INTO  usuario(id_usuario, contrasenia, nombre, fecha_nacimiento, rfc) VALUES (7, 'abcde', 'HSBC MEXICO S.A., INSTITUCION DE BANCA MULTIPLE GRUPO FINANCIERO HSBC', '19950125', 'HMI950125KG8');
INSERT INTO  usuario(id_usuario, contrasenia, nombre, fecha_nacimiento, rfc) VALUES (8, 'abcde', 'UNION GANADERA LAS TROJES', '20051114', 'UGD0511148J3');
INSERT INTO  usuario(id_usuario, contrasenia, nombre, fecha_nacimiento, rfc) VALUES (9, 'abcde', 'QUESOS LOS MARTINEZ, S. DE R.L. M.I. DE C.V.', '20050614', 'QMA050614F17');
INSERT INTO  usuario(id_usuario, contrasenia, nombre, fecha_nacimiento, rfc) VALUES (10, 'abcde', 'RANCHO MEDIO KILO, S. P.R. DE R.L.', '19980203', 'RMK9802033P7');
INSERT INTO  usuario(id_usuario, contrasenia, nombre, fecha_nacimiento, rfc) VALUES (11, 'abcde', 'MARTIN RUIZ BERNAL, S. DE P.R. DE R.L.', '20020220', 'MRB0112136W7');
INSERT INTO  usuario(id_usuario, contrasenia, nombre, fecha_nacimiento, rfc) VALUES (12, 'abcde', 'CHIVOS Y BORREGOS DE AGUASCALIENTES, S.P.R. DE R.L', '20060213', 'CBA051107TKA');
INSERT INTO  usuario(id_usuario, contrasenia, nombre, fecha_nacimiento, rfc) VALUES (13, 'abcde', 'GANADEROS UNIDOS DE TEQUILILLA', '20021209', 'GUT021209P8G');
INSERT INTO  usuario(id_usuario, contrasenia, nombre, fecha_nacimiento, rfc) VALUES (14, 'abcde', 'COMUNIDAD PRODUCTORA 2000, S.P.R.DE R.L.', '19991210', 'CPD9912105S7');
INSERT INTO  usuario(id_usuario, contrasenia, nombre, fecha_nacimiento, rfc) VALUES (15, 'abcde', 'INOVAGRO, S.A. DE C.V.', '20030616', 'INO030616JN5');
INSERT INTO  usuario(id_usuario, contrasenia, nombre, fecha_nacimiento, rfc) VALUES (16, 'abcde', 'GANADERIA LA GREÑUDA, S.C. DE R.L.', '20060624', 'GGR060624JV4');
INSERT INTO  usuario(id_usuario, contrasenia, nombre, fecha_nacimiento, rfc) VALUES (17, 'abcde', 'PRODUCTORES DE LA ESTANCIA DE CUQUIO, S.C.  DE  R.L.', '20051021', 'PEC051021HX7');
INSERT INTO  usuario(id_usuario, contrasenia, nombre, fecha_nacimiento, rfc) VALUES (18, 'abcde', 'GRANJA EL 13 DE LOS ACUÑA, S.P.R.  DE  R.L.', '20040327', 'GTA040327Q39');
INSERT INTO  usuario(id_usuario, contrasenia, nombre, fecha_nacimiento, rfc) VALUES (19, 'abcde', 'EL GREÑERO, S. DE R.L. DE C.V.', '20020508', 'GRE0205086JA');
INSERT INTO  usuario(id_usuario, contrasenia, nombre, fecha_nacimiento, rfc) VALUES (20, 'abcde', 'AGRASISA, S.A. DE C.V.', '20011109', 'AGR011109ST4');

INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (1, 'AGUASCALIENTES', 'AGS');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (2, 'BAJA CALIFORNIA', 'BCN');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (3, 'BAJA CALIFORNIA SUR', 'BCS');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (4, 'CAMPECHE', 'CAMP');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (5, 'COAHUILA', 'COAH');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (6, 'COLIMA', 'COL');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (7, 'CHIAPAS', 'CHIS');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (8, 'CHIHUAHUA', 'CHIH');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (9, 'DISTRITO FEDERAL', 'DF');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (10, 'DURANGO', 'DGO');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (11, 'GUANAJUATO', 'GTO');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (12, 'GUERRERO', 'GRO');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (13, 'HIDALGO', 'HGO');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (14, 'JALISCO', 'JAL');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (15, 'ESTADO DE MEXICO', 'MEX');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (16, 'MICHOACAN', 'MICH');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (17, 'MORELOS', 'MOR');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (18, 'NAYARIT', 'NAY');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (19, 'NUEVO LEON', 'NL');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (20, 'OAXACA', 'OAX');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (21, 'PUEBLA', 'PUE');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (22, 'QUERETARO', 'QRO');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (23, 'QUINTANA ROO', 'QROO');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (24, 'SAN LUIS POTOSI', 'SLP');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (25, 'SINALOA', 'SIN');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (26, 'SONORA', 'SON');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (27, 'TABASCO', 'TAB');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (28, 'TAMAULIPAS', 'TAMP');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (29, 'TLAXCALA', 'TLAX');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (30, 'VERACRUZ', 'VER');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (31, 'YUCATAN', 'YUC');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (32, 'ZACATECAS', 'ZAC');
INSERT INTO estado(id_estado,nombre_estado, clave_estado) VALUES (33, 'CIUDAD DE MÉXICO', 'CDMX');


INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (1,1,21.13180225,-89.50884361);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (2,1,22.302625,102.2263139);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (3,1,23.2336,103.3168167);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (4,1,23.23353333,103.3335528);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (5,1,22.07935,102.0409833);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (6,1,22.39769444,102.2899333);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (7,1,22.39863333,102.2900556);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (8,1,21.98357222,102.2667667);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (9,1,21.9836,102.2502306);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (10,1,22.616775,102.2335389);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (11,5,25.506789,-102.2433589);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (12,5,25.50705411,-102.2443927);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (13,5,26.30458298,-103.0647895);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (14,5,26.30687434,-103.0620606);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (15,5,26.30047677,-103.0553136);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (16,5,26.29786489,-103.0583045);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (17,5,26.30464132,-103.0648854);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (18,5,26.30694835,-103.0622138);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (19,5,26.31341072,-103.0691436);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (20,5,26.31077704,-103.0722422);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (21,25,24.20180556,107.1031389);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (22,25,2.201583333,107.1035556);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (23,25,24.22061111,107.1337222);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (24,25,24.22238889,107.1337222);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (25,25,24.10958333,107.0839722);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (26,25,24.11113889,107.08325);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (27,25,24.10941667,107.0788889);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (28,25,24.10727778,107.0763611);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (29,25,24.21880556,107.1337778);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (30,25,24.22055556,107.13375);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (31,14,20.62366667,103.8016111);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (32,14,20.44083333,103.9239167);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (33,14,20.48036111,103.9556111);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (34,14,20.48425,103.9726389);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (35,14,19.88372222,103.372);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (36,14,19.62819444,103.7716944);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (37,14,19.64733333,103.7284444);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (38,14,19.65225,103.7428056);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (39,14,19.65730556,103.7916111);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (40,14,19.5935,103.8120556);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (41,28,25.74877778,97.57894444);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (42,28,25.30605556,97.86688889);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (43,28,25.30605556,97.86688889);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (44,28,24.61438889,97.91577778);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (45,28,25.31441667,97.79305556);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (46,28,24.61452778,97.91575);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (47,28,25.29966667,97.85988889);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (48,28,25.29966667,97.85988889);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (49,28,25.74986111,97.60216667);
INSERT INTO georreferencias (id_georreferencia, id_estado, latitud, longitud) VALUES (50,28,25.74986111,97.60218611);

INSERT INTO permisos(id_usuario, id_estado) VALUES (1, 1);
INSERT INTO permisos(id_usuario, id_estado) VALUES (2, 5);
INSERT INTO permisos(id_usuario, id_estado) VALUES (3, 25);
INSERT INTO permisos(id_usuario, id_estado) VALUES (4, 14);
INSERT INTO permisos(id_usuario, id_estado) VALUES (5, 28);
INSERT INTO permisos(id_usuario, id_estado) VALUES (6, 5);
INSERT INTO permisos(id_usuario, id_estado) VALUES (7, 5);
INSERT INTO permisos(id_usuario, id_estado) VALUES (8, 5);
INSERT INTO permisos(id_usuario, id_estado) VALUES (9, 1);
INSERT INTO permisos(id_usuario, id_estado) VALUES (10, 25);
INSERT INTO permisos(id_usuario, id_estado) VALUES (11, 14);
INSERT INTO permisos(id_usuario, id_estado) VALUES (12, 28);
INSERT INTO permisos(id_usuario, id_estado) VALUES (13, 28);
INSERT INTO permisos(id_usuario, id_estado) VALUES (14, 28);
INSERT INTO permisos(id_usuario, id_estado) VALUES (15, 14);
INSERT INTO permisos(id_usuario, id_estado) VALUES (16, 14);
INSERT INTO permisos(id_usuario, id_estado) VALUES (17, 1);
INSERT INTO permisos(id_usuario, id_estado) VALUES (18, 25);
INSERT INTO permisos(id_usuario, id_estado) VALUES (19, 25);
INSERT INTO permisos(id_usuario, id_estado) VALUES (20, 1);