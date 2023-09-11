const changeThemeBtn = document.querySelector("#change-theme");

// Toggle dark mode
function toggleDarkMode() {
  document.body.classList.toggle("dark");
}

// Load light ou dark mode

function LoadTheme() {
  const darkMode = localStorage.getItem("dark");

  if (darkMode) {
    toggleDarkMode();
  }
}

changeThemeBtn.addEventListener("change", function() {
  toggleDarkMode();
  
  // Save or remove dark mode
  localStorage.removeItem("dark");
  
  if(document.body.classList.contains("dark")) {
    localStorage.setItem("dark",1);
  }
})

LoadTheme();

