-- Sebastian Ahern Ruiz
-- verificacion de Oracle SQL
-- https://livesql.oracle.com/apex/f?p=590:1:13033384664874::NO:RP::
-- Repositorio GitHub
--

--CREAR TABLA
CREATE TABLE PROPIEDAD
(
    nro_propiedad NUMBER(5),
    direccion_propiedad VARCHAR2(60) NOT NULL,
    superficie NUMBER(5,2) NOT NULL,
    nro_dormitorios NUMBER(1) DEFAULT 0,
    nro_banos NUMBER(1) DEFAULT 0, 
    valor_arriendo NUMBER(7) NOT NULL,
    valor_gasto_comun NUMBER(6) NOT NULL,
    id_tipo_propiedad NUMBER(4) NOT NULL,
    id_comuna NUMBER(4) NOT NULL,
    numrut_prop NUMBER(15) NOT NULL,
    numrut_empl NUMBER(15) NOT NULL,
    CONSTRAINT PK_PROPIEDAD PRIMARY KEY (nro_propiedad),
    CONSTRAINT FK_PROPIEDAD_TIPOPROP FOREIGN KEY (id_tipo_propiedad) REFERENCES TIPO_PROPIEDAD (id_tipo_propiedad),
    CONSTRAINT FK_PROP_NUMRUTPROP FOREIGN KEY (numrut_prop) REFERENCES PROPIETARIO (NUMRUT_PROP),
    CONSTRAINT FK_PROP_NUMRUTEMP FOREIGN KEY (NUMRUT_EMP) REFERENCES EMPLEADO (NUMRUT_EMP),
    CONSTRAINT FK_PROP_COMUNA FOREIGN KEY (ID_COMUNA) REFERENCES COMUNA (ID_COMUNA),
    CONSTRAINT CK_valor_arriendo CHECK (valor_arriendo < 250000000)),
    CONSTRAINT CK_valorgastocomun CHECK (valor_gasto_comun > 250000))
);
--Poblar tabla con datos
INSERT INTO PROPIEDAD (nro_propiedad,direccion_propiedad,superficie,nro_dormitorios,nro_banos, valor_arriendo,valor_gasto_comun,id_tipo_propiedad,id_comuna,numrut_prop,numrut_empl) VALUES(1006789,4,'Los chulengos #237', 90, 1, 1, 100000, 123,4,1006789,16756389);
INSERT INTO PROPIEDAD (nro_propiedad,direccion_propiedad,superficie,nro_dormitorios,nro_banos, valor_arriendo,valor_gasto_comun,id_tipo_propiedad,id_comuna,numrut_prop,numrut_empl) VALUES(12094829,5,'Los queltehues #237', 90, 1, 1, 100000, 123,4,1006789,16756389);

--CREAR TABLA
CREATE TABLE TIPO_PROPIEDAD 
(
    id_tipo_propiedad NUMBER(4),
    desc_tipo_propiedad VARCHAR2(30) NOT NULL,
    CONSTRAINT PK_TIPO_PROPIEDAD PRIMARY KEY (id_tipo_propiedad)
);
--Poblar tabla con datos
INSERT INTO TIPO_PROPIEDAD (id_tipo_propiedad, desc_tipo_propiedad) VALUES (1,'Casa');
INSERT INTO TIPO_PROPIEDAD (id_tipo_propiedad, desc_tipo_propiedad) VALUES (2,'Departamento');
INSERT INTO TIPO_PROPIEDAD (id_tipo_propiedad, desc_tipo_propiedad) VALUES (3,'Oficina');
INSERT INTO TIPO_PROPIEDAD (id_tipo_propiedad, desc_tipo_propiedad) VALUES (4,'Parcela');
INSERT INTO TIPO_PROPIEDAD (id_tipo_propiedad, desc_tipo_propiedad) VALUES (4,'Estacionamiento');

