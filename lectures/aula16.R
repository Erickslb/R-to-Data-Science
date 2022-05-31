### solver no R


### view de várias funções
## https://rpubs.com/hudsonchavs/linearprogramming


### Preferência  

install.packages("Rglpk")

library(Rglpk)

## PPL - problema de programação linear
## max: 2 x_1 + 4 x_2 + 3 x_3
## s.a. 3 x_1 + 4 x_2 + 2 x_3 <= 60
##      2 x_1 +   x_2 + 2 x_3 <= 40
##        x_1 + 3 x_2 + 2 x_3 <= 80
##x_1, x_2, x_3  Reais não negativos
obj <- c(2, 4, 3)  ### coeficientes da funçao objetivos
mat <- matrix(c(3, 2, 1, 4, 1, 3, 2, 2, 2), nrow = 3) # coeficientes da matriz de restricoes
dir <- c("<=", "<=", "<=") # desigualdades
rhs <- c(60, 40, 80)  # restriçào 
max <- TRUE
Rglpk_solve_LP(obj, mat, dir, rhs, max = max)


## PPL Reais e inteiros
## max: 3 x_1 + 1 x_2 + 3 x_3
## s.a.: -1 x_1 + 2 x_2 + x_3   <= 4
##                4 x_2 - 3 x_3 <= 2
##        x_1 - 3 x_2   + 2 x_3 <= 3
## x_1, x_3 Inteiros nao negativos
## x_2 Real nao negativo
obj <- c(3, 1, 3)
mat <- matrix(c(-1, 0, 1, 2, 4, -3, 1, -3, 2), nrow = 3)
dir <- c("<=", "<=", "<=")
rhs <- c(4, 2, 3)
types <- c("I", "C", "I")
max <- TRUE
Rglpk_solve_LP(obj, mat, dir, rhs, types = types, max = max)




## max: 3 x_1 + 1 x_2 + 3 x_3
## s.a.: -1 x_1 + 2 x_2 + x_3 <= 4
##               4 x_2 - 3 x_3 <= 2
##         x_1 - 3 x_2 + 2 x_3 <= 3
###### adicionando restrições ######
##-Inf < x_1 <= 4
## 0 <= x_2 <= 100
## 2 <= x_3 < Inf
####################################
## x_1, x_3 Inteiros nao negativo
## x_2 Real nao negativo

obj <- c(3, 1, 3)
mat <- matrix(c(-1, 0, 1, 2, 4, -3, 1, -3, 2), nrow = 3)
dir <- c("<=", "<=", "<=")
rhs <- c(4, 2, 3)
types <- c("I", "C", "I")
max <- TRUE

#### agregando os limites 
bounds <- list(lower = list(ind = c(1L, 3L), val = c(-Inf, 2)),
               upper = list(ind = c(1L, 2L), val = c(4, 100)))
### Para fazer um número inteiro ser tratado como objeto inteiro, deve-se utilizar a letra L após o número

Rglpk_solve_LP(obj, mat, dir, rhs, bounds, types, max)


#####  PROBLEMA
#  Função-objetivo – max   
#       x1 + 1.5x2  
#s.a.  2x1 +2x2 <= 160
#      x1 + 2x2 <= 120
#     4x1 + 2x2 <= 280
# x1, x2 > 0


obj <- c(1,1.5)
mat <- matrix(c(2,1,4,2,2,2), nrow = 3)
dir <- c("<=", "<=", "<=")
rhs <- c(160,120,280)
max <- TRUE
Rglpk_solve_LP(obj, mat, dir, rhs, max = max)


##### PROBLEMA 2

## Para realizar a instalação de terminais de computardo
## , uma empresa pode usar os esforços de dois funcioários:
# Pedro e João. O salário de Pedro é R$ 25,00 por hora e
# o de João é de R$ 40,00 por hora. Pedro consegue instala
# r um terminal em meia hora (0,5 hora) e João em 15 minutos
# (0,25 hora). É necessário instalar um total de 40 terminais
# , sendo que Pedro deve instalar pelo menos 10 deles. 
# Sabe-se que nenhum dos dois funcionários pode trabalhar mais do
# que 8 horas em um dia. Deseja-se minimizar o custo total da
# instalação.

