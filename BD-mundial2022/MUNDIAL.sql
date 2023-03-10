CREATE TABLE  "SELECCION" 
   (    "CODS" NUMBER NOT NULL ENABLE, 
    "PAIS" VARCHAR2(20) NOT NULL ENABLE, 
     CONSTRAINT "PK_SELECCION_CODS" PRIMARY KEY ("CODS") ENABLE
   ) ;CREATE TABLE  "JUGADOR" 
   (    "ID" NUMBER NOT NULL ENABLE, 
    "NOMJ" VARCHAR2(20) NOT NULL ENABLE, 
    "CODEO" NUMBER, 
    "CODS" NUMBER, 
     CONSTRAINT "PK_JUGADOR_ID" PRIMARY KEY ("ID") ENABLE
   ) ;CREATE TABLE  "TIPO_CARACTERISTICA" 
   (    "CODTC" NUMBER NOT NULL ENABLE, 
    "NOMTC" VARCHAR2(20) NOT NULL ENABLE, 
     CONSTRAINT "PK_TIPO_CARACTERISTICA_CODTC" PRIMARY KEY ("CODTC") ENABLE
   ) ;CREATE TABLE  "CARACTERISTICASJ" 
   (    "CODCJ" NUMBER NOT NULL ENABLE, 
    "ID" NUMBER NOT NULL ENABLE, 
    "CODTC" NUMBER NOT NULL ENABLE, 
     CONSTRAINT "PK_CARACTERISTICASJ_CODCJ" PRIMARY KEY ("CODCJ") ENABLE
   ) ;CREATE TABLE  "PARTIDO" 
   (    "CODP" NUMBER NOT NULL ENABLE, 
    "CODSL" NUMBER NOT NULL ENABLE, 
    "CODSV" NUMBER NOT NULL ENABLE, 
    "CODE" NUMBER NOT NULL ENABLE, 
    "FECHA" DATE NOT NULL ENABLE, 
    "HORA" VARCHAR2(20) NOT NULL ENABLE, 
     CONSTRAINT "PK_PARTIDO_CODP" PRIMARY KEY ("CODP") ENABLE
   ) ;CREATE TABLE  "ALINEACION" 
   (    "CODAL" NUMBER, 
    "CODCJ" NUMBER, 
    "CODP" NUMBER, 
    "MINENT" NUMBER, 
    "MINSAL" NUMBER, 
     CONSTRAINT "PK_ALINEACION_CODAL" PRIMARY KEY ("CODAL") ENABLE
   ) ;CREATE TABLE  "ARBITRO" 
   (    "CODA" NUMBER NOT NULL ENABLE, 
    "NOMA" VARCHAR2(20) NOT NULL ENABLE, 
     CONSTRAINT "PK_ARBITRO_CODA" PRIMARY KEY ("CODA") ENABLE
   ) ;CREATE TABLE  "TIPO_ARBITRO" 
   (    "CODTA" NUMBER NOT NULL ENABLE, 
    "NOMTA" VARCHAR2(20) NOT NULL ENABLE, 
     CONSTRAINT "PK_TIPO_ARBITRO_CODTA" PRIMARY KEY ("CODTA") ENABLE
   ) ;CREATE TABLE  "FUNCION" 
   (    "CODFA" NUMBER, 
    "CODA" NUMBER, 
    "CODTA" NUMBER, 
     CONSTRAINT "PK_FUNCION_CODFA" PRIMARY KEY ("CODFA") ENABLE
   ) ;CREATE TABLE  "ARBITRO_PARTIDO" 
   (    "CODAP" NUMBER NOT NULL ENABLE, 
    "CODFA" NUMBER, 
    "CODP" NUMBER, 
     CONSTRAINT "PK_ARBITRO_PARTIDO_CODAP" PRIMARY KEY ("CODAP") ENABLE
   ) ;CREATE TABLE  "AUDIT_DETALLE" 
   (    "ID" NUMBER, 
    "NOMBRE_CAMPO" VARCHAR2(50), 
    "VALOR_NUEVO" VARCHAR2(50), 
    "VALOR_ANTERIOR" VARCHAR2(50), 
     PRIMARY KEY ("ID") ENABLE
   ) ;CREATE TABLE  "AUDIT_MAESTRO" 
   (    "ID" NUMBER, 
    "TIPO_MODIFICACION" VARCHAR2(1), 
    "NOMBRE_TABLA" VARCHAR2(50), 
    "LLAVE" NUMBER, 
    "NOMBRE_CAMPO1" VARCHAR2(50), 
    "NOMBRE_CAMPO2" VARCHAR2(50), 
    "USUARIO" VARCHAR2(50), 
    "FECHA" DATE, 
    "TERMINAL" VARCHAR2(50), 
     PRIMARY KEY ("ID") ENABLE
   ) ;CREATE TABLE  "CIUDAD" 
   (    "CODCI" NUMBER NOT NULL ENABLE, 
    "NOMCI" VARCHAR2(20) NOT NULL ENABLE, 
     CONSTRAINT "PK_CIUDAD_CI" PRIMARY KEY ("CODCI") ENABLE
   ) ;CREATE TABLE  "SANCION" 
   (    "CODSA" NUMBER NOT NULL ENABLE, 
    "NOMSA" VARCHAR2(20) NOT NULL ENABLE, 
     CONSTRAINT "PK_SANCION_CODSA" PRIMARY KEY ("CODSA") ENABLE
   ) ;CREATE TABLE  "DETALLE" 
   (    "CODD" NUMBER NOT NULL ENABLE, 
    "MIND" NUMBER NOT NULL ENABLE, 
    "CODP" NUMBER NOT NULL ENABLE, 
    "CODSA" NUMBER NOT NULL ENABLE, 
    "IDSA" NUMBER NOT NULL ENABLE, 
    "IDAF" NUMBER, 
     CONSTRAINT "PK_DETALLE_CODD" PRIMARY KEY ("CODD") ENABLE, 
     CONSTRAINT "CK_PARTIDO_ID" CHECK (IDSA != IDAF) ENABLE
   ) ;CREATE TABLE  "TIPO_TECNICO" 
   (    "CODTT" NUMBER NOT NULL ENABLE, 
    "NOMTT" VARCHAR2(20) NOT NULL ENABLE, 
     CONSTRAINT "PK_TIPO_TECNICO_CODTT" PRIMARY KEY ("CODTT") ENABLE
   ) ;CREATE TABLE  "TECNICO" 
   (    "CODT" NUMBER NOT NULL ENABLE, 
    "NOMT" VARCHAR2(20) NOT NULL ENABLE, 
    "CODTT" NUMBER(20,0), 
     CONSTRAINT "PK_TECNICO_CODT" PRIMARY KEY ("CODT") ENABLE
   ) ;CREATE TABLE  "EQUIPO_TECNICO" 
   (    "CODET" NUMBER, 
    "CODS" NUMBER, 
    "CODT" NUMBER, 
     CONSTRAINT "PK_EQUIPO_TECNICO_CODET" PRIMARY KEY ("CODET") ENABLE
   ) ;CREATE TABLE  "ESTADIO" 
   (    "CODE" NUMBER NOT NULL ENABLE, 
    "CODCI" NUMBER, 
    "NOME" VARCHAR2(20) NOT NULL ENABLE, 
     CONSTRAINT "PK_ESTADIO_CODE" PRIMARY KEY ("CODE") ENABLE
   ) ;CREATE TABLE  "E_ORIGEN" 
   (    "CODEO" NUMBER NOT NULL ENABLE, 
    "NUMBEO" VARCHAR2(20) NOT NULL ENABLE, 
     CONSTRAINT "PK_E_ORIGEN_CODEO" PRIMARY KEY ("CODEO") ENABLE
   ) ;ALTER TABLE  "ALINEACION" ADD CONSTRAINT "FK_ALINEACION_CODCJ" FOREIGN KEY ("CODCJ")
      REFERENCES  "CARACTERISTICASJ" ("CODCJ") ENABLE;ALTER TABLE  "ALINEACION" ADD CONSTRAINT "FK_ALINEACION_CODP" FOREIGN KEY ("CODP")
      REFERENCES  "PARTIDO" ("CODP") ENABLE;ALTER TABLE  "ARBITRO_PARTIDO" ADD CONSTRAINT "FK_ARBITRO_PARTIDO_CODFA" FOREIGN KEY ("CODFA")
      REFERENCES  "FUNCION" ("CODFA") ENABLE;ALTER TABLE  "ARBITRO_PARTIDO" ADD CONSTRAINT "FK_ARBITRO_PARTIDO_CODP" FOREIGN KEY ("CODP")
      REFERENCES  "PARTIDO" ("CODP") ENABLE;ALTER TABLE  "CARACTERISTICASJ" ADD CONSTRAINT "FK_CARACTERISTICASJ_CODTC" FOREIGN KEY ("CODTC")
      REFERENCES  "TIPO_CARACTERISTICA" ("CODTC") ENABLE;ALTER TABLE  "CARACTERISTICASJ" ADD CONSTRAINT "FK_CARACTERISTICASJ_ID" FOREIGN KEY ("ID")
      REFERENCES  "JUGADOR" ("ID") ENABLE;ALTER TABLE  "DETALLE" ADD CONSTRAINT "FK_DETALLE_CODP" FOREIGN KEY ("CODP")
      REFERENCES  "PARTIDO" ("CODP") ENABLE;ALTER TABLE  "DETALLE" ADD CONSTRAINT "FK_DETALLE_CODSA" FOREIGN KEY ("CODSA")
      REFERENCES  "SANCION" ("CODSA") ENABLE;ALTER TABLE  "DETALLE" ADD CONSTRAINT "FK_DETALLE_IDAF" FOREIGN KEY ("IDAF")
      REFERENCES  "JUGADOR" ("ID") ENABLE;ALTER TABLE  "DETALLE" ADD CONSTRAINT "FK_DETALLE_IDSA" FOREIGN KEY ("IDSA")
      REFERENCES  "JUGADOR" ("ID") ENABLE;ALTER TABLE  "EQUIPO_TECNICO" ADD CONSTRAINT "FK_EQUIPO_TECNICO_CODS" FOREIGN KEY ("CODS")
      REFERENCES  "SELECCION" ("CODS") ENABLE;ALTER TABLE  "EQUIPO_TECNICO" ADD CONSTRAINT "FK_EQUIPO_TECNICO_CODT" FOREIGN KEY ("CODT")
      REFERENCES  "TECNICO" ("CODT") ENABLE;ALTER TABLE  "FUNCION" ADD CONSTRAINT "FK_FUNCION_CODA" FOREIGN KEY ("CODA")
      REFERENCES  "ARBITRO" ("CODA") ENABLE;ALTER TABLE  "FUNCION" ADD CONSTRAINT "FK_FUNCION_CODTA" FOREIGN KEY ("CODTA")
      REFERENCES  "TIPO_ARBITRO" ("CODTA") ENABLE;ALTER TABLE  "JUGADOR" ADD CONSTRAINT "FK_JUGADOR_CODEO" FOREIGN KEY ("CODEO")
      REFERENCES  "E_ORIGEN" ("CODEO") ENABLE;ALTER TABLE  "JUGADOR" ADD CONSTRAINT "FK_JUGADOR_CODS" FOREIGN KEY ("CODS")
      REFERENCES  "SELECCION" ("CODS") ENABLE;ALTER TABLE  "PARTIDO" ADD CONSTRAINT "FK_PARTIDO_CODSL" FOREIGN KEY ("CODSL")
      REFERENCES  "SELECCION" ("CODS") ENABLE;ALTER TABLE  "PARTIDO" ADD CONSTRAINT "FK_PARTIDO_CODSV" FOREIGN KEY ("CODSV")
      REFERENCES  "SELECCION" ("CODS") ENABLE;ALTER TABLE  "TECNICO" ADD CONSTRAINT "FK_TECNICO_CODTT" FOREIGN KEY ("CODTT")
      REFERENCES  "TIPO_TECNICO" ("CODTT") ENABLE;
