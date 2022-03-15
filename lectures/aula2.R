

# classes de objetos e um pouco mais de lógica...  

# Referências 

# https://www.ibpad.com.br/blog/analise-de-dados/livros-para-se-aprender-r/
# http://leg.ufpr.br/~fernandomayer/aulas/ce083/computacao-cientifica.html. 
# http://adv-r.had.co.nz  <-- para Hacker 
# http://curso-r.github.io/posts/aula02.html <-- excelente para o 
# http://www.estatisticacomr.uff.br/?p=209 <-- lógica



# vamos aumentar a quantidade de dados nas atribuições? 
# para tanto introduziremos a função combine c 

exe <- c( 3 , 4 , 5 )

exe

# para saber a classe do número precisa utilizar a função class


class( exe )

# numeric aceita números inteiros e decimais 

# se você inserir um número em decimal todos serào considerados decimais

exe <- c( 3.1 , 4 , 5 )

exe

class( exe )

# você também pode inserir caracteres 

exe_carac <- c( "introdução" , "ao" , "R")

exe_carac

class( exe_carac )


#######  classe para variáveis categóricas 

exe_cat <- factor( c("sim", "não", "sim", "sim", "não", "não" ))

exe_cat

table(exe_cat) ### tabela de frequências


class( exe_cat )

#######  cuidado com os espaços 

exe_cat <- factor( c("sim ", "não", "sim", "sim", "não", "não " ))

exe_cat

length(exe_cat) # retorna o tamanho do vetor



#### Tarefa 

### 1. Guarde em um objeto chamado nome uma string 
# contendo o seu nome completo.
nome <- "Erick Brito"
### 2. Guarde em um objeto chamado cidade o nome da 
# cidade onde você mora. Em seguida, guarde em um objeto
#chamado estado o nome do estado onde você mora. 
# Usando esses objetos, resolva os itens abaixo:
cidade <- "Cocal dos Alves"
estado <- "PI"
# a. Utilize a função nchar() para contar o número 
# de caracteres em cada cada string.
nchar(nome)
# b. Interprete o resultado do seguinte código:

paste(cidade, estado)

# c. Interprete o resultado do seguinte código:

paste(cidade, estado, sep = " - ")

# d. Desafio. Como você reproduziria o
#mesmo resultado do item (b) sem utilizar o argumento sep?
paste( cidade, "-" , estado)
# e. Qual a diferença entre as funções paste() e paste0()?

paste0(cidade, estado)




### operação com vetores


u <- c(10,20,30)
v <- c(1,2,3)


###  Soma de vetores
u+v

### Subtração de vetores
u-v

### Multiplicação de vetores
v*u

### Divisão de vetores
u/v

#### Funções com vetores
### somar todos os elementos em um vetor numérico

sum(v)

## Produto de elementos:

### Máximo e Mínimo

max(v)

min(u)

###Variancia

var(u)


### Desvio Padrão

sd(v)


#######  classe matriz 

matriz <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 3,  ncol = 2) 

matriz


matriz_a <- matrix( 
  seq(1, 100),  ### cria elementos de 1 até 100
  ncol = 10,
  nrow = 10) 

matriz_a

### podemos criar uma matriz preenchendo primeiro as linhas 
# e depois as colunas. Para isso, 
# basta definirmos o argumento byrow = TRUE


matriz_b <- matrix( 
  seq(1, 100), 
  ncol = 10,
  nrow = 10,
  byrow = TRUE)

matriz_b

### cuidado com o R ... ele vai reaproveitar dados 

matriz_c <- matrix( 
  seq(1, 9), 
  ncol = 2,
  nrow = 5)

matriz_c

#### Operações com matrizes

matriz_a * 10

### somar todos os elementos

sum(matriz_a)

### transposta

t(matriz_a)

### calcular o determinante

det(matriz_a)


### retorna elementos da diagonal principal

diag(matriz_a)

###  soma das linhas da matriz

rowSums(matriz_a)


###  média  das linhas da matriz

rowMeans(matriz_a)

### soma das colunas da matriz

colSums(matriz_a)

###  média  das colunas da matriz

colMeans(matriz_a)


##### tarefa

# Crie as matrizes
 
# A = | 1  2  4  |  e B = | 3  5  7 |
#     | 3  -1 2  |        | 0  4  8 |
#     | 6  -2 3  |        | 5  5  1 |

A <- matrix(c(1,3,6,2,-1,-2,4,2,3), nrow = 3, ncol= 3)
A
B <- matrix(c(3,0,5,5,4,5,7,8,1), nrow = 3, ncol = 3)
B

# crie as matrizes A e B e realize as seguintes operações:
  
# a) A+B
A+B
# b) A-B
A-B
# c) A*B
A%*%B


#### cuidado com o *  não é produto matricial 
#### o que esperamos no padrão é o %*%


####### classe matriz -- criar um banco mais elaborado 

resultado <- data.frame(
  numero_chamada = c(1,2,3,4),
  nomes = c("Cecília" , "Diogo", "Heitor", "João"),
  media = c(10, 3.4, 7.5, 7.5),
  resultado_final = c("APROVADO","REPROVADO","APROVADO","APROVADO")
)

resultado

dim(resultado) # retorna a dimensão do objeto

nrow(resultado) # retorna o número de linhas

ncol(resultado) # retorna o número de colunas





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

# acessar elementos em uma lista

exe

exe[2]

resultado

resultado[1,2]  # linha coluna



#### tarefa 

# Crie três vetores e depois "una" os três em um mesmo data frame. 
# por exemplo, últimas disciplinas cursadas, nome do professor, nota.
materia = c("Probabilidade", "EDO", "Análise Real")
professor = c("Paulo Cezar", "Bebel", "Paulo Sad")
nota = c(8.2,8.5,8.5)

materias = data.frame(materia, professor, nota)
materias
##### fique atento

#### NaN quer dizer “Not a number”, ele aparece quando o resultado
# de uma expressão matemática não está definida.

#### NA significa “Not Available” e simboliza informação ausente/faltante.
# usamos NA principalmente para representar dados faltantes em bancos de dados.

#### NULL significa vazio, “nada”. Quando queremos que uma função não 
# retorne nada, fazemos ela devolver NULL.

### Inf representa o infinito, como no limite de funções matemáticas. 
# Valores muito grandes (10e+308) e 1/0 retornam Inf (com I maiúsculo).


#### Vamos sair do básico? 

######################################

#### Instalando Pacotes

# A principal fonte de pacotes R é o CRAN (The Comprehensive R Archive Network)
# Comunidade de desenvolvedores que mantem o R e os pacotes "oficiais".

install.packages("usethis")
library(usethis)
install.packages("devtools")

#### chamando um pacote


library(devtools)

##### alguns usuários relataram problema com o install_github

### Tentem

install.packages("githubinstall")

#### chamando um pacote


library(githubinstall)

githubinstall("silvadenisson/electionsBR")




# importante pacote

install.packages("sos")
install.packages("library:utils")


# chamando / abrindo o pacote 

library(sos)

library(brew)

# função 

findFn('correl')


# para animar https://rstudio.com/resources/cheatsheets/

# Folhas de Truques (Cheat Sheet)


