import pandas as pd
datos = pd.read_csv("02_Bases_de_datos/docentes.csv")
print(datos)
datos["Calibracion"] = (
datos["Comprension"] >= 4
).astype(int)
print(datos)
datos.to_csv(
"02_Bases_de_datos/docentes_calibrados_python.csv",
index=False
)
