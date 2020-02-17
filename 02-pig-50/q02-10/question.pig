-- Pregunta
-- ===========================================================================
-- 
-- Ordene el archivo `data.tsv`  por letra y valor (3ra columna).
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba el codigo del mapper a partir de este punto <<<
-- 
fs -rm -f -r data.tsv
fs -put data.tsv
datos = LOAD 'data.tsv' using PigStorage('\t') AS (id:chararray,date:chararray,numero:int);
y = ORDER datos BY id, numero ASC;

STORE y INTO './output' using PigStorage('\t');

fs -copyToLocal output output