CREATE OR REPLACE FUNCTION  "FU_TR_JUGADOR" 
RETURN VARCHAR2
AS
NOMBRE VARCHAR2(20);
ROJA NUMBER;
BEGIN
SELECT NOMJ, COUNT(CODD) INTO NOMBRE, ROJA FROM JUGADOR J 
INNER JOIN DETALLE D ON J.ID=D.IDSA
INNER JOIN SANCION S ON D.CODSA=S.CODSA
WHERE UPPER(NOMSA)= 'TARJETA ROJA'
GROUP BY NOMJ
HAVING COUNT(CODD)=(SELECT MAX(COUNT(CODD)) FROM JUGADOR J INNER JOIN DETALLE D ON J.ID=D.IDSA
INNER JOIN SANCION S ON D.CODSA=S.CODSA
WHERE UPPER(NOMSA)= 'TARJETA ROJA'
GROUP BY NOMJ);
RETURN NOMBRE;
END;
/
/
CREATE OR REPLACE FUNCTION  "FU_TA_JUGADOR" 
RETURN VARCHAR2
AS
NOMBRE VARCHAR2(20);
AMA NUMBER;
BEGIN
SELECT NOMJ, COUNT(CODD) INTO NOMBRE, AMA FROM JUGADOR J 
INNER JOIN DETALLE D ON J.ID=D.IDSA
INNER JOIN SANCION S ON D.CODSA=S.CODSA
WHERE UPPER(NOMSA)= 'TARJETA AMARILLA'
GROUP BY NOMJ
HAVING COUNT(CODD)=(SELECT MAX(COUNT(CODD)) FROM JUGADOR J INNER JOIN DETALLE D ON J.ID=D.IDSA
INNER JOIN SANCION S ON D.CODSA=S.CODSA
WHERE UPPER(NOMSA)= 'TARJETA AMARILLA'
GROUP BY NOMJ);
RETURN NOMBRE;
END;
/
/
CREATE OR REPLACE FUNCTION  "FU_MIN_JUGADOR" (N IN VARCHAR2)
RETURN NUMBER
AS
NOMBRE VARCHAR2(20);
MINE NUMBER;
MINS NUMBER;
BEGIN
SELECT NOMJ, SUM(MINENT), SUM(MINSAL) INTO NOMBRE, MINE, MINS FROM JUGADOR J
INNER JOIN CARACTERISTICASJ CJ ON J.ID=CJ.ID
INNER JOIN ALINEACION A ON CJ.CODCJ=A.CODCJ
WHERE NOMJ=N
GROUP BY NOMJ;
RETURN MINS-MINE;
END;
/
/
CREATE OR REPLACE FUNCTION  "FU_JUG_GOLEADOR" 
RETURN VARCHAR2
AS
GOLEADOR VARCHAR2(25);
GOLES NUMBER;
BEGIN
select NOMJ , COUNT(D.CODSA) INTO GOLEADOR, GOLES from detalle d
inner join sancion sa on sa.codsa=d.codsa
inner join jugador j on j.id=d.idsa
GROUP BY NOMJ , NOMSA
HAVING nomsa = 'GOL' AND COUNT(D.CODSA) =(SELECT MAX(COUNT(D.CODSA)) FROM  detalle d
inner join sancion sa on sa.codsa=d.codsa inner join jugador j on j.id=d.idsa
GROUP BY NOMJ,nomsa);
RETURN GOLEADOR;
END;
/
/
CREATE OR REPLACE FUNCTION  "FU_GOL_JUGADOR" (N IN VARCHAR2) 
RETURN NUMBER 
AS 
NOMBRE VARCHAR2(20); 
GOLS NUMBER; 
BEGIN 
SELECT NOMJ, COUNT(CODD) INTO NOMBRE, GOLS FROM JUGADOR J 
INNER JOIN DETALLE D ON J.ID=D.IDSA 
INNER JOIN SANCION S ON D.CODSA=S.CODSA 
WHERE UPPER(NOMSA) = 'GOL' AND NOMJ = N GROUP BY NOMJ; 
RETURN GOLS; 
END;
/
/
CREATE OR REPLACE FUNCTION  "FU_EQ_LIMPIO" RETURN VARCHAR2
AS
PAISS VARCHAR2(50);
PUNTOS NUMBER;
TARJETA VARCHAR2(50);
TOTAL NUMBER;
ROJAS NUMBER;
AMARILLAS NUMBER;
BEGIN
select PAIS , COUNT(D.CODSA) INTO PAISS, PUNTOS from detalle d
inner join sancion sa on sa.codsa=d.codsa
inner join jugador j on j.id=d.idSA
inner join seleccion s on s.cods=j.cods
GROUP BY PAIS , NOMSA
HAVING nomsa = 'TARJETA AMARILLA'AND COUNT(D.CODSA) =(SELECT MIN(COUNT(D.CODSA)) FROM  detalle d
inner join sancion sa on sa.codsa=d.codsa inner join jugador j on j.id=d.idSA
inner join seleccion s on s.cods=j.cods GROUP BY pais,nomsa);
RETURN PAISS;
END;
/
/
CREATE OR REPLACE FUNCTION  "FU_EQ_GOLEADOR" 
RETURN VARCHAR2
IS 
PAISS VARCHAR2(25);
GOLES NUMBER;
BEGIN
select PAIS, COUNT(D.CODD) INTO PAISS, GOLES from detalle d
inner join sancion sa on sa.codsa=d.codsa
inner join jugador j on j.id=d.idsa
inner join seleccion s on s.cods=j.cods
GROUP BY PAIS , NOMSA
HAVING nomsa = 'GOL'AND COUNT(D.CODD) =(SELECT MAX(COUNT(D.CODSA)) FROM  detalle d
inner join sancion sa on sa.codsa=d.codsa inner join jugador j on j.id=d.idsa
inner join seleccion s on s.cods=j.cods GROUP BY pais,nomsa);
RETURN PAISS;
END;
/
/
CREATE OR REPLACE FUNCTION  "FU_ARQ_MENOSBATIDO" 
RETURN VARCHAR2
AS 
ARQUERO VARCHAR2(20); 
GOLES NUMBER; 
PARTIDO NUMBER; 
POSICION VARCHAR2(20); 
BEGIN 
select NOMJ , P.CODP, nomtc , COUNT(D.CODSA) INTO ARQUERO,PARTIDO,POSICION,GOLES from detalle d 
inner join sancion sa on sa.codsa=d.codsa 
inner join jugador j on j.id=d.idAF 
INNER JOIN CARACTERISTICASJ CJ ON CJ.ID=J.ID 
INNER JOIN TIPO_CARACTERISTICA TC ON TC.CODTC=CJ.CODTC 
INNER JOIN PARTIDO P ON P.CODP=D.CODP 
GROUP BY NOMJ , NOMSA, P.CODP ,nomtc 
HAVING nomsa = 'GOL'AND NOMTC='Portero' and COUNT(D.CODSA) =(SELECT MIN(COUNT(D.CODSA)) FROM detalle d inner join sancion sa on sa.codsa=d.codsa inner join jugador j on j.id=d.idAF GROUP BY NOMJ,nomsa); RETURN ARQUERO; 
END;
/
/
CREATE OR REPLACE PROCEDURE  "UPDATE_PARTIDO" (CODPP IN NUMBER, CODSLL NUMBER, CODSVV NUMBER, CODEE NUMBER, FECHAA DATE, HORAA VARCHAR2) 
AS 
BEGIN 
UPDATE PARTIDO SET CODSL = CODSLL, CODSV = CODSVV, CODE = CODEE, FECHA = FECHAA, HORA = HORAA 
WHERE CODP = CODPP; 
END;
/
/
CREATE OR REPLACE PROCEDURE  "UPDATE_DETALLE" (CODDD IN NUMBER, MINDD NUMBER, CODPP NUMBER, CODSAA NUMBER, IDSAA NUMBER, IDAFF NUMBER)
AS 
BEGIN 
UPDATE DETALLE 
SET MIND = MINDD, CODP = CODPP, CODSA = CODSAA, IDSA= IDSAA, IDAF = IDAFF 
WHERE CODD = CODDD; 
END;
/
/
CREATE OR REPLACE PROCEDURE  "INSERTA_PARTIDO" (CODP IN NUMBER, CODSL NUMBER, CODSV NUMBER, CODE NUMBER, FECHA DATE, HORA VARCHAR2) 
AS 
BEGIN 
INSERT INTO PARTIDO VALUES(CODP, CODSL,CODSV,CODE,FECHA,HORA); 
END;
/
/
CREATE OR REPLACE PROCEDURE  "INSERTA_DETALLE" (CODD IN NUMBER, MIND NUMBER, CODP NUMBER, CODSA NUMBER, IDSA NUMBER, IDAF NUMBER) 
AS 
BEGIN 
INSERT INTO DETALLE VALUES (CODD,MIND,CODP,CODSA,IDSA,IDAF); 
END;
/
/
CREATE OR REPLACE PROCEDURE  "DELETE_DATOS" (PART IN NUMBER)
AS
BEGIN
DELETE FROM PARTIDO
WHERE CODP=PART;
END;
/
/
 CREATE SEQUENCE   "SEQ_AUDITORIA"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
