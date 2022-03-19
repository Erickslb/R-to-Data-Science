

#### funções? 

### Referencias
# https://www.tutorialspoint.com/r/r_functions.htm



# https://www.datamentor.io/r-programming/function/
# https://analisereal.com/tag/introducao-a-analise-de-dados-com-o-r-2/
# https://renkun-ken.github.io/pipeR-tutorial/Getting-started/First-example.html

### criar uma função exige quais passos?


# func_nome <- function (argumentos) {
#  comandos
# return(resultado) 
# }

# o comando return() encerra a função e retorna seu argumento.
# o return() é opcional. Caso omitido, a função retorna 
# o último objeto calculado.

### exemplo 

potencia <- function(x, y) {
  # o resultado dessa função será x elevado à y
  result <- x^y
  print(paste(x,"elevado à", y, "é igual a ", result))
}

### e como devo "chamar" a função? 
potencia(2,3)

potencia(x = 8, y = 2)

### ele entende as variáveis declaradas
potencia(y = 2, x = 8)

potencia(2, x=8)


### modificando os argumentos
potencia <- function(x, y = 2 ) {
  # o resultado dessa função será x elevado à y
  result <- x^y
  print(paste(x,"elevado à", y, "é igual a", result))
}

potencia(4)

potencia(4,3)


### utilizando o return
testar_sinal <- function(x) {
  if (x > 0) {
    result <- "Positivo"
  }
  else if (x < 0) {
    result <- "Negativo"
  }
  else {
    result <- "Zero"
  }
  return(result)
}

testar_sinal(-10)


### solução para grandes volumes de dados 

testar_sinal <- function(x) {
  if (x>0) {
    return("Positivo")
  }
  else if (x<0) {
    return("Negativo")
  }
  else {
    return("Zero")
  }
}

testar_sinal(-10)

### Qual das duas prefere? 

### o que acha de fazermos um laço com for?


somar_vetor <- function(vetor) { 
  soma <- 0
  for (i in 1:length(vetor)) 
  {
    soma <- soma + vetor[i]
  }
  return(soma)
}
x <- c(1:50)


somar_vetor(x)
### teste sem iniciar com o soma <- 0 verá que dá problema


#### laços aninhados

somar_matriz <- function(matriz){
  soma <- 0
  for(i in seq_len(nrow(matriz))) {
    for(j in seq_len(ncol(matriz))) {
      soma <- soma + matriz[i,j]
    }
  }
  return(soma)
}

x <- matrix(1:15, 3, 5)
x

seq_len(nrow(x))

somar_matriz(x)


### o que acha de fazermos um laço com while

somar_vetor <- function(vetor) { 
  soma <- 0
  i <- 1 
  while (i <= length(vetor)) {
    soma <- soma + vetor[i]
    i <- i + 1
  }
  return(soma)
}
x <- c(1:10)

somar_vetor(x)



### repeat e break

somar_vetor <- function(vetor) { 
  soma <- 0
  i <- 1 
  repeat {
    soma <- soma + vetor[i]
    i <- i + 1
    if (i > length(vetor)) {
      break
    }
  }
  return(soma)
}
x <-  c(1:10)

somar_vetor(x)


### Missão aula passada




library("readxl")

dados <-read_excel("lec-data/aula5_dados.xlsx", sheet=1, col_names=TRUE)


cv <- function(matriz)
{
  nlinhas <- nrow(matriz)
  ncolunas <- ncol(matriz)
  
  for(i in 1:ncolunas){
    matriz[nlinhas+1, i] <- sd(matriz[[i]], na.rm = T)/ mean(matriz[[i]], na.rm = T)
  }
}

cv(dados)

dados

### missao

# Faça uma função que recebe a média final de um aluno 
# por parãmetro e retorna o seu conceito, conforme a tabela abaixo:
  
##  Nota           Conceito
# de 0,0 a 4,9     D
# de 5,0 a 6,9     C
# de 7,0 a 8,9     B
# de 9,0 a 10,0    A


