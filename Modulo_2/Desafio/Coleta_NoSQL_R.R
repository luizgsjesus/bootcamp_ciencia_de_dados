#Instalação pacote Mongolite
install.packages('mongolite')

#importa pacote mongolite se ele ainda não foi carregado
if(!"mongolite" %in% (.packages())){require(mongolite)}

#Conexão com BD
iris <- mongo(collection = "iris", db = "igti", url = "mongodb://localhost")

#Conta o número de documentos na coleção iris
iris$count()

#Cria um df com todos os dados da coleção
iris.df <- iris$find()

#Imprime algumas informações específicas do df
print(paste("Número de colunas: ", ncol(iris.df)))
print(paste("Número de linhas: ", nrow(iris.df)))
print(paste("Tamanho: ", length(iris.df)))

#Imprime as 6 primeiras linhas do vetor iris
head(iris.df)

#Imprime os nomes das linhas de iris.df
#print(paste("Nome de linhas: ", rownames(iris.df)))
print(rownames(iris.df))

#Imprime os nomes das colunas de iris.df
#print(paste("Nome de linhas: ", colnames(iris.df)))
print(colnames(iris.df))

#Grava arquivo CSV
write.csv(iris.df, "/Users/Gustavo-NB/bootcamp_ciencia_de_dados/Modulo_2/Desafio/irisFromMongo.csv", row.names=FALSE)



#Seta as colunas para NULL
iris.df$idade <- NULL
iris.df$Species <- NULL
print("Colunas de df setar Idade e Species como NULL")
print(colnames(iris.df))

#Edita o nome das colunas
colnames(iris.df)[1] <- "Comprimento_Sepala"
colnames(iris.df)[2] <- "Largura_Sepala"
colnames(iris.df)[3] <- "Comprimento_Petala"
colnames(iris.df)[4] <- "Largura_Petala"

summary(iris.df)

#Boxplot da coluna 
boxplot(iris.df, col=3, ylab = "Valores (cm)", xlab = "Caracteristica")

#Usa range = 0 para não mostrar os outliers
#parâmtreo col=2 indica cor das barras
boxplot(iris.df, range = 0, col = 2, ylab = "Valores (cm)", xlab = "Caracteristica")






