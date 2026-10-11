PRAGMA foreign_keys = ON;
CREATE TABLE Termos(
    id          INTEGER PRIMARY KEY,
    gl          TEXT NOT NULL UNIQUE, -- tal vez debería quitar a ligadura de 'unique' aqui e usar esto como clave foránea mellor
    en          TEXT NOT NULL ,
    es          TEXT NOT NULL ,
    xenero      TEXT NOT NULL CHECK ( xenero      in ( 'femenino'       , 'masculino' , 'neutro'      ) ) ,
    clase       TEXT NOT NULL CHECK ( clase       in ( 'sustantivo'     , 'verbo'     , 'adxetivo'    ) ) ,
    numeros     TEXT NOT NULL CHECK ( numeros     in ( 'singular'       , 'plural'                    ) ) ,
    abreviacion TEXT NOT NULL CHECK ( abreviacion in ( 'forma completa' , 'siglas'    , 'abreviación' ) )
);

CREATE TABLE Definicions(
    id            INTEGER PRIMARY KEY,
    id_definicion INTEGER NOT NULL,
    definicion    TEXT    NOT NULL,
    FOREIGN KEY (id_definicion) REFERENCES Termos(id)
);

CREATE TABLE IF NOT EXISTS AreasTematicas(
    id      INTEGER PRIMARY KEY ,
    id_area INTEGER NOT NULL ,
    area    TEXT    NOT NULL CHECK ( area in ( "area_1", "area_2", "area_3", "area_4" )),
    FOREIGN KEY (id_area) REFERENCES Termos(id)
);