testar_nota <- function(x) {
  if (x>9) {
    return("A")
  }
  else if (x>7) {
    return("B")
  }
  else if (x>5) {
    return("C")
  }
  else if (x>0) {
    return("D")
  }
  else{
    return("Nota inválida")
  }
}

testar_nota(0.1)


### Vamos de pacotes???

# Os princípios fundamentais do tidyverse são:
  
#####  Reutilizar estruturas de dados existentes.
#####  Organizar funções simples usando o pipe.
#####  Aderir à programação funcional -> código como 
# uma sequência de funções e/ou passos, as quais 
# de maneira composta irão resolver meu problema
#####  Projetado para ser usado por seres humanos.


#### Uma base de dados é considerada “tidy” se
# Cada observação é uma linha do bd.
# Cada variável é uma coluna do bd.
# Cada dado está numa célula do bd.



#### A anatomia do tidyverse
        ###  tibble
# uma reimplementação do data.frame com muitas melhorias.
# método print() enxuto.
# documentação: https://tibble.tidyverse.org/.
        ###  readr
# leitura de dados tabulares: csv, tsv, fwf.
# recursos que determinam tipo de variável, por exemplo, datas.
# documentação: https://readr.tidyverse.org/.
        ###  tidyr
# suporte para criação de dados no formato tidy (tabular).
# cada variável está em uma coluna.
# cada observação (unidade amostral) é uma linha.
# cada valor é uma cédula.
# documentação: https://tidyr.tidyverse.org/.
        ###  dplyr
# oferece uma gramática extensa pra manipulação de dados.
# operações de split-apply-combine.
# documentação: https://dplyr.tidyverse.org/.
        ###  ggplot2
# criação de gráficos baseado no The Grammar of Graphics
# (WILKINSON et al., 2013).
# construção baseada em camadas.
# documentação: https://ggplot2.tidyverse.org/.
        ###  forcats
# para manipulação de variáveis categóricas/fatores.
# renomenar, reordenar, transformar, aglutinar.
# documentação: https://forcats.tidyverse.org/.
        ### stringr
# recursos coesos construídos para manipulação de strings.
# documentação: https://stringr.tidyverse.org/.
        ### purrr
# recursos para programação funcional.
# funções que aplicam funções em lote varrendo objetos:
# vetores, listas, etc.
# documentação: https://purrr.tidyverse.org/.


# A ideia do operador %>% (pipe) 
# possui como padrão o uso do valor resultante 
# da expressão do lado esquerdo como primeiro 
# argumento da função do lado direito.

# Vamos calcular a raiz quadrada da soma dos valores de 1 a 4. Primeiro, sem o pipe.

x <- c(1, 2, 3, 4)
sqrt(sum(x))

# Agora com o pipe.

if(!require(tidyverse)){install.packages("tidyverse");require(tidyverse)}

tidyverse_packages()



library(magrittr)

x %>% sum() %>% sqrt()  ### encontraríamos no magrittr sqrt(sum(x))

### exemplo trigonométrico

pi %>% sin


pi %>% sin %>% cos

### comparando 

cos(sin(pi))


### exemplos "mais intensos"
data(mtcars)

# a função sample()  vai escolher aleatoriamente 10 000 
# valores no mpg e o replace = TRUE indica que é com reposição
sample_mtcars <- sample(mtcars$mpg, 10000, replace = TRUE)

# a função density() “suaviza” o histograma, capturando e 
# concentrando-se nos principais aspectos dos dados disponíveis. 
density_mtcars <- density(sample_mtcars, bw = 0.8,kernel = "gaussian")

# "largura" ajustada pela função
plot(density_mtcars, col = "red", main="density of mpg (bootstrap)")


### estilo força bruta

plot(density(sample(mtcars$mpg, size = 10000, replace = TRUE), bw = 0.8,
             kernel = "gaussian"), col = "red", main="density of mpg (bootstrap)")

## com o operador pipe 

mtcars$mpg %>%
  sample(size = 10000, replace = TRUE) %>%
  density(0.8, kernel = "gaussian") %>%
  plot(col = "red", main = "density of mpg (bootstrap)")



### um pacote para gráficos

# referências
# https://curso-r.github.io/ragmatic-book/visualizacao-de-dados.html#com-ggplot2

