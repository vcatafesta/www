// this
const timeout = 1000;
console.log(this);

function teste(params) {
    console.log(this);
}
teste();

// objeto com this
const pessoa = {
    nome: "Vilmar",
    saudar: function() {
        console.log(`Olá meu nome é ${this.nome}`);
    },
};
pessoa.saudar();

// herança de protótipo
function Pessoa2(nome) {
    this.nome = nome;
}

Pessoa2.prototype.saudar = function() {
    setTimeout(
        function() {
            console.log(this);
            console.log(`Olá meu nome é ${this.nome}`);
        }.bind(this),
        timeout
    );
};

const pessoa2 = new Pessoa2("Evili");
pessoa2.saudar();

// closure

function multiplicador(x) {
    return function(y) {
        return x * y;
    };
}

const dobrar = multiplicador(2);
const triplicar = multiplicador(3);
console.log(dobrar(5));