#  Função-objetivo – min   
#     25x1 + 40x2  
#s.a.  2x1 +2x2 = 40
#      2x1 >= 10
#       x1  <= 8
#       x2  <= 8

obj <- c(25,40)
mat <- matrix(c(2,2,1,0,4,0,0,1), nrow = 4)
dir <- c("==", ">=", "<=", "<=")  ### pra garantir igual equivalência
rhs <- c(40,10,8,8)
max <- FALSE  ### minimizar
Rglpk_solve_LP(obj, mat, dir, rhs, max = max)






# https://rstudio-pubs-static.s3.amazonaws.com/176768_ec7fb4801e3a4772886d61e65885fbdd.html
# https://github.com/walmes
# https://www.tiagoms.com/post/mapa/
# https://cran.r-project.org/web/packages/googleVis/vignettes/googleVis_examples.html
# https://bookdown.org/robinlovelace/geocompr/adv-map.html
## cuidado com o geobr
# https://beatrizmilz.com/blog/2020-07-27-criando-mapas-com-os-pacotes-tidyverse-e-geobr/

install.packages("maps") #mapas simples, eixos, escala, cidades
library(maps)

#### primeira análise

par(mar=c(1,1,1,1))
map("world","Brazil")
map.axes() ## latitude x longitude
### inserir escala
map.scale(ratio = F, cex = 0.7)
### inserir escala com aproximação
map.scale(ratio = T, cex = 0.7)

### Dá para usar qualquer elemento de plot do base R (points,
# abline, text, legend) e os parâmetros de par() como pch
# (o símbolo), cex (o tamanho do símbolo), lty, lwd (tipo e
# largura de linha), font (1= normal, 2= itálica, 3= bold).


abline(h =0 ,  v = 2)
### abline gerará uma linha


### agregando valor ao mapa
map("world","Brazil", fill=T, col="grey90", add =F) # cuidado com o add - coloquei F
map.axes()
map.scale(ratio=F, cex=0.7)
abline( h = 0,  v = 2)


?map.cities  ### analisar o potencial

### descubra de onde coletou os dados de população
map.cities(country = "Brazil",minpop = 2000000,pch=10, cex=1.2)# pacote maps



install.packages("googleVis") ## excelente
## https://cran.r-project.org/web/packages/googleVis/vignettes/googleVis_examples.html

library(googleVis)


br <- data.frame(
  Estado = c("São Paulo", "Minas Gerais", "Rio de Janeiro", "Bahia",
             "Rio Grande do Sul", "Paraná", "Pernambuco", "Ceará",
             "Pará", "Maranhão", "Santa Catarina", "Goiás", "Paraíba",
             "Amazonas", "Espírito Santo", "Rio Grande do Norte",
             "Alagoas", "Mato Grosso", "Piauí", "Distrito Federal",
             "Mato Grosso do Sul", "Sergipe", "Rondônia", "Tocantins",
             "Acre", "Amapá", "Roraima"),
  População = c(44396484L, 20869101L, 16550024L, 15203934L, 11247972L,
                11163018L, 9345173L, 8904459L, 8175113L, 6904241L,
                6819190L, 6610681L, 3972202L, 3938336L, 3929911L,
                3442175L, 3340932L, 3270973L, 3204028L, 2914830L,
                2651235L, 2242937L, 1768204L, 1515126L, 803513L,
                766679L, 505665L),
  stringsAsFactors = FALSE)

br$População <- log10(br$População)
str(br)

head(br$População, 6)

breaks <- seq(floor(min(br$População)),
              ceiling(max(br$População)),
              by = 0.5)


########

install.packages("RColorBrewer") # pacote para cores
library(RColorBrewer)


