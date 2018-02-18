// Importando bibliotecas utilizadas pelo projeto
const express = require("express");
const mysql2 = require("mysql2");
const bodyParser = require("body-parser");

// Criando nosso APP
const app = express();
/* Associando o bodyParser ao app para 
extrair os dados do corpo da requisiçao */
app.use(bodyParser.urlencoded());

// Criando conexão
const conexao = mysql2.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "assistant"
});



app.post('/contato', function (req, res) {
    var sql = 'call SP_ADD__CONTATO_ENDERECO (?,?,?,?,?,?,?,?,?,?,?)';
    
    var valores = [req.body.rua_end,
    req.body.bairro_end,
    req.body.cidade_end,
    req.body.uf_end,
    req.body.cep_end,
    req.body.nome_cont,
    req.body.email_cont,
    req.body.dtnascimento_cont,
    req.body.profissao_cont,
    req.body.empresa_cont,
    req.body.aceita_email
    ];  

    conexao.query(sql, valores, function (erro, resultado) {

        var url = req.headers.referer.replace("contato.html", "");
        console.log(url);

        if (erro) {
            console.log(erro);
            res.redirect(url + "asserts/js/falha");
        } else {
            console.log("Deu certo...");
            res.redirect(url + "asserts/js/sucesso.html");
        }
    });
});

console.log("Inciando servidor...");
app.listen(3000);