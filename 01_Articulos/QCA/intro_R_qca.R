############################################################
# SESIÓN 1
# Introducción a R para QCA
############################################################

############################################################
# 1. Operaciones básicas
############################################################

5 + 5
9 - 7
8 * 9
5 ^ 2


############################################################
# 2. Objetos
############################################################

# Los objetos permiten guardar resultados para reutilizarlos.
# La asignación se realiza con <-

suma1 <- 5 + 5
suma1

suma1 <- 8 + 9
suma1

suma1 * 2

objeto1 <- "presidencial"
objeto1

############################################################
# 3. Vectores
############################################################

# Un vector almacena varios valores del mismo tipo.

vector1 <- c(9, 5, 3, 7)

vector1
vector1[4]
vector1[2:4]

############################################################
# 4. Data frames
############################################################

# Un data frame es una tabla:
# filas = casos
# columnas = variables

partido <- c("Morena","PAN","PRI",
             "PVEM","PT","MC","PRD")

curules <- c(200,114,70,40,36,25,15)

df <- data.frame(
  partido,
  curules)

df

############################################################
# 5. Funciones
############################################################

# Matemáticas

sqrt(25)
log(100)
log10(100)
exp(2)

# Estadística descriptiva

mean(curules)
median(curules)
sd(curules)
sum(curules)
min(curules)
max(curules)

# Utilidad

length(curules)
sort(curules)
sort(curules, decreasing = TRUE)

############################################################
# 6. Valores perdidos
############################################################

vector2 <- c(vector1, NA)

mean(vector2)
mean(vector2, na.rm = TRUE)

na.omit(vector2)

############################################################
# 7. Paquetes
############################################################

# Instalar (solo una vez)

install.packages("QCA")
install.packages("SetMethods")
install.packages("tidyverse")
install.packages("venn")

# Cargar (en cada sesión)

library(QCA)
library(SetMethods)
library(tidyverse)
library(venn)

############################################################
# 8. Diagramas de Venn y QCA
############################################################

DES <- c("Chile","Uruguay",
         "Costa Rica","México")

DEM <- c("Chile","Uruguay",
         "Costa Rica","Argentina")

STB <- c("Chile","Uruguay",
         "México","Perú")

sets_qca <- list(
  DES = DES,
  DEM = DEM,
  STB = STB
)

venn(
  sets_qca,
  zcolor = "style", # Paleta de colores predefinida
  opacity = 0.35,
  box = FALSE,
  ilabels = TRUE)

############################################################
# 9. Operaciones de conjuntos
############################################################

intersect(DES, DEM)

union(DES, DEM)

universo <- c("Chile","Uruguay",
              "Costa Rica","México",
              "Argentina","Perú","Bolivia")

no_DEM <- setdiff(universo, DEM)

intersect(DES, no_DEM)

############################################################
# 10. Conjuntos y lenguaje de QCA
############################################################

# X*Y  = intersección
DES_DEM <- intersect(DES, DEM)

# X+Y = unión
DES_o_DEM <- union(DES, DEM)

# ~X = ausencia
no_DEM

#=========================================
#Cargamos el paquete VennDiagram

#Creamos el diagrama para dos conjuntos con draw.pairwise.venn
#area1 y area2 son el n?mero de elementos contenidos en el conjunto
#cross.area se refiere al n?mero de casos que son miembros de ambos cojuntos
#cross.area es la intersecci?n de los conjuntos

draw.pairwise.venn(area1 = 7, 
                   area2 = 20, 
                   cross.area = 7)

grid.newpage()

#Con la instrucci?n category indicamos el nombre de los conjuntos

draw.pairwise.venn(area1 = 7,
                   area2 = 20, 
                   cross.area = 7,
                   category = c("A", "B"))
grid.newpage()

#Con la instrucci?n fill determino el color del gr?fico

draw.pairwise.venn(area1 = 20, 
                   area2 = 5, 
                   cross.area = 5, 
                   fill=c("#99FFCC", 
                          "#66CCFF"))

grid.newpage()

#Con lty="blank" borro los contornos de los conjuntos

draw.pairwise.venn(area1 = 20, 
                   area2 = 5, 
                   cross.area = 5, 
                   fill=c("#99FFCC", 
                          "#66CCFF"), 
                   lty="blank")

grid.newpage()

#Para graficar tres conjuntos a la vez utilizo draw.triple.venn
#Aqu? las intersecciones estan indicadas por "n". 
#Por ejemplo n12=2 indica que entre el conjunto 1 y 2 hay una intersecci?n de dos casos
#Mientras que en la intersecci?n n13 se encuentran 7 elementos

draw.triple.venn(area1 = 10, 
                 area2 = 20, 
                 area3 = 15, 
                 n12=2,
                 n23=3, 
                 n13=7,
                 n123=2,
                 fill= c("#99FFCC", 
                         "#66CCFF", 
                         "#9999FF"), 
                 lty="blank",
                 category = c("A", "B",
                              "C"))

grid.newpage()

#Cuando son cuatro conjuntos se utiliza draw.quad.venn
draw.quad.venn(area1=72,area2=86, 
               area3=50,area4 =52, 
               n12=44,n23=38, 
               n13=27, n14= 32,
               n24=32,n34=20, 
               n123=18,n124=17,
               n234=13,n134=11, 
               n1234=6, 
               category=c("A","B","C","D"), 
               fill=c("#99FFCC","#66CCFF",
                      "#9999FF","#FFFFCC"),
               lty="blank")

grid.newpage()

#agregando lineas punteadas al contorno

draw.quad.venn(area1=72, area2=86,
               area3=50, area4 =52,
               n12=44, n23=38,
               n13=27, n14= 32,
               n24=32, n34=20, 
               n123=18, n124=17, 
               n234=13, n134=11, 
               n1234=6, 
               color="black", 
               category=c("A","B","C","D"),
               fill=c("#99FFCC","#66CCFF",
                      "#9999FF","#FFFFCC"),
               lty="dashed")


grid.newpage()

#TITULOS DEL DIAGRAMA

diagrama_venn<-draw.quad.venn(area1=72, 
                              area2=86, area3=50,
                              area4 =52, n12=44, 
                              n23=38, n13=27,
                              n14= 32,n24=32, 
                              n34=20, n123=18, 
                              n124=17, n234=13,
                              n134=11, n1234=6,
                              color="black", 
                              category=c("A","B",
                                         "C","D"),
                              fill=c("#99FFCC","#66CCFF",
                                     "#9999FF","#FFFFCC"),
                              lty="dashed")

#Cargamos el paquete gridExtra
install.packages("gridExtra")
library(gridExtra)
#Especificamos el titulo en el argumento "top" y el subt?tulo en "bottom"
grid.arrange(gTree(children = diagrama_venn),
             top = "Diagrama de Venn",
             bottom = "Cuatro conjuntos")

