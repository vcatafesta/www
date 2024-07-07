function soma(n1 = 0, n2 = 0) {
  let result = n1 + n2;
  return result;
}

function lenrest(...array) {
  nlen = array.length;
  return nlen;
}

function somarest(...array) {
  nlen = array.length;
  result = 0;
  for (let index of array) {
    result += index;
  }
  return result;
}

console.log(soma());
console.log(soma(10, 30));
console.log(somarest());
console.log(lenrest(10, 5, 40, 506, 70));
console.log(somarest(10, 5, 40, 506, 70));

// Criar elementos
var heading = document.createElement("h1");
var headingText = document.createTextNode("Olá, mundo!");
heading.appendChild(headingText);

var paragraph = document.createElement("p");
var paragraphText = document.createTextNode(
  "Este é um parágrafo adicionado no body usando JavaScript."
);
paragraph.appendChild(paragraphText);

// Adicionar elementos ao body
document.body.appendChild(heading);
document.body.appendChild(paragraph);
