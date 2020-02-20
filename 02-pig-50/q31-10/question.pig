-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Cuente la cantidad de personas nacidas por año.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

data1 = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);


Resp31 = FOREACH data1 GENERATE $1,SUBSTRING($3,0,4);
Resp311 = GROUP Resp31 BY $1;
Resp = FOREACH Resp311 GENERATE $0,COUNT($1);
DUMP Resp;


STORE Resp INTO 'output' USING PigStorage(',');