--CREAR TABLA
CREATE TABLE PROPIETARIO 
(
    NUMRUT_PROP NUMBER(10),
    DVRUT_PROP NUMBER(1) NOT NULL,
    APPATERNO_PROP VARCHAR2(15) NOT NULL,
    APMATERNO_PROP VARCHAR2(15) NOT NULL,
    NOMBRE_PROP VARCHAR2(50) NOT NULL,
    DIRECCION_PROP VARCHAR2(60) NOT NULL,
    FONOFIJO_PROP NUMBER(15) DEFAULT 0,
    CELULAR_PROP NUMBER(15) DEFAULT 0,
    CONSTRAINT PK_PROPIETARIO PRIMARY KEY (NUMRUT_PROP)
);
--Poblar tabla con datos
INSERT INTO PROPIETARIO (NUMRUT_PROP,DVRUT_PROP,APPATERNO_PROP,APMATERNO_PROP,NOMBRE_PROP,DIRECCION_PROP,FONOFIJO_PROP, CELULAR_PROP) VALUES(1006789,4,'Aguila', 'Arias', 'Daniela', 'Los Jamones # 2345',0,0);
INSERT INTO PROPIETARIO (NUMRUT_PROP,DVRUT_PROP,APPATERNO_PROP,APMATERNO_PROP,NOMBRE_PROP,DIRECCION_PROP,FONOFIJO_PROP, CELULAR_PROP) VALUES(1006789,4,'Grooves', 'Stut', 'Karina', 'Los Arboles Verdes # 654', 612222324, 987968426);

--CREAR TABLA
CREATE TABLE IMPUESTO
(
    ID_IMPUESTO NUMBER (10),
    NUMRUT_EMP NUMBER (10),
    DVRUT_EMP NUMBER(1) NOT NULL,
    SUELDO_EMP_ENERO_MARZO NUMBER(10) NOT NULL,
    IMPTO_EMP_ENERO_MARZO NUMBER(8) NOT NULL,
    CONSTRAINT PK_IMPUESTO PRIMARY KEY (ID_IMPUESTO),
    CONSTRAINT FK_IMPUESTONUMRUT_EMP FOREIGN KEY (NUMRUT_EMP) REFERENCES EMPLEADO (NUMRUT_EMP)
);

--Poblar tabla con datos
INSERT INTO IMPUESTO (ID_IMPUESTO,NUMRUT_EMP,DVRUT_EMP,SUELDO_EMP_ENERO_MARZO,IMPTO_EMP_ENERO_MARZO) VALUES (1,13970885,7,750000,90000);
INSERT INTO IMPUESTO (ID_IMPUESTO,NUMRUT_EMP,DVRUT_EMP,SUELDO_EMP_ENERO_MARZO,IMPTO_EMP_ENERO_MARZO) VALUES (1,14728602,3,750000,90000);

--CREAR TABLA
CREATE TABLE EMPLEADO
(
    NUMRUT_EMP NUMBER(10),
    DVRUT_EMP NUMBER(1),
    APPATERNO_EMP VARCHAR2(15) NOT NULL,
    APMATERNO_EMP VARCHAR2(15) NOT NULL,
    NOMBRE_EMP VARCHAR2(50) NOT NULL,
    DIRECCION_EMP VARCHAR2(60) NOT NULL,
    FONOFIJO_EMP NUMBER(15),
    CELULAR_EMP NUMBER(15),
    FECHANAC_EMP DATE,
    FECHAING_EMP DATE DEFAULT SYSDATE,
    SUELDO_EMP NUMBER(7) NOT NULL,
    ID_CATEGORIA_EMP NUMBER(1) NOT NULL,
    ID_SUCURSAL NUMBER NOT NULL,
    CONSTRAINT PK_EMPLEADO PRIMARY KEY (NUMRUT_EMP)
    CONSTRAINT FK_EMP_IDCAT_EMP FOREIGN KEY (ID_CATEGORIA_EMP) REFERENCES CATEGORIA_EMPLEADO (ID_CATEGORIA_EMP)
    --CONSTRAINT FK_PROPIETARIO_NUMRUTPROP FOREIGN KEY (numrut_prop) REFERENCES PROPIETARIO (NUMRUT_PROP)
);

--Poblar tabla con datos
INSERT INTO EMPLEADO (NUMRUT_EMP,DVRUT_EMP,APPATERNO_EMP,APMATERNO_EMP,NOMBRE_EMP,DIRECCION_EMP,FONOFIJO_EMP,CELULAR_EMP,FECHANAC_EMP,FECHAING_EMP,SUELDO_EMP,ID_CATEGORIA_EMP,ID_SUCURSAL) VALUES (19570885,7,'AHERN','BORGENSON','SEBASTIAN','CROACIA # 4582',612233454,968302502,'03-FEB-1991','01-JAN-2021',750000,1,1);
INSERT INTO EMPLEADO (NUMRUT_EMP,DVRUT_EMP,APPATERNO_EMP,APMATERNO_EMP,NOMBRE_EMP,DIRECCION_EMP,FONOFIJO_EMP,CELULAR_EMP,FECHANAC_EMP,FECHAING_EMP,SUELDO_EMP,ID_CATEGORIA_EMP,ID_SUCURSAL) VALUES (19570885,7,'VILICIC','BOCACIC','DUSAN','BELGICA # 3456',614683454,968345732,'03-FEB-1999','01-JAN-2021',750000,1,1);

