# o Básico

# Feedback
# Casa de Ferreiro


# O R 

#Criada em 1993 por Ross Ihaka e Robert Gentleman no Departamento de 
#Estatística da Universidade de Auckland, Nova Zelândia.
# O R foi desenvolvido a partir da Linguagem S, criada na AT&T Bell 
#Labs por John Chambers, Rick Becker e Allan Wilks em 1976.

# Hoje é um monstro --- Deu força para o Monstro Hadley Wickham
# Leia uma entrevista com o mesmo https://ichi.pro/pt/dataviz-e-o-20-aniversario-de-r-uma-entrevista-com-hadley-wickham-257441689828490


# Referências

# https://www.ibpad.com.br/blog/analise-de-dados/livros-para-se-aprender-r/
# http://adv-r.had.co.nz  <-- para Hacker 

# R é melhor
# Excel é excelente, mas ...
# o seu próximo empregador olhará para seus conhecimentos em R

# Esse é o R Studio
# eu gosto muito do https://rstudio.cloud/

# para instalar
# https://cran.r-project.org/ <-- Primeiro passo
# https://rstudio.com/products/rstudio/download/ <-- RStudio
# Linux? Atualize pacotes, instale o R sudo apt -y install r-base
# depois baixe o RStudio e instale




#### Precisa de ajuda?  help ou ?

help(mean)

?mean


# onde aprender mais 
# https://pt.stackoverflow.com/
# https://twitter.com/rbloggersbr
# https://www.r-bloggers.com/tag/rblogs/

# Quer usar o R para cálculos do dia a dia? 

# Operação	    Símbolo
# Adição        	+
# Subtração       -
# Divisão	        /
# Multipliação   	*
# Exponenciação	  ^

4 + 5 

#colocar uma linha para rodar?  com o cursor na linha  Windows CTRL + Enter  
#                                                      Mac command + Enter 

4*5

4 ^ 2  # cuidado com o cincunflexo, pois se não apertar o 
       # backspace ele tende a não ir

#sim... você pode colocar comentário em qualquer lugar
# sim.. você deve colocar comentário em tudo, mas nunca colocamos :( 

4 / 7 # vamos falar de precisão em breve 
      # cuidado com acentos, mesmo nos comentários - alguns podem abrir 
      # e ver uma penca de caracteres desnecessários 

# Como o padrão.. { } e [ ] não servem. 
# utilize ( ) sem moderação e não esqueça das prioridades

# assim

( 3 + 4 )/2 

# é diferente de 

3 + 4/ 2 


#######  Operadores de comparação

#      Teste	            Símbolo
#  Igualdade            	==
#  Diferença            	!=
#  Maior que            	>
#  Menor que            	<
#  Maior ou igual       	>=
#  Menor ou igual	        <=
#  E                    	&
#  OU                   	|  
#  NÃO                  	!


10 == 10 

10 != 10 

5 > 4 

5 < 4 

(3> 1 ) & ( 5 > 2) 

# recordando ... 
# p  q    p & q 
# V  V      V
# V  F      F
# F  V      F 
# F  F      F 


(3 < 1 ) | ( 5 > 2)

# recordando ... 
# p  q    p | q 
# V  V      V
# V  F      V
# F  V      V 
# F  F      F 


# Criando objetos 

# SEMPRE utilize o <- o = também é válido, mas pode te quebrar. Principalmente
# quando recordamos do operador de comparação == 

# atribuindo um número 
a <- 4 

a # você pode chamar sempre que precisar

a + 10  

# atribuindo um texto

texto <- "R"

texto 


# cuidados na declaração de variáveis 
# Exemplos de nomes de objetos que produzem erros
2x <- 1
_x <- 1
&x <- 1

# Exemplos de nomes de objetos que não produzem erros imediatos
class <- 1
print <- 1

########### ideias extremamente importantes  ###################

# Use espaços entre objetos, operadores e chamadas a funções

3+4 

3 + 4 


# Sempre que possível, crie objetos apenas com letras minúsculas 
# R é case sensitive 
# ideia interessante é sempre antes de desligar criar um sumário com as
# variáveis que declarou. Eu faço isso? Não! Mas é fala de pai! 
# faça o que eu digo, mas não faça o que eu faço. 


teste  <- 13 

Teste  <- 26 


#Se precisar separar o nome de um objeto, use _ (underscore ou traço em baixo)

isso.vai.te.quebrar <- 0

isso_nao <- 10 

# no próximo encontro vamos analisar outras "entidades"
# e um pouco mais de lógica? 
 
### MISSÃO: instalar e rodar este script. 

