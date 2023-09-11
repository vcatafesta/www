const objs = document.getElementsByTagName("div")
let num = [10, 20, 30, 40, 50]

for (o of objs) {
  console.log(o.innerHTML = "Cursos");
}

for (o in objs) {
  console.log(objs[o].innerHTML);
}

// Criando uma variável que irá buscar o elemento HTML pelo Id
let exemploInner = document.getElementById("textoHtml");
console.log("------ USANDO innerHTML ------");
console.log(exemploInner.innerHTML);

console.log("------ USANDO innerText ------");
console.log(exemploInner.innerText);

console.log("------ USANDO textContent ------");
console.log(exemploInner.textContent);