## RColorBrewer temos acesso a várias paletas de cores.
# Para consultá-las, basta utilizar o comando
display.brewer.all()

# cores interessantes para mapas
pal <- brewer.pal(n = length(breaks), name = "Blues")

# Dicionário para os intervalos de classe e cores associadas.
cl <- sprintf("{values:[%s],\n colors:[%s]}",
              paste0(sprintf("'%0.1f'", breaks), collapse = ", "),
              paste0(sprintf("'%s'", pal), collapse = ", "))
cat(cl)


map <- gvisGeoChart(
  data = br,
  locationvar = "Estado",
  colorvar = "População",
  options = list(title = "Testes",
                 region = "BR",
                 displayMode = "regions",
                 resolution = "provinces",
                 colorAxis = cl,
                 width = 700,
                 height = 500))
plot(map)


### Missão  - criar mapa com o número de escolas por estado


#######################
#### daqui pra baixo é tudo do docs deles. 
## É tão importante que quando alguém consegue algo sem ele comunica
install.packages("leaflet")  #mapas interativos

library(leaflet)

estacoes <- data.frame(estacao = c("Saúde", "Santa Cruz", "Paraíso"),
                       lat = c(-23.6185, -23.5989, -23.5765),
                       long = c(-46.6393, -46.6366, -46.6408))

leaflet(estacoes) %>%
  addTiles() %>%
  addMarkers(~long, ~lat, label = ~as.character(estacao))


### trabalho padrão... marque um endereço de interesse
#  https://www.google.com/maps



### testes com o leaf
### https://rstudio.github.io/leaflet/markers.html


data(quakes) # The data set give the locations of 1000 seismic events of MB > 4.0.
### The events occurred in a cube near Fiji since 1964.

# Show first 20 rows from the `quakes` dataset
leaflet(data = quakes[1:20,]) %>% addTiles() %>%
  addMarkers(~long, ~lat, popup = ~as.character(mag), label = ~as.character(mag))



### https://rstudio.github.io/leaflet/popups.html

content <- paste(sep = "<br/>",
                 "<b><a href='http://www.samurainoodle.com'>Samurai Noodle</a></b>",
                 "606 5th Ave. S",
                 "Seattle, WA 98138"
)


leaflet() %>% addTiles() %>%
  addPopups(-122.327298, 47.597131, content,
            options = popupOptions(closeButton = FALSE)
  )


### missão 4 - Marque a FGV
content <- paste(sep = "<br/>",
                 "<b><a href='https://epge.fgv.br/'>EPGE</a></b>",
                 "Praia de Botafogo, 190 ",
                 " 11º andar"
)

leaflet() %>% addTiles() %>%
  addPopups(-43.18019, -22.93980, content,
            options = popupOptions(closeButton = FALSE)
  )



### https://rstudio.github.io/leaflet/shapes.html

cities <- read.csv(textConnection("
City,Lat,Long,Pop
Boston,42.3601,-71.0589,645966
Hartford,41.7627,-72.6743,125017
New York City,40.7127,-74.0059,8406000
Philadelphia,39.9500,-75.1667,1553000
Pittsburgh,40.4397,-79.9764,305841
Providence,41.8236,-71.4222,177994
"))

leaflet(cities) %>% addTiles() %>%
  addCircles(lng = ~Long, lat = ~Lat, weight = 1,
             radius = ~sqrt(Pop) * 30, popup = ~City
  )

### missão 5 - marque três capitais e sua população
## https://pt.wikipedia.org/wiki/Lista_de_capitais_do_Brasil_por_popula%C3%A7%C3%A3o

cities <- read.csv(textConnection("
City,Long,Lat,Pop
Sao Paulo,-46.65384,-23.55901,12325232
Rio de Janeiro,-43.18019,-22.93980,6747815
Brasilia,-47.87348,-15.78053,3055149
"))

leaflet(cities) %>% addTiles() %>%
  addCircles(lng = ~Long, lat = ~Lat, weight = 1,
             radius = ~sqrt(Pop) * 30, popup = ~City
  )



