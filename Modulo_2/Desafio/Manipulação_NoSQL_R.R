#Instalação pacote Mongolite
install.packages('mongolite')

#importa pacote mongolite se ele ainda não foi carregado
if(!"mongolite" %in% (.packages())){require(mongolite)}

#Conecta ao SGBD MongoDB
connection <- mongo(collection = "megasena", db = "igti", url = "mongodb://localhost")

#string de conexão que consulta o parâmetro
query <- connection$find('{"Ganhadores_Sena": "1"}')

exam_scores <- query[c("Rateio_Sena")]

#Sumariza o valor do prêmio
summary(exam_scores)

#Lê a coleção Iris e insere no MongoDB
iris <- iris

#Conecta ao SGBD MongoDB e cria a collection "Iris"
connection <- mongo(collection = "iris", db = "igti", url = "mongodb://localhost")

#Insere os dados "Iris" na collection "Iris" 
connection$insert(iris)

#Exibe os 5 primeiros valores da collection
connection$find(limit = 5)

#Cria a coleção "Pessoas" no db "igti"
pessoas <- mongo(collection = "pessoas", db = "igti", url = "mongodb://localhost" )

#Valores a serem inseridos dentro da collection em um vetor
str <- c('{"nome" : "maria"}' , '{"nome": "ana", "idade" : 23}', '{"nome" : "João"}')

#Insere os dados "str" na collection "Pessoas" 
pessoas$insert(str)

#Exibe valores na collection
pessoas$find()
pessoas$count()

#Remove entrada específica
pessoas$remove('{"idade" : 23}')
pessoas$count()

pessoas$find()

#Nova inserção de valores
str <- c( '{"nome" : "bill"}' , '{"nome" : "ana", "idade" : 23}' , '{"nome" : "Jose", "idade" : 35 } ')
pessoas$insert(str)

#Atualiza Valor na collection
pessoas$update('{ "nome" : "bill"}', '{"$set" : {"idade" : 21}}')

pessoas$find()



