// https: //zerobugs.com.br/ver-post/manipulando-arquivos-ini-com-node-js/
// npm init -y
// npm install fs
// npm install ini

const fs = require("fs");
const ini = require("ini");

const config = ini.parse(fs.readFileSync("./config.ini", "utf-8"));

// read
console.log(config.website);
console.log(config.website.url);
console.log(config.flatpak);

// write
config.desenvolvimento.ip = "127.0.0.1";
config.producao.porta = "3308";
config.producao.novaChave = "Esta é uma nova chave!";
fs.writeFileSync("./config_modified.ini", ini.stringify(config));

const animaisConfig = ini.parse(fs.readFileSync("./config.ini", "utf-8"));
const nomeAnimais = animaisConfig.animais.nomes;

console.log(nomeAnimais);