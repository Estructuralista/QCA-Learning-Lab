# ==============================================
# QCA Learning Lab
# Ejemplo 1: Cargar datos con Pandas
# ==============================================

import pandas as pd

# Leer el archivo CSV
datos = pd.read_csv("05_Codigo_Python/datos/ejemplo.csv")

print("=" * 50)
print("BASE DE DATOS")
print("=" * 50)

print(datos)

print("\nNúmero de casos:", len(datos))

print("\nVariables:")

for variable in datos.columns:
    print("-", variable)