INSERT INTO
    Probas ( termo, definicion )
SELECT
    json_extract(value, '$.termo'),
    json_extract(value, '$.acepcións[0].lingua.gl.definición')
FROM
    json_each(readfile('exemplo_RI.json'));
