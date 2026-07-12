import json
from jsonschema import validate

# :FACER: columna de termos relacionados (véxase, etc.)

with open("filtrado/RI.json") as f:
    representacion_intermedia = json.loads(f.read())
    print(f"Hai {len(representacion_intermedia)} termos")

with open("filtrado/esquema_RI.json") as f:
    esquema = json.loads(f.read())

validate(instance=representacion_intermedia, schema=esquema)

for termo in representacion_intermedia:
    assert len(termo.keys()) == 1, f"O termo {termo} ten varias chaves"
    termo.keys()
