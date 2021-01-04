# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html


# useful for handling different item types with a single interface
#from itemadapter import ItemAdapter

import json
import codecs


class CrawlerIGTIPipeline:
    def opne_Spider(self, spider):
        #abre arquivo para armazenar itens raspados
        if spider.name == 'crawlingIGTIBlog':
            #print("Spider: crawlingIGTIBlog")
            self.file = codecs.open('crawled_pages.json', 'w', encoding='utf8')
        elif spider.name == 'scrapingIGTIBlog':
            #print("Spider: scrapingIGTIBlog")
            self.file = codecs.open('scraped_items.json', 'w', encoding='utf8')
        #print("Abre arquivo json')
        #self.file = codecs.open('scraped_items.json', 'a', encoding='utf8')
        self.file.write("[")
        
        def close_spider(self, spider):
            #Abre arquivo
            self.file.write("]")
            self.file.close()
            print("Fecha arquivo json")
            
        def write_file(self, item, spider):
            #Grava itens raspados no arquivo
            line = json.dumps(
                dict(item), indent = 4,
                sort_keys = True,
                separators = (',', ':'),
            ensure_ascii = False ) + ",\n"
            self.file.write(line)
            
        def process_item(self, item, spider):
            
            if spider.name == 'scrapingIGTIBlog':
                if item['comentarios_artigo'] == 'Comentar':
                    item['comentarios_artigo'] = '0 Comentários'
                    
            CrawlerIGTIPipeline.write_file(self, item, spider)
            
            return item
            
 
  

