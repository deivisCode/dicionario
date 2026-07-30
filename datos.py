import json
import sys
import pandas as pd

with open("RI.json", 'r') as f:
    contidos = json.load(f)

taboa_termo_def = {"termo": [], "definicion": []}
taboa_gl_en_es  = {"gl": [], "en": [], "es": [] }

print(sys.argv)

for indice in range(len(contidos)):

    termo = list(contidos[indice].keys())[0]
    acepcions = contidos[indice][termo]

    for acepcion in acepcions:

        # TERMO, DEFINICION
        taboa_termo_def["termo"].append(termo)
        taboa_termo_def["definicion"].append(acepcion["lingua"]["gl"]["definición"])

        # # GL, EN, ES
        # taboa_gl_en_es["gl"].append(termo)
        # taboa_gl_en_es["es"].append(acepcion["lingua"]["es"]["termo"])
        # taboa_gl_en_es["en"].append(acepcion["lingua"]["en"]["termo"])


df_taboa_termo_def = pd.DataFrame(taboa_termo_def)
# df_taboa_gl_en_es  = pd.DataFrame(taboa_gl_en_es)

df_taboa_termo_def.to_csv("CSVs/termo_def.csv", index = False)
# df_taboa_gl_en_es.to_csv("CSVs/gl_en_es.csv", index = False)
