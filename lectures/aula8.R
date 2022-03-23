# questão da aula anterior... já guardar com os nomes na primeira coluna

data("mtcars")

library(tidyverse)

mtcars

mtcars_tbl <- mtcars %>% as_tibble()


mtcars_tbl <- rownames_to_column(mtcars, var = "car") %>% as_tibble()

mtcars_tbl

# https://blog.curso-r.com/posts/2017-07-24-janitor/
# https://blog.dominodatalab.com/manipulating-data-with-dplyr/
# https://rstudio-pubs-static.s3.amazonaws.com/221386_a6b7054b6536462fb3ba49e0341142e5.html
# https://courses.cs.ut.ee/MTAT.03.183/2017_fall/uploads/Main/dplyr.html


### Gabarito
# Análise do pacote

install.packages("dplyr")

library(dplyr)

starwars

starwars %>% 
  filter(species == "Droid")

starwars %>% 
  select(name, ends_with("color"))


starwars %>% 
  mutate(name, IMC = mass / ((height / 100)  ^ 2)) %>%
  select(name:mass, IMC)



starwars %>% 
  arrange(desc(mass))


starwars %>%
  group_by(species) %>%
  summarise( n = n(), mass = mean(mass, na.rm = TRUE)) %>%
  filter( n > 1, mass > 50)


#####  mais um exemplo 


library(tidyverse)

dados <- tibble(nome = c("Cecília" , "Diogo", "Heitor", "João", "Rose", "Gloria", "Mario", "Maria"),
                sexo = c("F", "M", "M", "M", "F","F", "M", "F"),
               idade = c( 20, 60 , 30, 41 , 50 , 60, 55 , 33 ),
            estatura = c( 180, 200,150, 152, 160, 150, 152, 177))
dados


### testando o select

select(dados, idade)

### testando o select

select(dados, idade, estatura )

select(dados , -estatura )

### testando o filter

filter(dados , estatura > 160)

filter(dados, estatura > 160, idade > 30)

#### ou 

filter(dados, estatura > 160 & idade > 30 )


#### organizar com o arrange? 


arrange(dados, idade)

arrange(dados, sexo, idade)

### criar/modificar colunas?

### cuidado que aqui a sintaxe é igual mesmo
dados <- dados %>% mutate(estatura = estatura/ 100 )

### quando não há a coluna é criada
dados <- dados %>% mutate(idade_em_meses = idade*12 )

dados

### agregar valores?
summarise(dados, media_estatura = mean(estatura))

### olhar apenas para grupos específicos?  group_by

dados_por_genero = group_by(dados, sexo)

summarise(dados_por_genero, media_estatura = mean(estatura))

### como reescrever as duas linhas acima utilizando o operador pipe?
dados %>% group_by(sexo) %>% summarise(media_estatura = mean(estatura))

### voltando ao exemplo

summarise(dados_por_genero, 
          media_estatura = mean(estatura), 
          numero_de_pessoas = n())  




####  animando mais umas ideias


dados <- tibble(nome = c("Cecília" , "Diogo", "Heitor", "João", "Rose", "Gloria", "Mario", "Maria"),
                sexo = c("F", "M", "M", "M", "F","F", "M", "F"),
                idade = c( 20, 60 , 30, 41 , 50 , 60, 55 , 33 ),
                estatura = c( 180, 200,150, 152, 160, 150, 152, 177))

dados2 <- tibble(nome = c("Jorge" , "Carlos", "Heitor",  "Maria"),
                     peso=c( 120, 100, 90, 80))


### full_join - junta todo mundo
dados3 <- dados %>% full_join(dados2, by="nome")
dados3
###  cria um novo inserindo todo mundo

### juntou apenas os que já tem na "esquerda" com informações para esses dados
dados4 <- dados %>% left_join(dados2, by="nome")
dados4
### olhou para dados

### juntou apenas os da "direita"
dados5 <- dados %>% right_join(dados2, by="nome")
dados5
### olhou para dados


### referencias

# https://livro.curso-r.com/7-3-tidyr.html
# https://tidyr.tidyverse.org/reference/gather.html
# http://sillasgonzaga.com/material/curso_visualizacao/breve-introducao-ao-r.html#tidyr
# https://www.rladiesgyn.com/post/pacote-tidyr


### função  para alterar 
## o layout dos valores em uma tabela: 

library(dplyr)
library(tidyr)



## exemplo https://tidyr.tidyverse.org/reference/pivot_longer.html
relig_income

##3 transformar as colunas em linhas 
relig_income %>%
  pivot_longer(!religion, names_to = "income", values_to = "count")




## exercício da Base Dados. 

### Mesma 1 - gráfico
### Uma tabela sumarizada ... com contas? 