CREATE OR REPLACE TRIGGER  "TR0_AUD_MARCADOR" 
INSTEAD OF INSERT OR UPDATE OR DELETE
ON VI_MARCADOR 
FOR EACH ROW
DECLARE SECUENCIA NUMBER;
BEGIN

      IF :OLD.MARCADOR <> :NEW.MARCADOR THEN
         SELECT SEQ_AUDITORIA.NEXTVAL INTO SECUENCIA FROM DUAL;
         INSERT INTO AUDIT_MAESTRO VALUES (SECUENCIA, 'M', 'VI_MARCADOR', :OLD.PARTIDO, :OLD.MARCADOR, :NEW.MARCADOR, USER, SYSDATE, USERENV('TERMINAL'));
      IF :OLD.MARCADOR <> :NEW.MARCADOR THEN
            INSERT INTO AUDIT_DETALLE VALUES (SECUENCIA, 'MARCADOR', :NEW.MARCADOR, :OLD.MARCADOR);
         END IF;
      END IF;
   IF DELETING THEN
      SELECT SEQ_AUDITORIA.NEXTVAL INTO SECUENCIA FROM DUAL;
      INSERT INTO AUDIT_MAESTRO VALUES (SECUENCIA, 'B', 'VI_MARCADOR', :OLD.PARTIDO, :OLD.LOCAL ||'-'||:OLD.VISITA, :OLD.MARCADOR, USER, SYSDATE, USERENV('TERMINAL'));
   END IF;
