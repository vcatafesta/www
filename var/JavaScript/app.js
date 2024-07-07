// app.js
const { exec } = require('child_process');

// Definindo o comando que executa a função Bash
const bashCommand = 'source ./exemplo.sh && listar_arquivos';

// Executando o comando Bash
exec(bashCommand, (error, stdout, stderr) => {
    if (error) {
        console.error(`Erro ao executar o comando: ${error.message}`);
        return;
    }
    if (stderr) {
        console.error(`Erro no stderr: ${stderr}`);
        return;
    }
    console.log(`Resultado da função Bash: \n${stdout}`);
});
