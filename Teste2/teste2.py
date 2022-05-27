#Transformacao de Dados
import tabula
import pandas as pd
from zipfile import ZipFile

# Nomeacao dos arquivos utilizados
fileRead = "Anexo_I.pdf"
fileWrite = "Rol_Proced.csv"
zipFile = "Teste_HugoSV.zip"

#Leitura das tabelas do arquivo PDF
tables  = tabula.read_pdf(fileRead, pages = "all")

print(len(tables))

#Bonus, traduz o conteudo das colunas selecionadas com base na legenda do rodape
for i in range(0, len(tables)):
    df = tables[i].replace({'OD':{'OD':'Seg. Odontológica'},'AMB':{'AMB': 'Seg. Ambulatorial'}})
    tables[i] = df

#Concatena a lista de dataframes (210 dataframes) em um unico dataframe
table = pd.concat(tables, ignore_index=True)

#Transforma o dataframe em um arquivo CSV
table.to_csv(fileWrite)
#Cria um arquivo .zip com o csv criado acima
zipObj = ZipFile(zipFile, 'w')
zipObj.write(fileWrite)