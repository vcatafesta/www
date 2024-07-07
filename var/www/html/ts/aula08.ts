let dados = {
    nome: "Vilmar",
    idate: 56,
    status: "A",
    ola: () => { console.log("oi") },
    info:(p:string) => { console.log(p) }
}

dados.nome = "Evili";
console.log(typeof (dados));
console.log(dados.nome);

dados.ola();
dados.info(dados.nome);
