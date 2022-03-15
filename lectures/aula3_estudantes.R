# se mudar o número de elementos em um vetor quebram tudo - teste 

# Para saber qual é o tipo de um objeto, utilizamos a função typeof()

double <- c(1, 2.5, 4.5) 

typeof(double)


inteiros <- c(1L, 6L, 10L)
typeof(inteiros)

logico <- c(TRUE, FALSE, T, F)
typeof(logico)

caracter <- c("introdução", "ao R", "1")
typeof(caracter)



# quer testar se um objeto é de determinado tipo?
# is.integer(), is.double(), is.logical(), is.character() 

is.integer(inteiros)

is.integer(double)

is.double(inteiros)

is.double(double)


# o R sempre força para o tipo "mais flexível"

tipos <- c(1, "curso")

typeof(tipos)

tipos <- c(1, 3.5)

typeof(tipos)

tipos <- c(3.5, "curso")

typeof(tipos)



#### Instalando Pacotes

# A principal fonte de pacotes R é o CRAN (The Comprehensive R Archive Network)
# Comunidade de desenvolvedores que mantem o R e os pacotes "oficiais".


install.packages("devtools")

#### chamando um pacote


library(devtools)

install_github("silvadenisson/electionsBR")


##### alguns usuários relataram problema com o install_github

### Tentem

install.packages("githubinstall")

#### chamando um pacote


library(githubinstall)

githubinstall("silvadenisson/electionsBR")




# importante pacote

install.packages("sos")



# chamando / abrindo o pacote 

library(sos)


# função 

findFn('correl')

# Folhas de Truques
# para animar https://rstudio.com/resources/cheatsheets/




# Um pouco sobre bancos de dados 

# Referências 

# https://www.ibpad.com.br/blog/analise-de-dados/livros-para-se-aprender-r/
# http://leg.ufpr.br/~fernandomayer/aulas/ce083/computacao-cientifica.html. 
# http://adv-r.had.co.nz  <-- para Hacker 
  

### dados de diversas classes diferentes

### solução ====== data.frame. 
#### Formato de dados mais importante do R


### coluna representa uma variável e cada linha uma observação

#### criando o 

resultado <- data.frame(
  numero_chamada = c(1,2,3,4),
  nomes = c("Cecília" , "Diogo", "Heitor", "João"),
  media = c(10, 3.4, 7.5, 7.5),
  resultado_final = c("APROVADO","REPROVADO","APROVADO","APROVADO"),
  stringsAsFactors = FALSE)



resultado


# A opção stringsAsFactors = FALSE serve para evitar que as strings sejam 
# lidas como vetores de inteiros


str(resultado)



# NOMES DE LINHAS E COLUNAS
#  O data.frame sempre terá rownames e colnames.


rownames(resultado)


colnames(resultado)


# Detalhe: a função names() no data.frame trata de suas colunas, 
# pois os elementos fundamentais do data.frame são seus vetores coluna.


names(resultado)


# O que ocorreria com o data.frame  se o transformássemos em uma matriz?


resultado_dois <- as.matrix(resultado)

str(resultado_dois)

# Perceba que todas as variáveis viraram character! 
# Uma matriz aceita apenas elementos da mesma classe,
# e é exatamente por isso precisamos de um data.frame neste caso.

#  MANIPULANDO DATA.FRAMES


## tudo menos linha 1
resultado[-1, ]


## seleciona primeira linha e segunda coluna (vetor)
resultado[1, 2]

## seleciona primeira linha e primeira coluna (data.frame)
resultado[1, 1, drop = FALSE]

# drop = FALSE força saída como data.frame dependendo pode resultar em um vetor.

## seleciona linha 3, colunas "nomes", "media", "resultado_final"
resultado[3 , c("nomes", "media", "resultado_final")]

resultado
## aumento de nota para o João
resultado[4, "media"] <- 9

resultado


# EXTRA DO DATA.FRAME: SELECIONANDO E MODIFICANDO COM $ E [[ ]]
# Outras formas alternativas de selecionar colunas em um data.frame 
# são o $ e o [[ ]]:
  

## Seleciona coluna nome
resultado$nomes

resultado[["nomes"]]


## Seleciona coluna media
resultado$media

resultado[["media"]]

# Tanto o $ quanto o [[ ]] sempre retornam um vetor como resultado.

# Também é possível alterar a coluna combinando $ ou [[ ]] com <-:
  
resultado
## outro aumento para o Diogo
resultado$media[2] <- 10.0

resultado

## equivalente
resultado[["resultado_final"]][2] <- "APROVADO"

resultado



# Se você quiser garantir que o resultado da seleção seja sempre um data.frame
# use drop = FALSE ou selecione sem a vírgula

## Retorna data.frame
resultado[ ,"media", drop = FALSE]


## Retorna data.frame
resultado["media"]


# Há diversas formas de criar uma coluna nova em um data.frame. 
# O principal segredo é o seguinte: faça de conta que a coluna já exista,
# selecione ela com $, [,] ou [[]] e atribua o valor que deseja.

# Para ilustrar, vamos adicionar ao nosso data.frame 
# resultado mais uma colunas.

#Com $:

resultado$matricula <- c("Renovada", "Renovada", "Em aberto", "Trancada")

  
resultado

#Com [ , ]:

resultado[, "pagamento"] <- c("Pago", "Pago", "Em aberto", "Devendo")

resultado

# Com [[ ]]:
  

resultado[["irmãos"]] <- c(1,0,1,0)

resultado

# Uma última forma de adicionar coluna a um data.frame 
# é, tal como uma matriz, utilizar a função cbind() (column bind).


