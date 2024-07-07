const express = require('express');
const { exec } = require('child_process');

const app = express();
const port = 3000;

// Rota para executar o script Bash e retornar o conteúdo HTML gerado
app.get('/', (req, res) => {
    // Caminho do script Bash a ser executado
    const scriptPath = './script.sh';

    // Executa o script Bash usando o módulo child_process
    exec(scriptPath, (error, stdout, stderr) => {
        if (error) {
            console.error('Erro ao executar o script:', error);
            res.status(500).send('Erro ao executar o script');
            return;
        }
        // Envia a saída do script (conteúdo HTML gerado) como resposta para o cliente
		console.log('stdout:', stdout);
        res.send(stdout);
    });
});

// Iniciando o servidor
app.listen(port, () => {
    console.log(`Servidor rodando em http://localhost:${port}`);
});

