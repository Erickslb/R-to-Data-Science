

# Exercício 1
# Crie o Data.Frame abaixo, inverta o gênero e crie uma nova coluna com o IMC
# Nome        Idade  Sexo  Altura  Massa
# André        23     F     165    76
# Antônio      35     F     177    98
# Bernardo     38     F     181    83
# Bruna        24     M     154    48
# Camila       23     M     160    55
# Daniel       21     F     175    69 
# Wilson       65     F     183    99 





# Exercício 2

# No dataframe resultado criar a coluna quanto falta.

### quanto falta? O estudante precisa alcançar 14 nas duas avaliações. 
# Crie uma coluna indicando quanto o estudante deve tirar na segunda
# avaliação. 


#manipulação de dados

# Referências 

# https://www.ibpad.com.br/blog/analise-de-dados/livros-para-se-aprender-r/
# http://leg.ufpr.br/~fernandomayer/aulas/ce083/entrada-dados.html
# https://rpubs.com/rcleoni/estdescritiva 

getwd()  #n diretório onde o R está lendo

# RSTUDIO preferences - general - folder

setwd("/Users/professorrobaina/Google Drive/2022/fgv_R/") # mudar o diretório
## no Mac... cuidado com este passo a passo

getwd()


### O método mais comum de importação de dados para o 
### R, é utilizando a função read.table()

dados <- read.table("dados_aula_4.csv", header = TRUE,
                    sep = ";", dec = ",")
## Argumentos:
  
##  "dados_aula_4.csv": nome do arquivo
##   header = TRUE: significa que a primeira linha do arquivo 
#  deve ser interpretada como os nomes das colunas
## sep = ";": o separador de colunas 
# (também pode ser ",", "\t" para tabulação e "" para espaços)
## dec = ",": o separador de decimais (também pode ser ".")




## o comando acima pode ser substituído por

dados_dois <- read.csv2("dados_aula_4.csv")

str(dados_dois)



file.info("dados_aula_4.csv")# mostra o tamanho do arquivo, data de criação, …



dir()  # mostra todos os arquivos presentes em um diretório 

file.exists("dados_aula_4.csv") # retorna TRUE ou FALSE para a presença de um arquivo

# Removendo um objeto. Serve para coluna.. vetor..
 
rm(dados_dois)



## Vamos ler dados do Excel?
## Carrega o pacote
install.packages("gdata")


library(gdata)

## Leitura diretamente do Excel
dados.xls <- read.xls("dados_aula_4.xls", sheet = "Plan1",
                      header = TRUE, dec = ",")


#### leitura com pacote "mais específico" e adequado ao Windows

install.packages("readxl")


library(readxl)

## Leitura diretamente do Excel
dados.xls <- read_excel("dados_aula_4.xls", sheet = "Plan1",
                       col_names=TRUE)

?read_excel
## Estrutura
str(dados.xls)

## listar o que já possuímos 

ls()


## Carregando dados já disponíveis no R
## O R já possui alguns conjuntos de dados 

## base de dados mtcars
data(mtcars)

### e  o que tem nesta base? 

?mtcars

## Estrutura e visualização do objeto
str(mtcars)

### A função data() lista os conjutos de dados disponíveis.

data()

data(package = .packages(all.available = TRUE))

#### outros pacotes... como utilizar 
library(babynames)

data("babynames")

str(babynames)

rm(babynames)

### e para salvar os dados?

### vamos voltar ao mtcars?

data("mtcars")
str(mtcars)


write.table(mtcars, file = "mtcars.csv")

dir()

ls()

### Por padrão, o arquivo resultante tem colunas 
# separadas por espaço, o separador de decimal é ponto,
# e os nomes das linhas são também incluídos 
# Quer alterar?


write.table(mtcars, file = "mtcarsdois.csv", row.names = TRUE,
            sep = ";", dec = ",")

write.table(mtcars, file = "mtcarstres.csv", row.names = FALSE,
            sep = ";", dec = ",")


#### argumentos
## mtcars : o nome do objeto a ser exportado (matriz ou data frame)
## "mtcars.csv": nome do arquivo a ser gerado. 
## row.names = FALSE: para eliminar o nome das linhas do objeto 
## sep = ";": o separador de colunas (também pode ser ",", "\t" para tabulação
# e "" para espaços)
## dec = ",": o separador de decimais (também pode ser ".")

### Missão... escolha um conjunto de dados legado, analise 
# a estrutura dos dados e salve  o resultado analisando a importância
# dos argumentos

### Vamos animar mais?

### Ler url

lerurl <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/carData/TitanicSurvival.csv", header=TRUE)


# Instalando o pacote 'rio'
install.packages("rio", dependencies = TRUE)

# Carrega o pacote rio
library(rio)

# Carrega um arquivo em .csv no diretorio corrente
### covid19 <- import(file = "covid19_brasil_io.csv")


# Carrega um arquivo em .txt no diretorio corrente
###  covid19 <- import(file = "dados.txt")

