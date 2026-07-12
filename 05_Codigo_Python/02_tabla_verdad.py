# ==============================================
# QCA Learning Lab
# Ejemplo 2
# Construcción de una Truth Table
# ==============================================

import pandas as pd

# Leer la base de datos
datos = pd.read_csv("05_Codigo_Python/datos/ejemplo.csv")

# Variables causales
condiciones = ["Motivacion", "Capacitacion", "Apoyo"]

# Construcción de la Truth Table
truth_table = (
    datos
    .groupby(condiciones)
    .agg(
        Casos=("Caso", "count"),
        Implementacion=("Implementacion", "mean")
    )
    .reset_index()
)

print("=" * 60)
print("TRUTH TABLE")
print("=" * 60)

print(truth_table)