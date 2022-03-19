# Precisamos manipular dados!!

# https://curso-r.github.io/ragmatic-book/transformacao-de-dados.html
# https://cran.r-project.org/web/packages/dplyr/vignettes/dplyr.html
#  https://livro.curso-r.com/7-1-tibbles.html
#  https://r4ds.had.co.nz/tibbles.html

# https://livro.curso-r.com/7-2-dplyr.html

#### melhor instalar o tidyverse install.packages("tibble")

library(tibble)

data(mtcars)

# Há duas formas de criar uma tibble. 
# - transformar um data frame em tibble utilizando a função as_tibble().

# isso retira o nome das linhas
as_tibble(mtcars)

# ao contrário dos data frames, tibbles não utilizam nome nas linhas.

mtcars

# - a segunda forma de criar uma tibble é a partir de 
# vetores individuais, utilizando a função tibble()

# aula 3 

resultado <- data.frame(
  numero_chamada = c(1,2,3,4),
  nomes = c("Cecília" , "Diogo", "Heitor", "João"),
  media = c(10, 3.4, 7.5, 7.5),
  resultado_final = c("APROVADO","REPROVADO","APROVADO","APROVADO"),
  stringsAsFactors = FALSE)

resultado_tibble <- tibble(
  numero_chamada = c(1,2,3,4),
  nomes = c("Cecília" , "Diogo", "Heitor", "João"),
  media = c(10, 3.4, 7.5, 7.5),
  resultado_final = c("APROVADO","REPROVADO","APROVADO","APROVADO")
)


resultado_tibble

# add_row() e add_column(): para adicionar linhas e colunas a uma tibble;

# rowid_to_column(): cria uma coluna com um id
# numérico e sequencial para as linhas, começando de 1

mtcars %>% 
  rowid_to_column()


# has_rownames(): verifica se um data frame possui linhas nomeadas.
mtcars %>% 
  has_rownames()

# remove_rownames(): remove o nome das linhas de um data frame.
mtcars %>% 
  remove_rownames() ### removeu a primeira coluna 


### Atenção!!!
# rownames_to_column(): transforma o nome das linhas em uma coluna.
mtcars %>% 
  rownames_to_column(var = "modelo") %>% 
  head(6)

####### dplyr é o pacote mais útil para realizar transformação de dados

### principais funções do dplyr
  
### select() - seleciona colunas
### arrange() - ordena a base
### filter() - filtra linhas
### mutate() - cria/modifica colunas
### group_by() - agrupa a base
### summarise() - sumariza a base


# entra tibble e sai tibble
# uso intensivo do %>% 

### já instalou?
install.packages("dplyr")

library(dplyr)

#### vamos para mtcars novamente?
testes_dplyr <- as_tibble(mtcars) 

testes_dplyr %>%
      head(6)
# para selecionar colunas? select()

select(testes_dplyr, mpg)

select(testes_dplyr, mpg, hp) 


### usar o pipe e salvar o arquivo 

testes_dplyr %>% select( mpg, hp)

#### ainda mais colunas?  utilize o : 

select(testes_dplyr, mpg, hp:vs)

# o dplyr possui o conjunto de funções auxiliares
# muito úteis para seleção de colunas. As principais são:
  
# starts_with(): para colunas que começam com um texto padrão
# ends_with(): para colunas que terminam com um texto padrão
# contains(): para colunas que contêm um texto padrão

select(testes_dplyr, starts_with("c"))

select(testes_dplyr, ends_with("t"))

select(testes_dplyr, contains("e"))

# para retirar colunas da base, base acrescentar um - antes da seleção

testes_dplyr_dois <- testes_dplyr %>%
  select(-drat, -carb, -am)

testes_dplyr_dois

# para ordenar linhas, utilizamos a função arrange()

testes_dplyr_dois <- arrange(testes_dplyr_dois, cyl)

testes_dplyr_dois <- testes_dplyr_dois %>% arrange( cyl) ## faz a mesma


testes_dplyr_dois

# se quiser em ordem decrescente 

testes_dplyr_dois <- arrange(testes_dplyr_dois, desc(cyl))

testes_dplyr_dois

### para mais colunas

testes_dplyr_dois <- arrange(testes_dplyr_dois, mpg, cyl)

testes_dplyr_dois

testes_dplyr_dois <- arrange(testes_dplyr_dois, cyl, mpg)
### ordenou a cyl primeiro e depois a mpg "dentro"

testes_dplyr_dois

### Para filtrar valores  filter()

testes_dplyr_dois %>%
           filter(mpg > 30 )


### mostrar apenas duas colunas
 
 testes_dplyr_dois %>%
   filter(mpg > 30) %>%
   select(mpg, cyl)

### filtrar com condição em mais de uma coluna

 testes_dplyr_dois

 testes_dplyr_dois %>%
   filter(mpg > 30, hp > 70)

### podemos filtrar usando variável 
 
 testes_dplyr_dois %>%
   filter(gear %in% c(5)) ### pode usar com caracter 
 

library(babynames)

data("babynames")


###  sumarizando a base 

bebes <- babynames %>% 
      filter(year == 1980) %>% 
      summarize(total_nascimento = sum(n, na.rm = TRUE)) 

bebes

###  como fazer por anos?

# group_by()

###  agrupar total por ano de nascimento 
bebes_ano <- babynames %>% 
  group_by(year) %>% 
  summarize(total_nascimento = sum(n, na.rm = TRUE)) 

bebes_ano %>% filter( year >= 1980)

###  agrupar total por nome
bebes_nome <- babynames %>% 
  group_by(name) %>% 
  summarize(total_nascimento = sum(n, na.rm = TRUE))

bebes_nome
# fazendo uma pequena análise

# essa função encontra o índice de algum valor
?match

# qual nome aparece mais vezes?
max_index <- match(max(bebes_nome$total_nascimento), bebes_nome$total_nascimento)
bebes_nome[max_index,]

  

#####  Missão ... 

data("starwars")

starwars
?summarise
#### propor três "mudanças" 
# uma necessariamente com o summarise
head(starwars)
# select() - seleciona colunas
selected_starwars <- starwars %>% select(name, height, mass, species)
head(selected_starwars)
# arrange() - ordena a base
selected_starwars <- selected_starwars %>% arrange(height)
head(selected_starwars)
# filter() - filtra linhas
selected_starwars <- selected_starwars %>% filter(height >= 100)
# mutate() - cria/modifica colunas
?mutate
selected_starwars <- selected_starwars %>% mutate(height_in_meters = height/100)
head(selected_starwars)

### dropando na's na coluna massa e na coluuna species
selected_starwars <- selected_starwars[!is.na(selected_starwars$species),]
selected_starwars <- selected_starwars[!is.na(selected_starwars$mass),]

# group_by() - agrupa a base
# summarise() - sumariza a base
selected_starwars %>% group_by(species) %>% summarise(mass_of_species = sum(mass, na.rm = TRUE))
#ou
selected_starwars %>% filter(species == "Droid") %>% summarize(number_of_droids = n())
## retirar linhas da base com NA - não teve entrada 
## star_sem_na <- starwars[!is.na(starwars$species),]

## Raphael Levy
sw_humans <- starwars %>% 
  filter( species == "Human") %>% 
  summarize(total_humanos = n() )

sw_humans
