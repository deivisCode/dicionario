import sqlite3

# Creo un contexto para usar con 'with' despois
class conexionAberta:
    """Un Contexto que me permite abrir e pechar unha
    conexión cunha base de datos de SQLite3"""

    # método que se usa ao crear o obxeto
    def __init__(self):
        self.conexion = sqlite3.connect(":memory:")
        print(f"Creado obxeto Conexion(...): {self.conexion}")

    # método que se usa para devolver o contido (with ... AS f)
    def __enter__(self):
        return self.conexion

    # método que se executa ao rematar o with
    def __exit__(self, exc_type, exc_value, exc_traceback):
        self.conexion.close()
        print("Pechada a conexión")

taboas_CSV = [
    "datos/CSVs/denominacions.csv",
]

# Gardo as ordes de SQL nunha variable para despois
with open("datos/ordes.sql", "r") as o:
    ordes = o.read()
    print("Lidas as ordes de SQL")

with conexionAberta() as c:
    c.executescript("datos/ordes.sql")
