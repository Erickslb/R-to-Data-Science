library(tidyverse)
library(dplyr)
library(tidyr)
library(tibble)
library(readxl)
library(ggplot2)

setwd("/home/erick/Documents/MAP/5prd/Introdução ao R aplicado em Ciência de Dados/R-to-Data-Science/data_analysis")

### Lendo os dados
dados_xls <- read_excel("valor_da_marca.xlsx")

### Transformando em tibble
dados_tibble <- as_tibble(dados_xls)
head(dados_tibble)


### Mudando o nome de algumas colunas para facilitar as seguintes análises

names(dados_tibble)[1] <- "idade"
names(dados_tibble)[2] <- "genero"
names(dados_tibble)[3] <- "escolaridade"
names(dados_tibble)[8] <- "pref_comprar_sust"
names(dados_tibble)[13] <- "engajamento"
names(dados_tibble)[11] <- "impacto_acoes"
names(dados_tibble)[5] <- "renda_pessoal"

### Contando respostas Sim ou Não por gênero

gen_info1 <- dados_tibble %>% 
  group_by(genero) %>% 
  summarise(total = n())

gen_info2 <- dados_tibble %>% 
  filter(dados_tibble$`Você procura informações a respeito das ações de empresas que promovam sustentabilidade?` == "Sim") %>%
  group_by(genero) %>% 
  summarise(disse_sim = n())

gen_info3 <- dados_tibble %>% 
  filter(dados_tibble$`Você procura informações a respeito das ações de empresas que promovam sustentabilidade?` == "Não") %>%
  group_by(genero) %>% 
  summarise(disse_nao = n())

dados_pgenero <- gen_info1 %>% 
  full_join(gen_info2, by = "genero") %>%
  full_join(gen_info3, by = "genero")

dados_pgenero

### Outro jeito de fazer (Descobri depois)
dados_pgenero2 <- dados_tibble %>%
  select(genero,pref_comprar_sust) %>%
  group_by(genero) %>%
  table()

dados_pgenero2

### O que a escolaridade pode dizer sobre como o indivíduo se comporta em 
### relação a esses assuntos?
dados_tibble %>%
  group_by(escolaridade) %>%
  summarise(soma = n())


esc_info1 <- dados_tibble %>% 
  filter(pref_comprar_sust == "Sim") %>%
  group_by(escolaridade) %>% 
  summarise(prefere_prod_marca_sust = n())

esc_info2 <- dados_tibble %>% 
  filter(pref_comprar_sust == "Não") %>%
  group_by(escolaridade) %>% 
  summarise(nao_prefere_prod_marca_sust = n())

dados_esc <- esc_info1 %>% 
  full_join(esc_info2, by = "escolaridade") %>%
  mutate(prop_sim = prefere_prod_marca_sust/(prefere_prod_marca_sust+nao_prefere_prod_marca_sust))

dados_esc
### Cruzamento de variáveis
esc_eng <-dados_tibble %>%
  group_by(escolaridade) %>%
  summarise(media_engajamento = mean(engajamento), media_nocao_impacto = mean(impacto_acoes))

dados_esc <- esc_eng %>%
  full_join(dados_esc, by = "escolaridade")

dados_esc
### plotando
arrange(dados_esc,media_nocao_impacto)
p<-ggplot(data=arrange(dados_esc,media_nocao_impacto), aes(x=escolaridade, y=media_nocao_impacto)) +
  geom_bar(stat="identity",width=0.2)+
  theme(axis.text.x = element_text(angle = 45))

p

### O que a renda pode dizer sobre como o indivíduo se comporta em 
### relação a esses assuntos?
dados_tibble %>%
  group_by(renda_pessoal) %>%
  summarise(soma = n())


rend_info1 <- dados_tibble %>% 
  filter(pref_comprar_sust == "Sim") %>%
  group_by(renda_pessoal) %>% 
  summarise(prefere_prod_marca_sust = n())

rend_info2 <- dados_tibble %>% 
  filter(pref_comprar_sust == "Não") %>%
  group_by(renda_pessoal) %>% 
  summarise(nao_prefere_prod_marca_sust = n())

dados_rend <- rend_info1 %>% 
  full_join(rend_info2, by = "renda_pessoal") %>%
  mutate(prop_sim = prefere_prod_marca_sust/(prefere_prod_marca_sust+nao_prefere_prod_marca_sust))

dados_rend

### Cruzamento de variáveis
rend_eng <-dados_tibble %>%
  group_by(renda_pessoal) %>%
  summarise(media_engajamento = mean(engajamento), media_nocao_impacto = mean(impacto_acoes))

dados_rend <- rend_eng %>%
  full_join(dados_rend, by = "renda_pessoal")

dados_rend

# qtd_sim_esc <- dados_tibble %>%
#  filter(pref_comprar_sust == "Sim")
#  group_by(escolaridade) %>%
#  summarise(prop_sim = n(pref_comprar_sust))
