
library(tidyverse)
library(lubridate)
library(car)

### identificando documentos na pasta



library(readxl)

dados <-read_excel("lec-data/base.xlsx",col_names=TRUE)

str(dados)


### selecionar apenas numerico noob
dados_num <- select(dados, -COD , -`Max_Date (saida)`, -`Min_Date (estreia)`, -Artist, -`Track Name`, -artists_0_name, -artists_0_id, -release_date,-Min_peak_date, -genres, -`semanas no pico` )

### selecionando todos os dados que não são numéricos forma possível 
dados_num <- dplyr::select_if(dados, is.numeric)


### tirando NA noob
dados_teste <- filter(dados_num,  !is.na(posicao_estreia))


### tirar todos os dados com NA
### exclui a coluna inteira com NA
dados_teste <- na.omit(dados_num)

library(corrplot)




correlacoes <- cor(dados_teste)

correlacoes
corrplot(correlacoes)



attach(dados_teste)

### modelagem com todas as variáveis ~. 
modelo2 <- lm( avg_streams_semanais~., data = dados_num)

###  modelo noob
### variável que está sendo explicado
modelo <- lm(  avg_streams_semanais  ~ posicao_estreia + qtd_semanas_no_chart+longevidade+maturação+peak_position+velocidade+repertorio_no_chart+popularidade_inicial+popularidade_final+followers_inicial+followers_inicial, data = dados_num)
summary(modelo)


### regressoes por passos
install.packages("olsrr")


### explore o manual disponível em 
### https://cran.r-project.org/web/packages/olsrr/olsrr.pdf


library(olsrr)

teste <- ols_step_all_possible(modelo)
teste


### esquema inteligente para alcançar o maior valor. 
### which vai devolver a linha onde ocorre a condiçào dentro 
# dos parênteses  
j <- which(teste$rsquare == max(teste$rsquare))
teste[j, ]
