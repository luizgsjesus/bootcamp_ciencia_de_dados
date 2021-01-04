# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy


class ScraperIGTIItem(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    
    #para cada pagina de categoria
    url_pagina = scrapy.Field()
    titulo_pagina = scrapy.Field()
    
    
    #para cada artigo da pagina
    categoria_artigo = scrapy.Field()
    categoria_URL = scrapy.Field()
    titulo = scrapy.Field()
    url_artigo = scrapy.Field()
    dtPostagem = scrapy.Field()
    comentarios_artigo = scrapy.Field()
    visualizacoes_artigo = scrapy.Field()


class CrawlerIGTIItem(scrapy.Item):
    
    #para cada página de categoria
    titulo_pagina = scrapy.Field()
    categoria = scrapy.Field()
    url_pagina = scrapy.Field()
        
      


    pass
