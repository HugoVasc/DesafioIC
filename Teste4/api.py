from flask import Flask, Response
from flask_sqlalchemy import SQLAlchemy
import json
import sqlalchemy

app = Flask(__name__)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql://teste:teste@localhost:5432/DB"
engine = sqlalchemy.create_engine("postgresql://teste:teste@localhost:5432/DB")
metadata_obj = sqlalchemy.MetaData(bind=engine)

db = SQLAlchemy(app)

class relacao_operadoras_ativas_ans(db.Model):
    reg_ans = db.Column(db.Integer, primary_key= True)
    cnpj = db.Column(db.String(15))
    razao_social = db.Column(db.String(50))
    nome_fantasia = db.Column(db.String(50))
    modalidade = db.Column(db.String(20))
    logradouro = db.Column(db.String(50))
    numero = db.Column(db.String(20))
    complemento = db.Column(db.String(20))
    bairro = db.Column(db.String(20))
    cidade = db.Column(db.String(20))
    cep = db.Column(db.Integer())    
    email = db.Column(db.String(100))

    def to_json(self):
        return {"reg_ans": self.reg_ans, "cnpj": self.cnpj, "razao_social": self.razao_social, "nome_fantasia": self.nome_fantasia, "modalidade": self.modalidade, "logradouro": self.logradouro, "numero": self.numero, "complemento": self.complemento, "bairro": self.bairro, "cidade": self.cidade, "cep": self.cep, "email": self.email}

@app.route("/busca/<razao_social>", methods=['GET'])
def busca(razao_social):
    query = razao_social
    operadora_razao_social = relacao_operadoras_ativas_ans.query.filter(relacao_operadoras_ativas_ans.razao_social == query).all()
    operadoras_json = [operadora.to_json() for operadora in operadora_razao_social]
    return make_response(200, "usuarios", operadoras_json)

def make_response(status, nome_do_conteudo, conteudo, mensagem=False):
    body = {}
    body[nome_do_conteudo] = conteudo

    if(mensagem):
        body["mensagem"] = mensagem

    return Response(json.dumps(body), status=status, mimetype="application/json")

app.run()