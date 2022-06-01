#### missão 1

library(leaflet)
library(readxl)
library(tidyverse)

setwd("your directory")

#### google com idh

library(googleVis)


br <- read_excel("idh.xlsx")

str(br)

?type_convert
### vou me apropriar 
br <- type_convert(br,trim_ws=TRUE,col_types = cols(Estados=col_character(),`IDH-2020`=col_number()),locale = locale(decimal_mark = ","))



breaks <- seq(floor(min(br$`IDH-2020`)),
              ceiling(max(br$`IDH-2020`)),
              by = 0.5)


########

library(RColorBrewer)


# cores interessantes para mapas
pal <- brewer.pal(n = length(breaks), name = "Blues")

# Dicionário para os intervalos de classe e cores associadas.
cl <- sprintf("{values:[%s],\n colors:[%s]}",
              paste0(sprintf("'%0.1f'", breaks), collapse = ", "),
              paste0(sprintf("'%s'", pal), collapse = ", "))

?gvisGeoChart

map <- gvisGeoChart(
  data = br,
  locationvar = "Estados",
  colorvar = "IDH-2020",
  options = list(title = "Testes",
                 region = "BR",
                 displayMode = "regions",
                 resolution = "provinces",
                 colorAxis = cl,
                 width = 700,
                 height = 500))
plot(map)




#### leaflet 


meus_dados <- read_excel("datadi.xlsx", "Comparativo")

dados <- as_tibble(meus_dados)

leaflet(dados) %>% 
  addTiles() %>%
  addMarkers(lng = ~Longitude, lat = ~Latitude,  popup = ~Município)



### Perla - missão  
br <- read_excel("datadi.xlsx", sheet = "Comparativo")

map <- gvisGeoChart(
  data = br,
  locationvar = "%",
  colorvar = "março",
  options = list(title = "Testes",
                 displayMode = "countries",
                 width = 700,
                 height = 500))
plot(map)

