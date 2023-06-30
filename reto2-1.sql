CREATE DATABASE cat_cafe;

SHOW DATABASES;

USE cat_cafe;

SHOW TABLES;


CREATE TABLE gatitos (
    datos_gatos INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    apodo VARCHAR(30),
    edad INT NOT NULL,
    peso FLOAT(4, 1) NOT NULL,
    preferencias VARCHAR(40),
    llegada VARCHAR(40),
    color VARCHAR(30),
    ojos VARCHAR(30),
    PRIMARY KEY (datos_gatos)
);

DESCRIBE gatitos;

/* Primer requisito del reto el establecimiento Cat Cafe quiere almacenar la informacion de los gatitos */


INSERT INTO gatitos (nombre, apodo, edad, peso, preferencias, llegada, color, ojos)
VALUES ("Rocket", NULL, 3, 3.0, "Le gusta dormir mucho", "LLego junto con Sunny", "Blanco", "Celestes");

SELECT * FROM gatitos;

INSERT INTO gatitos (nombre, apodo, edad, peso, preferencias, llegada, color, ojos)
VALUES ("Pinto", "Pin", 5, 3.5, "Le gustan los mimos", NULL, "Naranja con blanco", "Amarillo con verde");

SELECT * FROM gatitos;

INSERT INTO gatitos (nombre, apodo, edad, peso, preferencias, llegada, color, ojos)
VALUES ("Sunny", NULL, 2, 5.0, "Le encanta jugar con pelotitas", NULL, "Negro", "Amarillentos");

SELECT * FROM gatitos;

INSERT INTO gatitos (nombre, apodo, edad, peso, preferencias, llegada, color, ojos)
VALUES ("Emelia", "Emeli", 5, 4.4, "Le encanta reposar donde hay sol", "LLego junto con Seiko", "Gris con negro", "Amarillentos");

SELECT * FROM gatitos;

INSERT INTO gatitos (nombre, apodo, edad, peso, preferencias, llegada, color, ojos)
VALUES ("Nikki", NULL, 4, 4.3, "No se despega de Ricochet", NULL, "Gris", "Verdes Claros");

SELECT * FROM gatitos;

INSERT INTO gatitos (nombre, apodo, edad, peso, preferencias, llegada, color, ojos)
VALUES ("Ricochet", NULL, 4, 4.7, "Le gustan los lugares altos", NULL, "Blanco con Gris", "Celestes");

SELECT * FROM gatitos;

INSERT INTO gatitos (nombre, apodo, edad, peso, preferencias, llegada, color, ojos)
VALUES ("Onyx", NULL, 7, 3.3, "Va donde hay comida", NULL, "Naranja con marron", "Amarillentos");

SELECT * FROM gatitos;

INSERT INTO gatitos (nombre, apodo, edad, peso, preferencias, llegada, color, ojos)
VALUES ("Seiko", NULL, 2, 3.7, "Le gusta dormir junto a otros gatos", NULL, "Blanco con Gris", "Verdosos");

SELECT * FROM gatitos;

INSERT INTO gatitos (nombre, apodo, edad, peso, preferencias, llegada, color, ojos)
VALUES ("Nathan", "Ninja Nate", 7, 4.5, "Le encanta esconderse", NULL, "Negro", "Amarillentos");

SELECT * FROM gatitos;



/* Segundo requisito del reto modificar la tabla para que aparezca por defecto no tienen apodo a los gatitos que corresponda */

UPDATE gatitos SET apodo = "No tiene" WHERE apodo IS NULL;

ALTER TABLE gatitos MODIFY apodo VARCHAR(30) DEFAULT "No Tiene" NOT NULL;


/* Cuarto requisito del reto modidificar la tabla para los gatos que llegaron solos  */

UPDATE gatitos SET llegada = "LLego Solo" WHERE llegada IS NULL;

ALTER TABLE gatitos MODIFY llegada VARCHAR(30) DEFAULT "LLego Solo" NOT NULL;


/* Sexto requisito asignar un valor booleano de TRUE si su peso es mayor a 4 o FALSE SI su peso es menor a 4 */

ALTER TABLE gatitos ADD COLUMN dieta BOOLEAN AFTER peso;

ALTER TABLE gatitos ALTER COLUMN dieta SET DEFAULT FALSE;

UPDATE gatitos SET dieta = CASE WHEN peso > 4 THEN TRUE ELSE FALSE END;


/* Septimo requisito agregar los años que faltan para que los gatos se jubilen que es a los 11 años  */

ALTER TABLE gatitos ADD COLUMN anios_para_jubilacion INT AFTER edad;

UPDATE gatitos SET anios_para_jubilacion = 11 - edad;

DELIMITER //

CREATE TRIGGER calcular_anios_jubilacion
BEFORE INSERT ON gatitos
FOR EACH ROW
BEGIN
  SET NEW.anios_para_jubilacion = 11 - NEW.edad;
END; //

DELIMITER ;


/* Octavo requisito agregar dos ultimos gatos y que cumplan con todos los requisitos automaticamente */ 

INSERT INTO gatitos (nombre, apodo, edad, peso, preferencias, color, ojos)
VALUES ("Toffee", "Tofisito", 4, 3.4, "Le gusta jugar y estar solo a veces", "Blanco con gris", "Verdosos");

INSERT INTO gatitos (nombre, apodo, edad, peso, preferencias, color, ojos)
VALUES ("Chucky", NULL, 10, 4.3, "Le gusta dormir y caminar", "Naranja con blanco", "Amarillentos");
















