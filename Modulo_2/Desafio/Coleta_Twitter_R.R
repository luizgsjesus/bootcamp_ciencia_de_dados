library(rtweet)

#Define um diretório de trabalho
setwd("~/bootcamp_ciencia_de_dados/Modulo_2/Desafio/Twitter_Data")


#Autenticação
token <- create_token(app = "app_de_coleta", 
                      consumer_key = "xxxxxxxxxxxxxxx",
                      consumer_secret = "xxxxxxxxxxxxx",
                      access_token = "xxxxxxx",
                      access_secret = "xxxxxxxxxxxxxxx")


##########Busca por Usuário

#parâmetro de Busca
screen_name <- "sabrinasato"

#buscando
tweets <- get_timeline(screen_name, n=1000, include_rts=TRUE, exclude_replies=TRUE)

#Salva o vetor de tweets como CSV 
write_as_csv(tweets, "TweetsByNameRawData.csv", fileEncoding = "latin1//TRANSLIT")

#Lota serie temporal dos Tweets
ts_plot(tweets, "3 hours") +
  ggplot2::theme_minimal() +
  ggplot2::theme(plot.title = ggplot2 ::element_text(face = "bold"))+
  ggplot2::labs(
    x = NULL, y = NULL,
    title = "Frequência de tweets da conta 'Sabrina Sato'",
      subtitle = "Contagem de tweets agregados em intervalos de 3 horas",
      caption = "\nFonte: Dados coletados do Twitter com o pacote rtweet"
  )


##########Busca por HAshtag

#parâmetro de busca
search.string <- c("#covid OR #covid19 OR #coronavirus OR #pandemia OR #ficaemcasa")
#recent, mixed ou popular
type = "mixed" 

#Busca
tweets <- search_tweets(search.string, n=18000, lang='pt', type=type, include_rts=FALSE, retryonratelimit =TRUE)

#Salva o vetor de tweets como CSV 
write_as_csv(tweets, "TweetsByRawData.csv", fileEncoding = "latin1//TRANSLIT")
write.table(tweets$text, "TweetsRawData.txt", fileEncoding = "latin1//TRANSLIT")

####PLota no mapa os tweets capturados
library(maps)

#cria variáveis latitude e longitude usando tweets disponíveis
tweets <- lat_lng(tweets)

#plota o mapa do Brasil
par(mar = c(0,0,0,0)) #ajusta parâmetros (margem) de plotagem
map("world", "brazil", lwd = 0.3, fill=T, col= "grey95")
map(,,add=T)
map.axes()
map.scale(ratio=T, cex=0.3)
abline(h=0, lty=2)
map.cities(country = "Brazil", minpop = 2000000, pch=15, cex=0.9)

#Adiciona os tweets no mapa
with(tweets, points(lng, lat, pch = 20, cex = .75, col=rgb(0,.3,.7,.75)))









