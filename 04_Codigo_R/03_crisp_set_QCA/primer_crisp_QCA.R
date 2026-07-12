library(QCA)

datos <- data.frame(
  A = c(1,1,0,0,1,0),
  B = c(1,0,1,0,1,1),
  C = c(1,1,1,1,0,0),
  Y = c(1,1,0,0,1,0)
)

tabla <- truthTable(
  datos,
  outcome = "Y"
)

tabla