#####          ggplot2         #######

# O ggplot2 é um pacote do R voltado para a criação de gráficos 
# estatísticos. Ele é baseado na Gramática dos Gráficos 
# (grammar of graphics, em inglês), criado por Leland Wilkinson,
# que é uma resposta para a pergunta: o que é um gráfico estatístico? 


# Um gráfico estatístico é um mapeamento dos dados a partir de 
# atributos estéticos (cores, formas, tamanho) em formas geométricas
# (pontos, linhas, barras).

data("mtcars")

head(mtcars)

# No ggplot2, os gráficos são construídos camada por camada 
# (ou, layers, em inglês), sendo que a primeira delas é dada 
# pela função ggplot. Cada camada representa um tipo de 
# mapeamento ou personalização do gráfico.


library(ggplot2)
ggplot(data = mtcars, aes(x = disp, y = mpg)) + 
  geom_point()

# a função aes()- Aesthetics - descreve como as 
# variáveis são mapeadas em aspectos visuais de 
# formas geométricas definidas pelos geoms.

ggplot(data = mtcars, aes(x = disp, y = mpg, colour = as.factor(am))) + 
  geom_point()

# am (tipo de transmissão) foi mapeada à cor dos pontos, 
# sendo que pontos vermelhos correspondem à transmissão 
# automática (valor 0) e pontos azuis à transmissão manual (valor 1).


###  você pode mapear uma variável contínua à cor dos pontos:

ggplot(mtcars, aes(x = disp, y = mpg, colour = cyl)) + 
  geom_point()

#  cyl -- número de cilindros

### você pode mapear o tamanho dos pontos à uma variável de interesse:

ggplot(mtcars, aes(x = disp, y = mpg, colour = cyl, size = wt)) +
  geom_point()

#  wt --  Peso (1000 libras)

#### Geoms definem qual forma geométrica s
# será utilizada para a visualização dos dados 
# no gráfico. Como já vimos, a função geom_point() 
# gera gráficos de dispersão transformando pares (x,y) 
# em pontos. Veja a seguir outros geoms bastante utilizados:

# geom_line: para retas definidas por pares (x,y)
# geom_abline: para retas definidas por um intercepto e uma inclinação
# geom_hline: para retas horizontais
# geom_boxplot: para boxplots
# geom_histogram: para histogramas
# geom_density: para densidades
# geom_area: para áreas
# geom_bar: para barras

ggplot(mtcars, aes(x = mpg)) + 
  geom_histogram()

ggplot(mtcars, aes(x = as.factor(cyl))) + 
  geom_bar()

### cores
ggplot(mtcars, aes(x = as.factor(cyl), y = mpg, fill = as.factor(cyl))) + geom_boxplot()

ggplot(mtcars, aes(x = as.factor(cyl), y = mpg)) + 
  geom_boxplot(color = "red", fill = "pink")

### eixos

# alterar os labels dos eixos acrescentamos as funções xlab() ou ylab()
ggplot(mtcars, aes(x = mpg)) + 
  geom_histogram() +
  xlab("Milhas por galão") +
  ylab("Frequência")

# alterar os limites dos gráficos usamos as funções xlim() e ylim()
ggplot(mtcars, aes(x = mpg)) + 
  geom_histogram() +
  xlab("Milhas por galão") +
  ylab("Frequência") +
  xlim(c(0, 40)) +
  ylim(c(0,8))


### legendas

ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) + 
  geom_bar() +
  labs(fill = "cilindros")

# trocar a posição da legenda:

ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) + 
  geom_bar() +
  labs(fill = "cilindros") +
  theme(legend.position="top")

#  retirar a legenda:
ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) + 
  geom_bar() +
  guides(fill=FALSE)

#### facets  
# excelente ferramenta para comparação

ggplot(mtcars, aes(x = mpg, y = disp, colour = as.factor(cyl))) + 
  geom_point() + 
  facet_grid(am~.)

# colocar os graficos lado a lado 

ggplot(mtcars, aes(x = mpg, y = disp, colour = as.factor(cyl))) +
  geom_point() + 
  facet_grid(.~am)