resultado <- cbind(resultado,
                      cidade_natal = c("Rio de Janeiro", "Niterói", "São Gonçalo", "Rio de Janeiro"),
                      stringsAsFactors = FALSE)

resultado


#### E agora, temos colunas demais, como remover algumas delas?
  
### atribuir o valor NULL a uma coluna
  

resultado$irmãos <- NULL

resultado

### a forma mais segura e universal de remover qualquer
### elemento de um objeto do R é selecionar tudo exceto 
### aquilo que você não deseja. Isto é, selecione todas 
### colunas menos as que você não quer e atribua o resultado 
### de volta ao seu data.frame:
  

## deleta colunas 5 e 6
resultado <- resultado[, c(-5, -6)]

resultado

#### Uma forma simples de adicionar linhas é atribuir 
### a nova linha com <-. Mas cuidado! O que irá acontecer 
###  com o data.frame com a coerção. Se tiver um texto ele
### vai encher tudo com texto. 
  

resultado[5, ] <- c(5,"Jorge", 10.0, "Aprovado" ,  "Niterói")

str(resultado)


### transformar em número novamente
resultado$numero_chamada <- as.numeric(resultado$numero_chamada) 

resultado$media <- as.numeric(resultado$media)

str(resultado)

resultado[6, ] <- data.frame(numero_chamada = 6, nomes = "Samara",
                                media = 9.0, resultado_final = "APROVADO",
                                stringsAsFactors = FALSE) ## aceita lixo

str(resultado)


###amos resgatar o data.frame? 

resultado <- data.frame(
  numero_chamada = c(1,2,3,4),
  nomes = c("Cecília" , "Diogo", "Heitor", "João"),
  media = c(10, 3.4, 7.5, 7.5),
  resultado_final = c("APROVADO","REPROVADO","APROVADO","APROVADO"),
  stringsAsFactors = FALSE)
  
###Também é possível adicionar linhas com rbind():

resultado <- rbind(resultado,
      data.frame(numero_chamada = 5, nomes= "Rose",
                 media = 9.5, resultado_final = "APROVADO",
                 stringsAsFactors = FALSE))

resultado
### Para remover linhas, basta selecionar apenas 
### aquelas linhas que você deseja manter:
  

resultado <- resultado[-4, ]

resultado 



## remove linhas com condicional

resultado <- resultado[resultado$media > 7, ]

resultado

### FILTRANDO LINHAS COM VETORES LOGICOS

### Toque noob do Robaina?  podia ter mudado o nome das mudanças
### e mantido o original... não fez... DECLARA NOVAMENTE

resultado <- data.frame(
  numero_chamada = c(1,2,3,4),
  nomes = c("Cecília" , "Diogo", "Heitor", "João"),
  prova_um = c(10, 3.4, 7.5, 7.5),
  resultado_final = c("APROVADO","REPROVADO","APROVADO","APROVADO"),
  stringsAsFactors = FALSE)

resultado[resultado$media >= 10, ]


resultado[resultado$resultado_final == "APROVADO", ]



### FUNÇÕES DE CONVENIÊNCIA: SUBSET()


subset(resultado, resultado_final == "APROVADO")




###  A função with() permite que façamos operações com as colunas
#### do data.frame sem ter que ficar repetindo o nome do data.frame 
### seguido de $ , [ , ] ou [[]] o tempo inteiro.


## Com o with
with(resultado, (prova_um^3 - prova_um^2)/log(prova_um))



###  APLICANDO FUNÇÕES NO DATA.FRAME: SAPPLY E LAPPLY

### As funções sapply e lapply aplicam uma função em cada
### elemento de um objeto. Deste modo, as funções sapply e lapply 
### aplicam uma função nas colunas de um data.frame.
### A diferença entre uma e outra é que a primeira tenta simplificar 
### o resultado enquanto que a segunda sempre retorna uma lista.

teste <- data.frame(
  prova_um = c(10, 3.4, 7.5, 7.5),
  prova_dois = c(10, 6.0, 7.5, 9.0),
  stringsAsFactors = FALSE)

sapply(teste[1:2], mean)

lapply(teste[1:2], mean)

teste_dois <- data.frame(
  prova_um = c(10, 3.4, 7.5, 7.5),
  prova_dois = c(10, 6.0, 7.5, 9.0),
  stringsAsFactors = FALSE)


## criar coluna para inserir resultado 
teste_dois$média <- with(teste_dois, (prova_um + prova_dois)/2.0)

?with

teste_dois

### AGORA É CONTIGO! 

# Crie o Data.Frame abaixo, inverta o gênero e crie uma nova coluna com o IMC
# Nome        Idade  Sexo  Altura  Massa
# André        23     F     165    76
# Antônio      35     F     177    98
# Bernardo     38     F     181    83
# Bruna        24     M     154    48
# Camila       23     M     160    55
# Daniel       21     F     175    69 
# Wilson       65     F     183    99 

df <- data.frame(Nome = c("André", "Antônio", "Bernardo","Bruna", "Camila", "Daniel", "Wilson"), 
                 Idade = c(23,35,38,24,23,21,65),
                 Sexo = c("F","F","F","M","M","F","F"),
                 Altura = c(165,177,181,154,160,175,183),
                 Massa = c(76,98,83,48,55,69,99),
                 stringsAsFactors = FALSE)

df[["IMC"]] <- with(df,Massa/(Altura/100)^2)
df
### missão

### quanto falta? O estudante precisa alcançar 14 nas duas avaliações. 
# Crie uma coluna indicando quanto o estudante deve tirar na segunda
# avaliação. 

teste_dois[["prova_dois"]] <- NULL
teste_dois[["faltam"]] <- with(teste_dois,14-prova_um)
teste_dois
