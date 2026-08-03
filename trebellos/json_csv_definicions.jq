def definicions(datos):
  [ # creamos un array
    datos
    | .[] # para cada elemento do array orixinal
    | [ # creamos outro array
        [(.termo)], # onde o primeiro elemento é un array
        [(."acepcións".[].lingua.gl."definición")] # e o segundo tamén
      ]
    | combinations # e facemos combinacións cos elementos do array anterior
  ]
  | map(@csv) # cada sub array a unha soa liña escapada
  | .[] # devolvemos elemento a elemento
;

# aplicamos o filtro
definicions(.)
