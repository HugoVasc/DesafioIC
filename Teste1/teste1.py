#WebScrapper
import re
from xml.etree.ElementTree import tostring
from bs4 import BeautifulSoup
from zipfile import ZipFile

import requests
#Requisicao da pagina
req = requests.get("https://www.gov.br/ans/pt-br/assuntos/consumidor/o-que-o-seu-plano-de-saude-deve-cobrir-1/o-que-e-o-rol-de-procedimentos-e-evento-em-saude").content 

#Decodifica o conteudo da requisicao
html = BeautifulSoup(req, "html5lib")

#Faz uma lista com todos os "paragrafos" da classe callout - atributos 
paragraphs = html.find_all('p', attrs={'class': 'callout'})

#Lista dos anexos requeridos
anexos = ["I", "II", "III", "IV"]

#Lista a ser utilizada para agrupar os links
list_links = []

zipObj = ZipFile('Anexos.zip', 'w')

#Loop for para procurar links na lista de todos os paragrafos
for link in paragraphs:
    link = link.find('a')['href']
    #print (link)
    #Loop para identificar os links dos PDFs desejados, baixa-los e Comprimi-los
    for anexo in anexos:
        if re.search("Anexo_{}".format(anexo), link):
            anexos.remove(anexo)
            pdf = open("Anexo_{}.pdf".format(anexo), 'wb')
            response = requests.get(link[link.find("https"):link.find(".pdf")+4])
            pdf.write(response.content)
            pdf.close()
            zipObj.write("Anexo_{}.pdf".format(anexo))