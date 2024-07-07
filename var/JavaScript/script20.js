function mudarTexto() {
  let c1 = document.getElementById("c1");
  let c2 = document.getElementById("c2");
  let c3 = document.getElementById("c3");

  c1.innerHTML = "TurboNET";
  c2.innerText = "Vilmar";
  c3.innerText = "Evili";
}

const toggleButton = document.querySelector("#change");
toggleButton.addEventListener("click", () => {
  let state = document.body.classList.contains("c1");
  let c1 = document.getElementById("c1");
  c1.innerHTML = "TurboNET";
  state = document.body.classList.contains("c1");
  console.log("c1 =:", state);
  //   mudarTexto();
});
