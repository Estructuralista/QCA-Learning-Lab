# ---------------------------------------
# EJEMPLO 1
# 1Leer una base de datos
# ---------------------------------------

datos <- read.csv("02_Bases_de_datos/docentes.csv")

print(datos)

# 2. alibrar variable 

datos$Calibracion <- ifelse(
    datos$Comprension >=4,
    1,
    0
)
print(datos)

# 3. guardar La base de datos calibrada
write.csv(
datos,
"02_Bases_de_datos/docentes_calibrados.csv",
row.names = FALSE
)