# Carrega um arquivo em .dta (Stata) no diretorio corrente
### covid19 <- import(file = "dados.dta")

# Carrega um arquivo em .sav (SPSS) no diretorio corrente
### covid19 <- import(file = "dados.sav")

# leitura de tabelas

titanic <- import("https://vincentarelbundock.github.io/Rdatasets/csv/carData/TitanicSurvival.csv", header=TRUE)

# str Ver a estrutura do arquivo
str(titanic)

# A função "summary()" é bastante interessante para usar com arquivos que tenham números. 
#Ela reúne informações básicas sobre a coluna, como valor mínimo, valor máximo, média, 
# mediana, primeiro quartil e terceiro quartil.

summary(titanic)

# Ver os nomes das colunas do arquivo A função "colnames()" 

colnames(titanic) # vale o names() 


#  Verificar a classe de uma coluna  "typeof()"

typeof(titanic$sex)



# Renomear coluna do arquivo Também podemos usar a função "colnames()"

colnames(titanic)[1] <- "name"

colnames(titanic)


# Ver as primeiras linhas do arquivo, por padrão, a função "head()"


head(titanic)


# Se quiser ver mais linhas ou menos linhas, faça assim: "head(    , 15)" ou "head(     , 3)".

head(titanic, 4)

# Ver as últimas linhas do arquivo A função "tail()"

tail(titanic)

tail(titanic, 2)

# criar uma tabela com a frequencia de uma das colunas

table(titanic$sex)

barplot(table(titanic$sex))

pie(table(titanic$sex))



### exemplo muito bom 
### Fonte Estatística Básica-W. Bussab e P. Morettin
funcionarios <- read.table("milsa.txt", head = T)

funcionarios

str(funcionarios)


### vamos organizar estes dados?

funcionarios$civil <- factor(funcionarios$civil, label = c("solteiro", "casado"), levels = 1:2)

funcionarios

funcionarios$instrucao <- factor(funcionarios$instrucao, label = c("Ensino Fundamental", "Ensino Médio", "Superior"), lev = 1:3, ord= T)
funcionarios$regiao <- factor(funcionarios$regiao, label = c("capital", "interior", "outro"), lev = c(2, 1, 3))

funcionarios
### vamos analisar as linhas novamente?

head(funcionarios)


### quais sào os nomes das colunas?

names(funcionarios)


### dimensão do data.frame

dim(funcionarios)

### não aguenta mais escrever funcionarios? Vamos encurtar 
# a busca pelo elemento? CUIDADO!!!

table(funcionarios$instrucao)

attach(funcionarios)

table(instrucao)


### vamos fazer uma análise univariada? 

is.factor(civil)

civil.tabela <- table(civil)


civil.tabela  ### apenas a frequencia 

prop.table(civil.tabela) ### frequencia relativa


#### Variavel qualitativa ordinal 

instrucao

instrucao.tabela <- table(instrucao)
instrucao.tabela

barplot(instrucao.tabela)


#### Variável quanti discreta

filhos

is.numeric(filhos)


filhos.table <- table(filhos)

filhos.table

plot(filhos.table)

filhos.tabelarelativa <- prop.table(filhos.table)

filhos.tabelarelativa

filhos.fac <- cumsum(filhos.tabelarelativa)

plot(filhos.fac)


### analise os argumentos.. e traga uma inovação 
?plot

plot(filhos.fac, type = "S")


### uma estatística? 

names(filhos.table)[filhos.table == max(filhos.table)] #### moda 

### mediana? Primeiro temos que matar os NA's

 median(filhos, na.rm = T)


### média simples

 mean(filhos, na.rm = T)



### média com extração dos extremos 

 mean(filhos, trim = 0.1, na.rm = T)


### variância 

 var(filhos, na.rm = T)


### desvio padrão

sd(filhos, na.rm = T)


### grande indicador 

cv <-  sd(filhos, na.rm = T)/ mean(filhos, na.rm = T)

cv

###### quantitativa contínua
salario

is.numeric(salario)

stem(salario) ### ramos e folhas

range(salario)

nclass.Sturges(salario) ### qual a lei de Sturges?

salario.table <- table(cut(salario, seq(3.5, 23.5, l = 8))) # atenção ao l 

prop.table(salario.table)


### análise bivariada

### quali x quali

civ.gi.tb <- table(civil, instrucao)
prop.table(civ.gi.tb)

###  relativo por linha
prop.table(civ.gi.tb, margin = 1)


### relativo por coluna
prop.table(civ.gi.tb, margin = 2)

barplot(civ.gi.tb, legend = T)

barplot(civ.gi.tb, beside = T, legend = T)

#### quali x quanti

tapply(salario, instrucao, mean)

tapply(salario, instrucao, sd)


#### quanti x quanti

plot(ano, salario)

################################# Para animar
## https://education.rstudio.com/
## https://www.rstudio.com/solutions/r-and-python/
## 