--CREAR TABLA
CREATE TABLE ARRIENDO_PROPIEDAD
(
    ID_ARRIENDO NUMBER (10),
    NRO_PROPIEDAD NUMBER (10),
    NUMRUT_CLI NUMBER(10),
    FECINI_ARRIENDO DATE,
    FECTER_ARRIENDO DATE,
    CONSTRAINT FK_ARRPRO FOREIGN KEY (NUMRUT_CLI) REFERENCES CLIENTE (NUMRUT_PROP)
);

INSERT INTO ARRIENDO_PROPIEDAD (NRO_PROPIEDAD, NUMRUT_CLI, FECINI_ARRIENDO, FECTER_ARRIENDO) VALUES (997,19678389,'09-22-2021','01-JAN-2021');
INSERT INTO ARRIENDO_PROPIEDAD (NRO_PROPIEDAD, NUMRUT_CLI, FECINI_ARRIENDO, FECTER_ARRIENDO) VALUES (998,12678989,'09-22-2019','09-FEB-2022');

CREATE TABLE COMUNA
(
	ID_COMUNA NUMBER,
	NOMBRE_COMUNA VARCHAR2(30),
	CONSTRAINT PK_COMUNA PRIMARY KEY (ID_COMUNA)
);

INSERT INTO COMUNA VALUES (1,'Santiago');
INSERT INTO COMUNA VALUES (2,'Macul');
INSERT INTO COMUNA VALUES (3,'San Joaquin');
INSERT INTO COMUNA VALUES (4,'Concepcion');
INSERT INTO COMUNA VALUES (5,'Copiapo');
INSERT INTO COMUNA VALUES (6,'Punta Arenas');

CREATE TABLE SUCURSAL
(
	ID_SUCURSAL NUMBER,
	NOMBRE_SUCURSAL VARCHAR2(30),
	CONSTRAINT PK_SUCURSAL PRIMARY KEY (ID_SUCURSAL)
);

INSERT INTO SUCURSAL VALUES (1,'Santiago');
INSERT INTO SUCURSAL VALUES (2,'Macul');
INSERT INTO SUCURSAL VALUES (3,'San Joaquin');
INSERT INTO SUCURSAL VALUES (4,'Concepcion');
INSERT INTO SUCURSAL VALUES (5,'Copiapo');
INSERT INTO SUCURSAL VALUES (6,'Punta Arenas');

CREATE TABLE CATEGORIA_EMPLEADO
(
	ID_CATEGORIA_EMP NUMBER,
	DESC_CATEGORIA_EMP VARCHAR2(30),
	CONSTRAINT PK_CATEGORIA_EMPLEADO PRIMARY KEY (ID_CATEGORIA_EMP)
);

INSERT INTO CATEGORIA_EMPLEADO VALUES (1,'Gerente');
INSERT INTO CATEGORIA_EMPLEADO VALUES (2,'Vendedor');
INSERT INTO CATEGORIA_EMPLEADO VALUES (3,'Administrador');
INSERT INTO CATEGORIA_EMPLEADO VALUES (4,'Jefe Sucursal');

CREATE TABLE CLIENTE
(
	NUMRUT_CLI NUMBER,
	DVRUT_CLI VARCHAR2(1),
	APPATERNO_CLI VARCHAR2(15),
	APMATERNO_CLI VARCHAR2(15),
	NOMBRE_CLI VARCHAR2(25),
	DIRECCION_CLI VARCHAR2(60),
	FONOFIJO_CLI NUMBER,
	CELULAR_CLI NUMBER,
	RENTA_CLI NUMBER,
	CONSTRAINT PK_CLIENTE PRIMARY KEY (NUMRUT_CLI)
);

INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (8820165,5,'Greene','Powell','Miriam','8656 Et, Avda.','56265488035','56937131350',1604676);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (8101771,5,'Wall','Garrison','Holly','Apdo.:4025135 Cras Ctra.','56257346094','56940204717',2404616);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (3137577,2,'Sanford','Harding','Baxter','Apdo.:4322569 Libero. Avenida','56223105297','56967949998',877054);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (6185203,6,'Lester','Boyd','Karleigh','Apdo.:2981966 Integer C/','56292882666','56985402588',4435584);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (4960216,9,'Cunningham','Dean','Kevin','Apartado núm.: 955, 3160 Mauris Av.','56262568448','56966348413',2824309);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (4499674,5,'Mcfadden','Castro','Cruz','Apdo.:163-3697 Nisi Avda.','56295972244','56932225399',4711947);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (5635284,2,'Anderson','Larson','Burke','Apdo.:451-8723 Turpis. Carretera','56263881224','56968342329',3266899);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (7000416,2,'Levy','Campos','Cheyenne','Apdo.:733-7112 Adipiscing Carretera','56233425646','56903327893',2020823);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (8940960,2,'Vaughan','Obrien','Mara','184 Id, Avda.','56256671722','56958647159',3156582);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (9375824,7,'Little','Delacruz','Tatum','Apdo.:3643907 Ultricies Avda.','56239510054','56963497013',4252745);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (622947,6,'Drake','Glenn','Kay','1918 Ornare C/','56291279713','56989594152',3581336);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (4317514,7,'Lang','Barnes','Kaitlin','Apartado núm.: 348, 885 Amet Av.','56265320083','56978293622',3217060);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (9989457,9,'Caldwell','Sims','Timon','Apartado núm.: 423, 8508 Ligula ','56206118391','56988797243',3246529);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (2211247,7,'Deleon','Jefferson','Freya','Apdo.:6984850 Mattis. ','56257340072','56954734900',301456);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (7045873,8,'Heath','Chandler','Simon','Apdo.:606-1321 Consectetuer Av.','56204850958','56936757655',2742745);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (590506,8,'Galloway','Watson','Tad','Apdo.:986-5131 Purus. Ctra.','56211832617','56904579729',482277);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (8964588,7,'Malone','King','Reuben','Apartado núm.: 241, 6033 Sem Avda.','56294321288','56997196317',1356197);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (6507188,8,'Mcclure','Wong','Rebekah','431-3351 Dictum C.','56240867855','56936882662',3549709);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (8675031,7,'Bean','Riggs','Clayton','1433 Rhoncus. Avda.','56233131500','56961236173',4938073);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (5050000,4,'Donaldson','Rosales','Blaze','653-7815 Ut Carretera','56230975280','56900237255',3770828);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (987891,1,'Greer','Puckett','Armand','537-8531 Elit, C/','56207855798','56939445989',3629695);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (3161730,0,'Becker','Koch','Whitney','Apartado núm.: 237, 6346 Semper, Ctra.','56234680777','56996736648',365079);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (9117286,2,'Fields','Butler','Nash','Apdo.:937-4247 Justo C/','56298969594','56948828598',1022593);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (8004201,0,'Johnston','Cameron','Nero','815-7635 Est, C/','56227481533','56988646495',391460);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (6529199,6,'Hebert','Doyle','Patrick','6461 Diam Ctra.','56225252896','56954720885',3730756);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (8550499,4,'Hodge','Mcguire','Sage','964-9584 Enim. Carretera','56297226230','56938893910',2022210);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (4049902,2,'Browning','Haney','Lani','Apdo.:448-7076 Egestas, ','56259883477','56903195512',4535386);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (1448732,8,'England','Clarke','Kasper','Apdo.:813-8227 Cubilia C/','56250204911','56900997375',2747538);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (8833519,8,'Pruitt','Lane','Stephen','7932 Mi. Carretera','56230940672','56981136791',2686471);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (2805908,7,'Mendoza','Collins','Tate','Apartado núm.: 112, 7245 Interdum. Ctra.','56280701916','56981796423',294640);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (4056801,0,'Welch','Terrell','Kenneth','1898 Odio. C/','56270705471','56989375421',2725876);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (6370685,3,'Farley','Sandoval','Thor','1695 Quisque Ctra.','56289455066','56913945929',3551649);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (2094703,0,'Miles','Yates','Hermione','9331061 Eget Ctra.','56254789984','56928164561',1951772);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (2744097,6,'Washington','Buckner','September','111424 Ipsum Calle','56200735083','56936820449',1852475);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (3689453,4,'Cabrera','Cooper','Sheila','Apartado núm.: 752, 1818 Tempus Calle','56274794727','56936124826',4922313);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (9870894,6,'Holland','Shields','Shannon','Apartado núm.: 323, 8540 Nunc C.','56238872000','56926856736',4166274);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (1481696,8,'Sandoval','Wilkerson','Tate','120-7017 Mollis Ctra.','56270862826','56964829553',3681274);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (2461768,6,'Dawson','Pratt','Adrienne','871-2734 Sem Avenida','56255788527','56961336667',1237469);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (6806298,0,'Vang','Moran','Oliver','949 Dolor Calle','56226125107','56905244959',1977417);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (9256277,5,'Mcknight','Ortega','Nero','Apartado núm.: 275, 366 Ipsum Av.','56264388413','56948387113',3031617);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (7132574,5,'Clemons','Dalton','Cameron','Apdo.:785-1673 Mauris Av.','56256953655','56905377878',2634514);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (2023923,8,'Lowe','Hays','Octavius','Apdo.:911-6888 Erat Av.','56206657245','56945784495',4708413);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (446081,0,'Tanner','Meyer','Jana','2276 Arcu. ','56266520687','56929933908',4331145);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (8700538,4,'Monroe','Dejesus','Nicholas','Apdo.:9412736 Aliquam ','56250104385','56900486531',4144249);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (3513677,6,'Patterson','Greer','Serena','9727 Mi Ctra.','56280856297','56980859351',3935537);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (6468680,2,'Gilbert','Mcknight','Branden','Apartado núm.: 684, 5583 Luctus C/','56212482928','56903839160',4499407);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (1638918,7,'Gilmore','Keith','Sebastian','Apartado núm.: 830, 1711 Vestibulum Ctra.','56256160686','56947516196',3529310);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (9575495,1,'Byers','Reid','Chava','Apdo.:925-8191 Nunc Carretera','56228417485','56900721568',2834018);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (2040886,6,'Blevins','Pate','Demetria','9731 Adipiscing Calle','56244355406','56965663443',3104532);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (7971025,4,'Sanford','Flores','Echo','827-8882 Eget, Calle','56232734008','56943944910',1691726);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (8496982,8,'Moon','Payne','Nyssa','Apdo.:620-7337 Tristique Ctra.','56296880535','56952463745',1425797);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (7467003,7,'Dale','Martinez','Libby','2365 Vulputate Avda.','56259194732','56928979671',1568530);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (5016458,8,'Brady','Ratliff','Kirsten','1362053 Justo C/','56295914514','56936538619',4620195);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (9324225,9,'May','Oconnor','Guinevere','3359 Pellentesque Av.','56239260103','56918684749',1022765);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (7757548,3,'Greene','Romero','Madeson','Apartado núm.: 813, 7089 Arcu. Carretera','56257937357','56949749692',1122186);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (5182856,8,'Kelley','Contreras','Kirk','871-3524 Dolor Av.','56277297993','56913213726',908080);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (1933239,2,'Gilmore','Brennan','Luke','Apartado núm.: 842, 6379 Nunc. C/','56262193899','56916983462',2966904);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (9481592,8,'House','Harvey','Aurora','686-3238 Vitae Calle','56241263477','56956366084',2558918);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (3801820,7,'Cain','Oneil','Jonas','Apartado núm.: 239, 2927 Tristique Avda.','56285366653','56971290969',2322942);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (4474889,9,'Alvarado','Gilmore','Bethany','Apdo.:914-6635 Scelerisque C/','56254392815','56903993106',2484697);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (3952343,5,'Martinez','Sandoval','Nola','Apartado núm.: 639, 7081 Egestas Av.','56208504414','56930103428',1153587);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (2185853,9,'Lopez','Velasquez','Stacey','2434 Aliquam Avda.','56242849786','56934751740',1898475);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (361442,6,'Gonzales','Bruce','Cameran','2515410 Primis Carretera','56211644685','56989904907',2091624);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (7869690,9,'Griffin','Ferrell','Emma','Apartado núm.: 563, 2822 Aenean C.','56226983399','56929968287',892136);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (4913252,1,'Nolan','Rogers','Byron','Apartado núm.: 454, 1628 Lectus, C.','56267629198','56916421130',3480363);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (4449910,7,'Bartlett','Gillespie','Reed','8271 Nunc Calle','56203889880','56998563108',1258850);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (4765891,8,'Best','Fletcher','Basil','Apdo.:597-9781 Tristique Calle','56202834605','56907183950',1023095);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (4417293,6,'Pena','Kramer','Xavier','388 Nisl. Calle','56275683228','56983398373',490488);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (8222052,0,'Salazar','Foreman','Tyrone','Apdo.:120-6415 Nunc C/','56220160135','56901332594',2518473);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (3944207,3,'Sullivan','Miranda','Adrian','Apdo.:198-4879 Dolor. Av.','56213613497','56911830503',683852);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (9917755,6,'Norris','Melton','Hedley','Apartado núm.: 554, 359 Orci Carretera','56216910502','56966367848',3045570);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (9444900,4,'Figueroa','Moore','Xandra','820-9657 Quis, Avda.','56246970156','56959928647',2145625);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (2595958,5,'George','Ryan','Jared','Apartado núm.: 733, 6772 Eu ','56273116503','56921413508',4307844);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (9266879,0,'Le','Blevins','Keefe','226-9453 Et Av.','56276170652','56939631256',4429923);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (7842506,0,'Melton','Brooks','Declan','Apartado núm.: 194, 2490 Rhoncus. Avenida','56258775668','56934820663',1006596);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (7131547,9,'Conley','Velasquez','Jared','6864 Diam C.','56207642022','56976923781',941011);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (5047969,8,'Soto','Erickson','Regina','7663476 In Calle','56213679542','56904992588',3897286);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (5917811,4,'Gonzales','Rivera','Eaton','1857 Lectus Carretera','56210141878','56914270181',2079378);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (414839,3,'Holloway','Hickman','Channing','646-9526 Sociosqu Avda.','56275957040','56950749426',947466);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (3684545,5,'Reese','Reyes','Steven','2060 Varius. Av.','56295484742','56992867950',4638230);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (1340238,1,'Livingston','Figueroa','Whitney','Apdo.:956-2527 Risus. Avenida','56228169445','56969497720',2591402);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (8903847,4,'Lee','Waller','Xaviera','Apartado núm.: 990, 1168 Sit Av.','56234166725','56927325165',2015633);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (5974565,1,'Wilkinson','Suarez','Thomas','Apartado núm.: 266, 7179 Vehicula Calle','56292663365','56993160052',1182633);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (2568975,7,'Mcclain','Lester','Merrill','Apdo.:163-5682 Pede, C/','56283671124','56938269604',3314990);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (2690355,0,'Flowers','Blankenship','Amanda','4917 Elit, Calle','56258765540','56956366053',1973870);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (6515140,2,'Armstrong','Reid','Walker','3903 Duis Carretera','56232604907','56980519867',4413323);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (5360903,6,'Cline','Landry','Yardley','3032 In, C.','56230581022','56968474397',1870579);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (4071738,6,'Melendez','Jimenez','Amos','Apdo.:291-731 Adipiscing Av.','56259331583','56992346848',3069657);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (3210563,5,'Long','Bradley','Rashad','346 Eu Avda.','56292880094','56967589574',3279566);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (2106436,3,'Galloway','Dalton','Iris','6363 Vivamus Carretera','56273801041','56903651578',3018761);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (4999879,4,'Chaney','Mckee','Madonna','Apdo.:993-1762 Nunc Avda.','56219591597','56906890619',2436328);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (5596231,4,'Morgan','Rose','Gloria','Apdo.:994-4287 Nisi Av.','56277621067','56988469541',4395398);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (6548446,5,'Meyers','David','Fuller','Apdo.:853-6806 Nec, C.','56265681931','56936253665',466655);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (8557357,2,'Irwin','Tran','Emerald','716-7421 Parturient Calle','56227311712','56995946560',1547139);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (430485,6,'Roth','Crane','Allen','Apartado núm.: 531, 5881 Lobortis Avenida','56256339833','56902788959',2345788);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (648293,4,'Simpson','Perry','Erasmus','4555 Nulla Calle','56298797441','56999789626',1355382);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (5777936,6,'Donovan','Robles','Brenda','Apartado núm.: 808, 2127 Tempus C.','56284694722','56995246075',1414883);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (8370239,6,'Roy','Chapman','Stacy','9570 Eget Ctra.','56278843904','56983615687',901814);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (2217179,7,'Tanner','Hobbs','Hope','594-4891 Auctor. C.','56251553538','56922152919',2509707);
INSERT INTO CLIENTE (NUMRUT_CLI,DVRUT_CLI,APPATERNO_CLI,APMATERNO_CLI,NOMBRE_CLI,DIRECCION_CLI,FONOFIJO_CLI,CELULAR_CLI,RENTA_CLI) VALUES (5369843,7,'Hughes','Galloway','Malik','Apartado núm.: 849, 6592 Cubilia Av.','56206354394','56936726466',466502);


