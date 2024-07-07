let btnDarkMode = document.querySelector('#btn_mode_dark');
let html = document.querySelector('html');


btnDarkMode.addEventListener('click',()=>{
  btnDarkMode.classList.toggle('active_dark');
  html.classList.toggle('active');
});