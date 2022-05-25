import tabula

file = "Anexo_I.pdf"

table = tabula.read_pdf(file, pages = "all")

print (table)