END;
/
ALTER TRIGGER  "TR0_AUD_MARCADOR" ENABLE;
CREATE OR REPLACE FORCE VIEW  "VI_EQ_GOL" ("PAIS", "GOLES") AS 
  select PAIS, COUNT(D.CODD) GOLES from detalle d
inner join sancion sa on sa.codsa=d.codsa
inner join jugador j on j.id=d.idsa
inner join seleccion s on s.cods=j.cods
GROUP BY PAIS , NOMSA
HAVING nomsa = 'GOL' AND COUNT(D.CODD) =(SELECT MAX(COUNT(D.CODSA)) FROM  detalle d
inner join sancion sa on sa.codsa=d.codsa inner join jugador j on j.id=d.idsa
inner join seleccion s on s.cods=j.cods GROUP BY pais,nomsa);CREATE OR REPLACE FORCE VIEW  "VI_MARCADOR" ("PARTIDO", "LOCAL", "VISITA", "MARCADOR") AS 
  SELECT  V1.PARTIDO PARTIDO, LOCAL  , VISITA , "GOLES LOCAL" ||'-'|| "GOLES VISITA" MARCADOR FROM VI_RESULTADOS_CODSL V1 INNER JOIN  VI_RESULTADOS_CODSV V2 ON V1.PARTIDO=V2.PARTIDO;CREATE OR REPLACE FORCE VIEW  "VI_RESULTADOS_CODSL" ("LOCAL", "PARTIDO", "GOLES LOCAL") AS 
  SELECT  PAIS LOCAL , PA.CODP PARTIDO ,COUNT(NOMSA) AS "GOLES LOCAL"   FROM SANCION SA INNER JOIN DETALLE DE ON DE.CODSA=SA.CODSA
INNER JOIN PARTIDO PA ON PA.CODP=DE.CODP
INNER JOIN JUGADOR J ON J.ID= DE.IDSA
INNER JOIN SELECCION SE ON J.CODS=SE.CODS
GROUP BY PAIS ,PA.CODP , NOMSA , CODSL , SE.CODS
HAVING NOMSA ='GOL' AND CODSL = SE.CODS;CREATE OR REPLACE FORCE VIEW  "VI_RESULTADOS_CODSV" ("VISITA", "PARTIDO", "GOLES VISITA") AS 
  SELECT  PAIS VISITA, PA.CODP PARTIDO ,COUNT(NOMSA) AS "GOLES VISITA"   FROM SANCION SA INNER JOIN DETALLE DE ON DE.CODSA=SA.CODSA
INNER JOIN PARTIDO PA ON PA.CODP=DE.CODP
INNER JOIN JUGADOR J ON J.ID= DE.IDSA
INNER JOIN SELECCION SE ON J.CODS=SE.CODS
GROUP BY PAIS ,PA.CODP , NOMSA , CODSV , SE.CODS
HAVING NOMSA ='GOL' AND CODSV = SE.CODS;
Rem No database link found to generate DDL.
Rem No materialized view found to generate DDL.