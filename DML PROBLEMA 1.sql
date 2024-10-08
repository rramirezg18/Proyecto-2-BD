-- Generated by Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   at:        2024-09-21 20:58:28 CST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE clase_vuelo (
    codigo_clase VARCHAR2(10 BYTE) NOT NULL,
    nombre_clase VARCHAR2(30 BYTE) NOT NULL
);

ALTER TABLE clase_vuelo ADD CONSTRAINT clase_vuelo_pk PRIMARY KEY ( codigo_clase );

CREATE TABLE correo_electronico (
    codigo_correo  VARCHAR2(10 BYTE) NOT NULL,
    correo         VARCHAR2(20 BYTE) NOT NULL,
    codigo_turista CHAR(10 BYTE) NOT NULL
);

ALTER TABLE correo_electronico ADD CONSTRAINT correo_electronico_pk PRIMARY KEY ( codigo_correo );

CREATE TABLE hospedaje (
    codigo_hospedaje VARCHAR2(10 BYTE) NOT NULL,
    fecha_llegada    DATE NOT NULL,
    fecha_partida    DATE NOT NULL,
    codigo_hotel     VARCHAR2(10 BYTE) NOT NULL,
    codigo_turista   CHAR(10 BYTE) NOT NULL,
    codigo_regimen   VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE hospedaje ADD CONSTRAINT hospedaje_pk PRIMARY KEY ( codigo_hospedaje );

CREATE TABLE hotel (
    codigo_hotel  VARCHAR2(10 BYTE) NOT NULL,
    nombre_hotel  VARCHAR2(45 BYTE) NOT NULL,
    direccion     VARCHAR2(75 BYTE) NOT NULL,
    ciudad        VARCHAR2(75 BYTE) NOT NULL,
    telefono      VARCHAR2(20 BYTE) NOT NULL,
    numero_plazas NUMBER(4) NOT NULL
);

ALTER TABLE hotel ADD CONSTRAINT hotel_pk PRIMARY KEY ( codigo_hotel );

CREATE TABLE regimen_hospedaje (
    codigo_regimen VARCHAR2(10 BYTE) NOT NULL,
    nombre_regimen VARCHAR2(30 BYTE) NOT NULL
);

ALTER TABLE regimen_hospedaje ADD CONSTRAINT regimen_hospedaje_pk PRIMARY KEY ( codigo_regimen );

CREATE TABLE sucursal (
    codigo_sucursal VARCHAR2(10 BYTE) NOT NULL,
    direccion       VARCHAR2(75 BYTE) NOT NULL,
    telefono        VARCHAR2(20 BYTE) NOT NULL
);

ALTER TABLE sucursal ADD CONSTRAINT sucursal_pk PRIMARY KEY ( codigo_sucursal );

CREATE TABLE telefono (
    codigo_telefono  VARCHAR2(10 BYTE) NOT NULL,
    prefijo_telefono VARCHAR2(5 BYTE) NOT NULL,
    numero_telefono  VARCHAR2(15 BYTE) NOT NULL,
    codigo_turista   CHAR(10 BYTE) NOT NULL
);

ALTER TABLE telefono ADD CONSTRAINT telefono_pk PRIMARY KEY ( codigo_telefono );

CREATE TABLE turista (
    codigo_turista   CHAR(10 BYTE) NOT NULL,
    primer_nombre    VARCHAR2(30 BYTE) NOT NULL,
    segundo_nombre   VARCHAR2(30 BYTE),
    tercer_nombre    VARCHAR2(30 BYTE),
    primer_apellido  VARCHAR2(30 BYTE) NOT NULL,
    segundo_apellido VARCHAR2(30 BYTE) NOT NULL,
    direccion        VARCHAR2(75 BYTE) NOT NULL,
    numero_vuelo     NUMBER(4) NOT NULL,
    codigo_sucursal  VARCHAR2(10 BYTE) NOT NULL,
    codigo_hotel     VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE turista ADD CONSTRAINT turista_pk PRIMARY KEY ( codigo_turista );

CREATE TABLE turista_sucursal (
    codigo_turista_sucursal VARCHAR2(10 BYTE) NOT NULL,
    codigo_sucursal         VARCHAR2(10 BYTE) NOT NULL,
    codigo_turista          CHAR(10 BYTE) NOT NULL
);

ALTER TABLE turista_sucursal ADD CONSTRAINT turista_sucursal_pk PRIMARY KEY ( codigo_turista_sucursal );

CREATE TABLE turista_vuelo (
    codigo_turista_vuelo VARCHAR2(10 BYTE) NOT NULL,
    codigo_turista       CHAR(10 BYTE) NOT NULL,
    numero_vuelo         NUMBER(4) NOT NULL,
    codigo_clase         VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE turista_vuelo ADD CONSTRAINT turista_vuelo_pk PRIMARY KEY ( codigo_turista_vuelo );

CREATE TABLE vuelo (
    numero_vuelo         NUMBER(4) NOT NULL,
    nombre_aerolinea     VARCHAR2(20 BYTE) NOT NULL,
    fecha                DATE NOT NULL,
    hora                 VARCHAR2(15 BYTE) NOT NULL,
    origne               VARCHAR2(30 BYTE) NOT NULL,
    destino              VARCHAR2(30 BYTE) NOT NULL,
    plazas_totales       NUMBER(3) NOT NULL,
    plazas_clase_turista NUMBER(3) NOT NULL
);

ALTER TABLE vuelo ADD CONSTRAINT vuelo_pk PRIMARY KEY ( numero_vuelo );

ALTER TABLE turista_vuelo
    ADD CONSTRAINT turista_vuelo_turista_fk FOREIGN KEY ( codigo_turista )
        REFERENCES turista ( codigo_turista );


ALTER TABLE correo_electronico
    ADD CONSTRAINT correo_electronico_turista_fk FOREIGN KEY ( codigo_turista )
        REFERENCES turista ( codigo_turista );

ALTER TABLE hospedaje
    ADD CONSTRAINT hospedaje_hotel_fk FOREIGN KEY ( codigo_hotel )
        REFERENCES hotel ( codigo_hotel );

ALTER TABLE hospedaje
    ADD CONSTRAINT hospedaje_regimen_hospedaje_fk FOREIGN KEY ( codigo_regimen )
        REFERENCES regimen_hospedaje ( codigo_regimen );

ALTER TABLE hospedaje
    ADD CONSTRAINT hospedaje_turista_fk FOREIGN KEY ( codigo_turista )
        REFERENCES turista ( codigo_turista );

ALTER TABLE telefono
    ADD CONSTRAINT telefono_turista_fk FOREIGN KEY ( codigo_turista )
        REFERENCES turista ( codigo_turista );

ALTER TABLE turista
    ADD CONSTRAINT turista_hotel_fk FOREIGN KEY ( codigo_hotel )
        REFERENCES hotel ( codigo_hotel );

ALTER TABLE turista
    ADD CONSTRAINT turista_sucursal_fk FOREIGN KEY ( codigo_sucursal )
        REFERENCES sucursal ( codigo_sucursal );

ALTER TABLE turista_sucursal
    ADD CONSTRAINT turista_sucursal_sucursal_fk FOREIGN KEY ( codigo_sucursal )
        REFERENCES sucursal ( codigo_sucursal );

ALTER TABLE turista_sucursal
    ADD CONSTRAINT turista_sucursal_turista_fk FOREIGN KEY ( codigo_turista )
        REFERENCES turista ( codigo_turista );

ALTER TABLE turista_vuelo
    ADD CONSTRAINT turista_vuelo_clase_vuelo_fk FOREIGN KEY ( codigo_clase )
        REFERENCES clase_vuelo ( codigo_clase );

ALTER TABLE turista
    ADD CONSTRAINT turista_vuelo_fk FOREIGN KEY ( numero_vuelo )
        REFERENCES vuelo ( numero_vuelo );

ALTER TABLE turista_vuelo
    ADD CONSTRAINT turista_vuelo_vuelo_fk FOREIGN KEY ( numero_vuelo )
        REFERENCES vuelo ( numero_vuelo );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             23
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                            
INSERT INTO regimen_hospedaje (codigo_regimen, nombre_regimen) VALUES ('REG01','media pension');
INSERT INTO regimen_hospedaje (codigo_regimen, nombre_regimen) VALUES ('REG02','pension completa');
COMMIT;


INSERT INTO clase_vuelo (codigo_clase, nombre_clase) VALUES ('CV01','Primera clase');
INSERT INTO clase_vuelo (codigo_clase, nombre_clase) VALUES ('CV02','Clase turista');
COMMIT;



INSERT INTO hotel (codigo_hotel, nombre_hotel, direccion, ciudad, telefono, numero_plazas) 
VALUES ('HTL001', 'Sol del Mar', 'Avenida Mar�tima 123', 'Barcelona', '935123456', 150);

INSERT INTO hotel (codigo_hotel, nombre_hotel, direccion, ciudad, telefono, numero_plazas) 
VALUES ('HTL002', 'Luna Azul', 'Calle de la Playa 25', 'Canc�n', '9981234567', 200);

INSERT INTO hotel (codigo_hotel, nombre_hotel, direccion, ciudad, telefono, numero_plazas) 
VALUES ('HTL003', 'Estrella Fugaz', 'Boulevard del Cielo 77', 'Montevideo', '29034567', 120);

INSERT INTO hotel (codigo_hotel, nombre_hotel, direccion, ciudad, telefono, numero_plazas) 
VALUES ('HTL004', 'Monta�as Verdes', 'Carretera Nacional 45', 'Bogot�', '3121234567', 180);

INSERT INTO hotel (codigo_hotel, nombre_hotel, direccion, ciudad, telefono, numero_plazas) 
VALUES ('HTL005', 'Oasis Tropical', 'Paseo del Sol 88', 'Miami', '3051234567', 250);

INSERT INTO hotel (codigo_hotel, nombre_hotel, direccion, ciudad, telefono, numero_plazas) 
VALUES ('HTL006', 'Brisas del Norte', 'Calle Principal 45', 'Lima', '014234567', 100);

INSERT INTO hotel (codigo_hotel, nombre_hotel, direccion, ciudad, telefono, numero_plazas) 
VALUES ('HTL007', 'Para�so del Sur', 'Avenida Sur 89', 'Santiago', '227654321', 220);

INSERT INTO hotel (codigo_hotel, nombre_hotel, direccion, ciudad, telefono, numero_plazas) 
VALUES ('HTL008', 'Costa Dorada', 'Calle Dorada 101', 'Puerto Vallarta', '3221234567', 170);

INSERT INTO hotel (codigo_hotel, nombre_hotel, direccion, ciudad, telefono, numero_plazas) 
VALUES ('HTL009', 'Sol Naciente', 'Calle Luna 98', 'Caracas', '2127654321', 130);

INSERT INTO hotel (codigo_hotel, nombre_hotel, direccion, ciudad, telefono, numero_plazas) 
VALUES ('HTL010', 'Colinas Blancas', 'Avenida Las Colinas 5', 'Quito', '023456789', 110);

INSERT INTO hotel (codigo_hotel, nombre_hotel, direccion, ciudad, telefono, numero_plazas) 
VALUES ('HTL011', 'Mar Azul', 'Calle Ocean 50', 'Rio de Janeiro', '2123456789', 190);

INSERT INTO hotel (codigo_hotel, nombre_hotel, direccion, ciudad, telefono, numero_plazas) 
VALUES ('HTL012', 'Jardines del Sol', 'Avenida Central 44', 'San Jos�', '5062234567', 160);

INSERT INTO hotel (codigo_hotel, nombre_hotel, direccion, ciudad, telefono, numero_plazas) 
VALUES ('HTL013', 'Torres del Pac�fico', 'Calle del Faro 33', 'Valpara�so', '322987654', 210);

INSERT INTO hotel (codigo_hotel, nombre_hotel, direccion, ciudad, telefono, numero_plazas) 
VALUES ('HTL014', 'Horizonte', 'Avenida de los Vientos 22', 'Buenos Aires', '1156781234', 140);

INSERT INTO hotel (codigo_hotel, nombre_hotel, direccion, ciudad, telefono, numero_plazas) 
VALUES ('HTL015', 'Roca Marina', 'Calle del Puerto 12', 'Lisboa', '213987654', 230);
COMMIT;
SELECT * FROM hotel;


INSERT INTO sucursal (codigo_sucursal, direccion, telefono) 
VALUES ('SUC001', 'Avenida Libertad 123, Zona 1', '22345678');

INSERT INTO sucursal (codigo_sucursal, direccion, telefono) 
VALUES ('SUC002', 'Calle Reforma 45, Colonia Centro', '22547896');

INSERT INTO sucursal (codigo_sucursal, direccion, telefono) 
VALUES ('SUC003', 'Boulevard de Los H�roes 987, Zona 3', '23674589');

INSERT INTO sucursal (codigo_sucursal, direccion, telefono) 
VALUES ('SUC004', 'Calle Principal 120, Zona 7', '23784650');

INSERT INTO sucursal (codigo_sucursal, direccion, telefono) 
VALUES ('SUC005', 'Avenida del Sol 67, Zona 5', '23128945');

INSERT INTO sucursal (codigo_sucursal, direccion, telefono) 
VALUES ('SUC006', 'Calle Las Flores 50, Colonia Jardines', '23984756');

INSERT INTO sucursal (codigo_sucursal, direccion, telefono) 
VALUES ('SUC007', 'Avenida Las Am�ricas 90, Zona 9', '24358769');

INSERT INTO sucursal (codigo_sucursal, direccion, telefono) 
VALUES ('SUC008', 'Boulevard Miraflores 10, Zona 11', '24125678');

INSERT INTO sucursal (codigo_sucursal, direccion, telefono) 
VALUES ('SUC009', 'Calle Mariscal 89, Zona 10', '22438976');

INSERT INTO sucursal (codigo_sucursal, direccion, telefono) 
VALUES ('SUC010', 'Avenida Petapa 78, Zona 12', '24235678');

INSERT INTO sucursal (codigo_sucursal, direccion, telefono) 
VALUES ('SUC011', 'Calle Santander 65, Zona 13', '24567892');

INSERT INTO sucursal (codigo_sucursal, direccion, telefono) 
VALUES ('SUC012', 'Avenida Reforma 33, Zona 4', '23894567');

INSERT INTO sucursal (codigo_sucursal, direccion, telefono) 
VALUES ('SUC013', 'Calle Dorada 112, Zona 6', '23356789');

INSERT INTO sucursal (codigo_sucursal, direccion, telefono) 
VALUES ('SUC014', 'Avenida La Paz 50, Zona 8', '22785678');

INSERT INTO sucursal (codigo_sucursal, direccion, telefono) 
VALUES ('SUC015', 'Calle Aurora 45, Colonia Aurora', '23987543');
COMMIT;


INSERT INTO vuelo (numero_vuelo, nombre_aerolinea, fecha, hora, origne, destino, plazas_totales, plazas_clase_turista) 
VALUES (1001, 'Air Europa', TO_DATE('2024-10-15', 'YYYY-MM-DD'), '14:30', 'Madrid', 'New York', 180, 120);

INSERT INTO vuelo (numero_vuelo, nombre_aerolinea, fecha, hora, origne, destino, plazas_totales, plazas_clase_turista) 
VALUES (1002, 'Iberia', TO_DATE('2024-11-01', 'YYYY-MM-DD'), '08:00', 'Barcelona', 'London', 160, 110);

INSERT INTO vuelo (numero_vuelo, nombre_aerolinea, fecha, hora, origne, destino, plazas_totales, plazas_clase_turista) 
VALUES (1003, 'Delta Airlines', TO_DATE('2024-09-22', 'YYYY-MM-DD'), '18:45', 'Los Angeles', 'Tokyo', 240, 150);

INSERT INTO vuelo (numero_vuelo, nombre_aerolinea, fecha, hora, origne, destino, plazas_totales, plazas_clase_turista) 
VALUES (1004, 'LATAM', TO_DATE('2024-12-05', 'YYYY-MM-DD'), '11:15', 'Santiago', 'Buenos Aires', 130, 90);

INSERT INTO vuelo (numero_vuelo, nombre_aerolinea, fecha, hora, origne, destino, plazas_totales, plazas_clase_turista) 
VALUES (1005, 'Aerom�xico', TO_DATE('2024-11-18', 'YYYY-MM-DD'), '07:30', 'Ciudad de M�xico', 'Miami', 190, 140);

INSERT INTO vuelo (numero_vuelo, nombre_aerolinea, fecha, hora, origne, destino, plazas_totales, plazas_clase_turista) 
VALUES (1006, 'KLM', TO_DATE('2024-09-30', 'YYYY-MM-DD'), '22:00', 'Amsterdam', 'Dubai', 220, 160);

INSERT INTO vuelo (numero_vuelo, nombre_aerolinea, fecha, hora, origne, destino, plazas_totales, plazas_clase_turista) 
VALUES (1007, 'United Airlines', TO_DATE('2024-10-22', 'YYYY-MM-DD'), '12:45', 'Chicago', 'Paris', 250, 170);

INSERT INTO vuelo (numero_vuelo, nombre_aerolinea, fecha, hora, origne, destino, plazas_totales, plazas_clase_turista) 
VALUES (1008, 'Qantas', TO_DATE('2024-12-20', 'YYYY-MM-DD'), '09:00', 'Sydney', 'Los Angeles', 270, 180);

INSERT INTO vuelo (numero_vuelo, nombre_aerolinea, fecha, hora, origne, destino, plazas_totales, plazas_clase_turista) 
VALUES (1009, 'British Airways', TO_DATE('2024-10-01', 'YYYY-MM-DD'), '15:15', 'London', 'Johannesburg', 230, 150);

INSERT INTO vuelo (numero_vuelo, nombre_aerolinea, fecha, hora, origne, destino, plazas_totales, plazas_clase_turista) 
VALUES (1010, 'Air Canada', TO_DATE('2024-11-03', 'YYYY-MM-DD'), '17:00', 'Toronto', 'Vancouver', 180, 130);

INSERT INTO vuelo (numero_vuelo, nombre_aerolinea, fecha, hora, origne, destino, plazas_totales, plazas_clase_turista) 
VALUES (1011, 'Lufthansa', TO_DATE('2024-09-25', 'YYYY-MM-DD'), '19:30', 'Frankfurt', 'Madrid', 220, 160);

INSERT INTO vuelo (numero_vuelo, nombre_aerolinea, fecha, hora, origne, destino, plazas_totales, plazas_clase_turista) 
VALUES (1012, 'Turkish Airlines', TO_DATE('2024-10-17', 'YYYY-MM-DD'), '13:00', 'Istanbul', 'Rome', 210, 150);

INSERT INTO vuelo (numero_vuelo, nombre_aerolinea, fecha, hora, origne, destino, plazas_totales, plazas_clase_turista) 
VALUES (1013, 'Alitalia', TO_DATE('2024-11-12', 'YYYY-MM-DD'), '06:45', 'Rome', 'Athens', 170, 120);

INSERT INTO vuelo (numero_vuelo, nombre_aerolinea, fecha, hora, origne, destino, plazas_totales, plazas_clase_turista) 
VALUES (1014, 'Emirates', TO_DATE('2024-12-15', 'YYYY-MM-DD'), '20:00', 'Dubai', 'Singapore', 300, 200);

INSERT INTO vuelo (numero_vuelo, nombre_aerolinea, fecha, hora, origne, destino, plazas_totales, plazas_clase_turista) 
VALUES (1015, 'Qatar Airways', TO_DATE('2024-10-29', 'YYYY-MM-DD'), '10:30', 'Doha', 'New York', 260, 180);
COMMIT;



ALTER TABLE turista_vuelo MODIFY (codigo_turista CHAR(10));


INSERT INTO turista (codigo_turista, primer_nombre, segundo_nombre, tercer_nombre, primer_apellido, segundo_apellido, direccion, numero_vuelo, codigo_sucursal, codigo_hotel) 
VALUES ('TUR001', 'Juan', 'Carlos', NULL, 'Garc�a', 'L�pez', 'Avenida Central 123', 1001, 'SUC001', 'HTL001');

INSERT INTO turista (codigo_turista, primer_nombre, segundo_nombre, tercer_nombre, primer_apellido, segundo_apellido, direccion, numero_vuelo, codigo_sucursal, codigo_hotel) 
VALUES ('TUR002', 'Mar�a', 'Isabel', NULL, 'Hern�ndez', 'Mart�nez', 'Calle Principal 45', 1002, 'SUC002', 'HTL001');

INSERT INTO turista (codigo_turista, primer_nombre, segundo_nombre, tercer_nombre, primer_apellido, segundo_apellido, direccion, numero_vuelo, codigo_sucursal, codigo_hotel) 
VALUES ('TUR003', 'Pedro', NULL, NULL, 'P�rez', 'G�mez', 'Boulevard del Norte 67', 1003, 'SUC003', 'HTL002');

INSERT INTO turista (codigo_turista, primer_nombre, segundo_nombre, tercer_nombre, primer_apellido, segundo_apellido, direccion, numero_vuelo, codigo_sucursal, codigo_hotel) 
VALUES ('TUR004', 'Ana', 'Luc�a', NULL, 'Ram�rez', 'Rodr�guez', 'Calle Las Rosas 89', 1004, 'SUC001', 'HTL004');

INSERT INTO turista (codigo_turista, primer_nombre, segundo_nombre, tercer_nombre, primer_apellido, segundo_apellido, direccion, numero_vuelo, codigo_sucursal, codigo_hotel) 
VALUES ('TUR005', 'Luis', 'Fernando', 'Alberto', 'Torres', 'Morales', 'Avenida de la Paz 50', 1005, 'SUC002', 'HTL008');

INSERT INTO turista (codigo_turista, primer_nombre, segundo_nombre, tercer_nombre, primer_apellido, segundo_apellido, direccion, numero_vuelo, codigo_sucursal, codigo_hotel) 
VALUES ('TUR006', 'Sof�a', 'Andrea', NULL, 'L�pez', 'Castillo', 'Calle Dorada 33', 1006, 'SUC001', 'HTL001');

INSERT INTO turista (codigo_turista, primer_nombre, segundo_nombre, tercer_nombre, primer_apellido, segundo_apellido, direccion, numero_vuelo, codigo_sucursal, codigo_hotel) 
VALUES ('TUR007', 'Diego', NULL, NULL, 'Ruiz', 'Fern�ndez', 'Avenida Las Flores 78', 1007, 'SUC007', 'HTL007');

INSERT INTO turista (codigo_turista, primer_nombre, segundo_nombre, tercer_nombre, primer_apellido, segundo_apellido, direccion, numero_vuelo, codigo_sucursal, codigo_hotel) 
VALUES ('TUR008', 'Carmen', 'Elena', NULL, 'V�squez', 'P�rez', 'Boulevard Am�rica 25', 1008, 'SUC008', 'HTL008');

INSERT INTO turista (codigo_turista, primer_nombre, segundo_nombre, tercer_nombre, primer_apellido, segundo_apellido, direccion, numero_vuelo, codigo_sucursal, codigo_hotel) 
VALUES ('TUR0009', 'Ricardo', NULL, NULL, 'Mendoza', 'Garc�a', 'Calle Real 56', 1009, 'SUC009', 'HTL009');

INSERT INTO turista (codigo_turista, primer_nombre, segundo_nombre, tercer_nombre, primer_apellido, segundo_apellido, direccion, numero_vuelo, codigo_sucursal, codigo_hotel) 
VALUES ('TUR0010', 'Laura', 'Beatriz', NULL, 'Navarro', 'Ortega', 'Avenida Primavera 12', 1010, 'SUC002', 'HTL001');

INSERT INTO turista (codigo_turista, primer_nombre, segundo_nombre, tercer_nombre, primer_apellido, segundo_apellido, direccion, numero_vuelo, codigo_sucursal, codigo_hotel) 
VALUES ('TUR0011', 'Roberto', 'Javier', 'Luis', 'Hidalgo', 'Reyes', 'Calle Nueva 34', 1011, 'SUC001', 'HTL002');

INSERT INTO turista (codigo_turista, primer_nombre, segundo_nombre, tercer_nombre, primer_apellido, segundo_apellido, direccion, numero_vuelo, codigo_sucursal, codigo_hotel) 
VALUES ('TUR0012', 'Gabriela', 'Paola', NULL, 'Santos', 'Jim�nez', 'Avenida Reforma 90', 1012, 'SUC010', 'HTL002');

INSERT INTO turista (codigo_turista, primer_nombre, segundo_nombre, tercer_nombre, primer_apellido, segundo_apellido, direccion, numero_vuelo, codigo_sucursal, codigo_hotel) 
VALUES ('TUR0013', 'Jos�', 'Miguel', NULL, 'Mart�nez', 'Gonz�lez', 'Calle Verde 65', 1013, 'SUC001', 'HTL004');

INSERT INTO turista (codigo_turista, primer_nombre, segundo_nombre, tercer_nombre, primer_apellido, segundo_apellido, direccion, numero_vuelo, codigo_sucursal, codigo_hotel) 
VALUES ('TUR0014', 'M�nica', 'Estela', NULL, 'Villanueva', 'Serrano', 'Boulevard Centro 45', 1014, 'SUC004', 'HTL002');

INSERT INTO turista (codigo_turista, primer_nombre, segundo_nombre, tercer_nombre, primer_apellido, segundo_apellido, direccion, numero_vuelo, codigo_sucursal, codigo_hotel) 
VALUES ('TUR0015', 'Jorge', 'Daniel', NULL, 'Alvarado', 'Ram�rez', 'Avenida Sur 98', 1015, 'SUC015', 'HTL015');
COMMIT;




INSERT INTO turista_vuelo (codigo_turista_vuelo, codigo_turista, numero_vuelo, codigo_clase) 
VALUES ('TV001', 'TUR001', 1001, 'CV01');

INSERT INTO turista_vuelo (codigo_turista_vuelo, codigo_turista, numero_vuelo, codigo_clase) 
VALUES ('TV002', 'TUR002', 1002, 'CV02');

INSERT INTO turista_vuelo (codigo_turista_vuelo, codigo_turista, numero_vuelo, codigo_clase) 
VALUES ('TV003', 'TUR003', 1003, 'CV01');

INSERT INTO turista_vuelo (codigo_turista_vuelo, codigo_turista, numero_vuelo, codigo_clase) 
VALUES ('TV004', 'TUR004', 1004, 'CV02');

INSERT INTO turista_vuelo (codigo_turista_vuelo, codigo_turista, numero_vuelo, codigo_clase) 
VALUES ('TV005', 'TUR005', 1001, 'CV01'); 

INSERT INTO turista_vuelo (codigo_turista_vuelo, codigo_turista, numero_vuelo, codigo_clase) 
VALUES ('TV006', 'TUR006', 1002, 'CV02'); 

INSERT INTO turista_vuelo (codigo_turista_vuelo, codigo_turista, numero_vuelo, codigo_clase) 
VALUES ('TV007', 'TUR007', 1005, 'CV01');

INSERT INTO turista_vuelo (codigo_turista_vuelo, codigo_turista, numero_vuelo, codigo_clase) 
VALUES ('TV008', 'TUR008', 1006, 'CV02');

INSERT INTO turista_vuelo (codigo_turista_vuelo, codigo_turista, numero_vuelo, codigo_clase) 
VALUES ('TV009', 'TUR0009', 1001, 'CV02'); 

INSERT INTO turista_vuelo (codigo_turista_vuelo, codigo_turista, numero_vuelo, codigo_clase) 
VALUES ('TV0010', 'TUR0010', 1003, 'CV01'); 

INSERT INTO turista_vuelo (codigo_turista_vuelo, codigo_turista, numero_vuelo, codigo_clase) 
VALUES ('TV0011', 'TUR0011', 1005, 'CV02'); 

INSERT INTO turista_vuelo (codigo_turista_vuelo, codigo_turista, numero_vuelo, codigo_clase) 
VALUES ('TV000012', 'TUR0012', 1007, 'CV01');

INSERT INTO turista_vuelo (codigo_turista_vuelo, codigo_turista, numero_vuelo, codigo_clase) 
VALUES ('TV0013', 'TUR0013', 1004, 'CV01'); 

INSERT INTO turista_vuelo (codigo_turista_vuelo, codigo_turista, numero_vuelo, codigo_clase) 
VALUES ('TV0014', 'TUR0014', 1001, 'CV02'); 

INSERT INTO turista_vuelo (codigo_turista_vuelo, codigo_turista, numero_vuelo, codigo_clase) 
VALUES ('TV0015', 'TUR0015', 1002, 'CV01'); 
COMMIT;


INSERT INTO telefono (codigo_telefono, prefijo_telefono, numero_telefono, codigo_turista) 
VALUES ('TEL001', '+502', '12345678', 'TUR001');

INSERT INTO telefono (codigo_telefono, prefijo_telefono, numero_telefono, codigo_turista) 
VALUES ('TEL002', '+502', '87654321', 'TUR002');

INSERT INTO telefono (codigo_telefono, prefijo_telefono, numero_telefono, codigo_turista) 
VALUES ('TEL003', '+502', '23456789', 'TUR003');

INSERT INTO telefono (codigo_telefono, prefijo_telefono, numero_telefono, codigo_turista) 
VALUES ('TEL004', '+502', '98765432', 'TUR004');

INSERT INTO telefono (codigo_telefono, prefijo_telefono, numero_telefono, codigo_turista) 
VALUES ('TEL005', '+502', '34567890', 'TUR005');

INSERT INTO telefono (codigo_telefono, prefijo_telefono, numero_telefono, codigo_turista) 
VALUES ('TEL000006', '+502', '87654322', 'TUR006');

INSERT INTO telefono (codigo_telefono, prefijo_telefono, numero_telefono, codigo_turista) 
VALUES ('TEL007', '+502', '45678901', 'TUR007');

INSERT INTO telefono (codigo_telefono, prefijo_telefono, numero_telefono, codigo_turista) 
VALUES ('TEL008', '+502', '76543210', 'TUR008');

INSERT INTO telefono (codigo_telefono, prefijo_telefono, numero_telefono, codigo_turista) 
VALUES ('TEL009', '+508', '56789012', 'TUR0009');

INSERT INTO telefono (codigo_telefono, prefijo_telefono, numero_telefono, codigo_turista) 
VALUES ('TEL010', '+505', '65432109', 'TUR0010');

INSERT INTO telefono (codigo_telefono, prefijo_telefono, numero_telefono, codigo_turista) 
VALUES ('TEL011', '+502', '67890123', 'TUR0011');
commit;
INSERT INTO telefono (codigo_telefono, prefijo_telefono, numero_telefono, codigo_turista) 
VALUES ('TEL012', '+503', '78901234', 'TUR0012');

INSERT INTO telefono (codigo_telefono, prefijo_telefono, numero_telefono, codigo_turista) 
VALUES ('TEL013', '+504', '89012345', 'TUR0013');

INSERT INTO telefono (codigo_telefono, prefijo_telefono, numero_telefono, codigo_turista) 
VALUES ('TEL014', '+503', '90123456', 'TUR0014');

INSERT INTO telefono (codigo_telefono, prefijo_telefono, numero_telefono, codigo_turista) 
VALUES ('TEL015', '+502', '01234567', 'TUR0015');

COMMIT;

INSERT INTO correo_electronico (codigo_correo, correo, codigo_turista) 
VALUES ('COR001', 'turista01@example.com', 'TUR001');

INSERT INTO correo_electronico (codigo_correo, correo, codigo_turista) 
VALUES ('COR002', 'turista02@example.com', 'TUR002');

INSERT INTO correo_electronico (codigo_correo, correo, codigo_turista) 
VALUES ('COR003', 'turista03@example.com', 'TUR003');

INSERT INTO correo_electronico (codigo_correo, correo, codigo_turista) 
VALUES ('COR004', 'turista04@example.com', 'TUR004');

INSERT INTO correo_electronico (codigo_correo, correo, codigo_turista) 
VALUES ('COR005', 'turista05@example.com', 'TUR005');

INSERT INTO correo_electronico (codigo_correo, correo, codigo_turista) 
VALUES ('COR006', 'turista06@example.com', 'TUR006');

INSERT INTO correo_electronico (codigo_correo, correo, codigo_turista) 
VALUES ('COR007', 'turista07@example.com', 'TUR007');

INSERT INTO correo_electronico (codigo_correo, correo, codigo_turista) 
VALUES ('COR008', 'turista08@example.com', 'TUR008');

INSERT INTO correo_electronico (codigo_correo, correo, codigo_turista) 
VALUES ('COR009', 'turista09@example.com', 'TUR0009');

INSERT INTO correo_electronico (codigo_correo, correo, codigo_turista) 
VALUES ('COR0010', 'turista10@example.com', 'TUR0010');

INSERT INTO correo_electronico (codigo_correo, correo, codigo_turista) 
VALUES ('COR0011', 'turista11@example.com', 'TUR0011');

INSERT INTO correo_electronico (codigo_correo, correo, codigo_turista) 
VALUES ('COR0012', 'turista12@example.com', 'TUR0012');

INSERT INTO correo_electronico (codigo_correo, correo, codigo_turista) 
VALUES ('COR0013', 'turista13@example.com', 'TUR0013');

INSERT INTO correo_electronico (codigo_correo, correo, codigo_turista) 
VALUES ('COR0014', 'turista14@example.com', 'TUR0014');

INSERT INTO correo_electronico (codigo_correo, correo, codigo_turista) 
VALUES ('COR0015', 'turista15@example.com', 'TUR0015');
COMMIT;


ALTER TABLE correo_electronico MODIFY (correo VARCHAR2(50));


INSERT INTO hospedaje (codigo_hospedaje, fecha_llegada, fecha_partida, codigo_hotel, codigo_turista, codigo_regimen) 
VALUES ('HOS001', TO_DATE('2024-10-01', 'YYYY-MM-DD'), TO_DATE('2024-10-05', 'YYYY-MM-DD'), 'HTL001', 'TUR001', 'REG01');

INSERT INTO hospedaje (codigo_hospedaje, fecha_llegada, fecha_partida, codigo_hotel, codigo_turista, codigo_regimen) 
VALUES ('HOS002', TO_DATE('2024-10-02', 'YYYY-MM-DD'), TO_DATE('2024-10-06', 'YYYY-MM-DD'), 'HTL002', 'TUR002', 'REG02');

INSERT INTO hospedaje (codigo_hospedaje, fecha_llegada, fecha_partida, codigo_hotel, codigo_turista, codigo_regimen) 
VALUES ('HOS003', TO_DATE('2024-10-03', 'YYYY-MM-DD'), TO_DATE('2024-10-07', 'YYYY-MM-DD'), 'HTL002', 'TUR003', 'REG01');

INSERT INTO hospedaje (codigo_hospedaje, fecha_llegada, fecha_partida, codigo_hotel, codigo_turista, codigo_regimen) 
VALUES ('HOS004', TO_DATE('2024-10-04', 'YYYY-MM-DD'), TO_DATE('2024-10-08', 'YYYY-MM-DD'), 'HTL002', 'TUR000004', 'REG02');

INSERT INTO hospedaje (codigo_hospedaje, fecha_llegada, fecha_partida, codigo_hotel, codigo_turista, codigo_regimen) 
VALUES ('HOS005', TO_DATE('2024-10-05', 'YYYY-MM-DD'), TO_DATE('2024-10-09', 'YYYY-MM-DD'), 'HTL002', 'TUR005', 'REG01');

INSERT INTO hospedaje (codigo_hospedaje, fecha_llegada, fecha_partida, codigo_hotel, codigo_turista, codigo_regimen) 
VALUES ('HOS006', TO_DATE('2024-10-06', 'YYYY-MM-DD'), TO_DATE('2024-10-10', 'YYYY-MM-DD'), 'HTL001', 'TUR000006', 'REG02');

INSERT INTO hospedaje (codigo_hospedaje, fecha_llegada, fecha_partida, codigo_hotel, codigo_turista, codigo_regimen) 
VALUES ('HOS007', TO_DATE('2024-10-07', 'YYYY-MM-DD'), TO_DATE('2024-10-11', 'YYYY-MM-DD'), 'HTL003', 'TUR007', 'REG01');

INSERT INTO hospedaje (codigo_hospedaje, fecha_llegada, fecha_partida, codigo_hotel, codigo_turista, codigo_regimen) 
VALUES ('HOS008', TO_DATE('2024-10-08', 'YYYY-MM-DD'), TO_DATE('2024-10-12', 'YYYY-MM-DD'), 'HTL004', 'TUR008', 'REG02');

INSERT INTO hospedaje (codigo_hospedaje, fecha_llegada, fecha_partida, codigo_hotel, codigo_turista, codigo_regimen) 
VALUES ('HOS009', TO_DATE('2024-10-09', 'YYYY-MM-DD'), TO_DATE('2024-10-13', 'YYYY-MM-DD'), 'HTL001', 'TUR0009', 'REG01');

INSERT INTO hospedaje (codigo_hospedaje, fecha_llegada, fecha_partida, codigo_hotel, codigo_turista, codigo_regimen) 
VALUES ('HOS010', TO_DATE('2024-10-10', 'YYYY-MM-DD'), TO_DATE('2024-10-14', 'YYYY-MM-DD'), 'HTL002', 'TUR0011', 'REG02');

INSERT INTO hospedaje (codigo_hospedaje, fecha_llegada, fecha_partida, codigo_hotel, codigo_turista, codigo_regimen) 
VALUES ('HOS011', TO_DATE('2024-10-11', 'YYYY-MM-DD'), TO_DATE('2024-10-15', 'YYYY-MM-DD'), 'HTL003', 'TUR0011', 'REG01');
COMMIT;
INSERT INTO hospedaje (codigo_hospedaje, fecha_llegada, fecha_partida, codigo_hotel, codigo_turista, codigo_regimen) 
VALUES ('HOS012', TO_DATE('2024-10-12', 'YYYY-MM-DD'), TO_DATE('2024-10-16', 'YYYY-MM-DD'), 'HTL004', 'TUR0012', 'REG02');

INSERT INTO hospedaje (codigo_hospedaje, fecha_llegada, fecha_partida, codigo_hotel, codigo_turista, codigo_regimen) 
VALUES ('HOS013', TO_DATE('2024-10-13', 'YYYY-MM-DD'), TO_DATE('2024-10-17', 'YYYY-MM-DD'), 'HTL001', 'TUR0013', 'REG01');

INSERT INTO hospedaje (codigo_hospedaje, fecha_llegada, fecha_partida, codigo_hotel, codigo_turista, codigo_regimen) 
VALUES ('HOS014', TO_DATE('2024-10-14', 'YYYY-MM-DD'), TO_DATE('2024-10-18', 'YYYY-MM-DD'), 'HTL002', 'TUR0014', 'REG02');

INSERT INTO hospedaje (codigo_hospedaje, fecha_llegada, fecha_partida, codigo_hotel, codigo_turista, codigo_regimen) 
VALUES ('HOS015', TO_DATE('2024-10-15', 'YYYY-MM-DD'), TO_DATE('2024-10-19', 'YYYY-MM-DD'), 'HTL003', 'TUR0015', 'REG01');
COMMIT;

INSERT INTO turista_sucursal (codigo_turista_sucursal, codigo_sucursal, codigo_turista) 
VALUES ('TUS01', 'SUC001', 'TUR001');

INSERT INTO turista_sucursal (codigo_turista_sucursal, codigo_sucursal, codigo_turista) 
VALUES ('TUS02', 'SUC002', 'TUR002');

INSERT INTO turista_sucursal (codigo_turista_sucursal, codigo_sucursal, codigo_turista) 
VALUES ('TUS03', 'SUC003', 'TUR003');

INSERT INTO turista_sucursal (codigo_turista_sucursal, codigo_sucursal, codigo_turista) 
VALUES ('TUS04', 'SUC004', 'TUR004');

INSERT INTO turista_sucursal (codigo_turista_sucursal, codigo_sucursal, codigo_turista) 
VALUES ('TUS05', 'SUC001', 'TUR005');

INSERT INTO turista_sucursal (codigo_turista_sucursal, codigo_sucursal, codigo_turista) 
VALUES ('TUS06', 'SUC002', 'TUR006');

INSERT INTO turista_sucursal (codigo_turista_sucursal, codigo_sucursal, codigo_turista) 
VALUES ('TUS07', 'SUC003', 'TUR007');

INSERT INTO turista_sucursal (codigo_turista_sucursal, codigo_sucursal, codigo_turista) 
VALUES ('TUS08', 'SUC004', 'TUR008');

INSERT INTO turista_sucursal (codigo_turista_sucursal, codigo_sucursal, codigo_turista) 
VALUES ('TUS09', 'SUC001', 'TUR0009');

INSERT INTO turista_sucursal (codigo_turista_sucursal, codigo_sucursal, codigo_turista) 
VALUES ('TUS010', 'SUC002', 'TUR0010');

INSERT INTO turista_sucursal (codigo_turista_sucursal, codigo_sucursal, codigo_turista) 
VALUES ('TUS011', 'SUC003', 'TUR0011');

INSERT INTO turista_sucursal (codigo_turista_sucursal, codigo_sucursal, codigo_turista) 
VALUES ('TUS012', 'SUC004', 'TUR0012');

INSERT INTO turista_sucursal (codigo_turista_sucursal, codigo_sucursal, codigo_turista) 
VALUES ('TUS013', 'SUC001', 'TUR0013');

INSERT INTO turista_sucursal (codigo_turista_sucursal, codigo_sucursal, codigo_turista) 
VALUES ('TUS014', 'SUC002', 'TUR0014');

INSERT INTO turista_sucursal (codigo_turista_sucursal, codigo_sucursal, codigo_turista) 
VALUES ('TUS015', 'SUC003', 'TUR0015');
COMMIT;

SELECT * FROM TURISTA WHERE CODIGO_TURISTA = 'TUR002';

UPDATE TURISTA SET TERCER_NOMBRE = 'CASTRO' WHERE CODIGO_TURISTA = 'TUR002';
COMMIT;

SELECT * FROM TELEFONO;

DELETE FROM TELEFONO WHERE CODIGO_TELEFONO = 'TEL002';

--TURISTAS EN HOTEL DE CODIGO HTL002
SELECT T.CODIGO_TURISTA, T.PRIMER_NOMBRE, H.CODIGO_HOTEL FROM TURISTA T, HOTEL H WHERE H.CODIGO_HOTEL = T.CODIGO_HOTEL AND H.CODIGO_HOTEL = 'HTL002';

--TURISTAS QUE VIAJARON EN LA CLASE TURISTA CV02
SELECT DISTINCT T.CODIGO_TURISTA, T.PRIMER_NOMBRE, V.NOMBRE_AEROLINEA, CV.NOMBRE_CLASE FROM TURISTA T, VUELO V, TURISTA_VUELO TV, CLASE_VUELO CV WHERE T.NUMERO_VUELO = V.NUMERO_VUELO AND V.NUMERO_VUELO = TV.NUMERO_VUELO ADN TV.CODIGO_CLASE ? CV.CODIGO_CLASE AND CV.CODIGO_CLASE = 'CV02';


SELECT CODIGO_TURISTA AS CODIGO, PRIMER_NOMBRE, PRIMER_APELLIDO FROM TURISTA;


SELECT * FROM TURISTA WHERE CODIGO_TURISTA = 'TUR006';

UPDATE TURISTA SET TERCER_NOMBRE = 'CASTRO' WHERE CODIGO_TURISTA = 'TUR006';

SELECT * FROM TELEFONO;

DELETE FROM TELEFONO WHERE CODIGO_TELEFONO = 'TEL003';

SELECT CODIGO_TURISTA, PRIMER_NOMBRE AS NOMBRE, PRIMER_APELLIDO AS APELLIDO FROM TURISTA ORDER BY CODIGO_TURISTA DESC;

SELECT CODIGO_TURISTA, PRIMER_NOMBRE FROM TURISTA WHERE PRIMER_NOMBRE LIKE 'J%';

SELECT T.PRIMER_NOMBRE, T.PRIMER_APELLIDO  FROM TURISTA T WHERE T.CODIGO_SUCURSAL NOT IN ('SUC001', 'SUC002');


SELECT * FROM TURISTA;

SELECT PRIMER_NOMBRE AS NOMBRE, SEGUNDO_NOMBRE, TERCER_NOMBRE FROM TURISTA WHERE TERCER_NOMBRE IS NULL ORDER BY PRIMER_NOMBRE DESC;


SELECT T.PRIMER_NOMBRE AS NOMBRE, T.PRIMER_APELLIDO AS APELLIDO, H.NOMBRE_HOTEL 
FROM TURISTA T, HOTEL H WHERE T.CODIGO_HOTEL = H.CODIGO_HOTEL AND H.CODIGO_HOTEL = 'HTL002' ORDER BY T.PRIMER_NOMBRE DESC;

SELECT * FROM VUELO;
