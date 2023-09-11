// let count = 0
// const value = document.querySelector('#value')
// const btns = document.querySelectorAll('.btn')

// function render_color() {
//     if (count > 0) {
//         value.style.color = 'green';
//     } else if (count < 0) {
//         value.style.color = 'red';
//     } else {
//         value.style.color = 'black';
//     }
// }

// function write_value(count) {s
//     value.textContent = count;
// }

// btns.forEach(function (btn) {
//     btn.addEventListener('click', function (e) {
//         const styles = e.currentTarget.classList;
//         if (styles.contains('decrease')) {
//             count--;
//         } else if (styles.contains('increase')) {
//             count++;
//         } else {
//             count = 0;
//         }
//         render_color()
//         write_value(count)
//     })
// })


// const value = document.querySelector('#value');
// const btns = document.querySelectorAll('.btn');

// let count = 0;

// function renderColor() {
//     const color = count > 0 ? 'green' : count < 0 ? 'red' : 'black';
//     value.style.color = color;
// }

// function writeValue() {
//     value.textContent = count;
// }

// btns.forEach(function (btn) {
//     btn.addEventListener('click', function (e) {
//         const styles = e.currentTarget.classList;
//         if (styles.contains('decrease')) {
//             count--;
//         } else if (styles.contains('increase')) {
//             count++;
//         } else {
//             count = 0;
//         }
//         renderColor();
//         writeValue();
//     });
// });

// Utilize let e const de forma apropriada:
// Você já está usando const onde é apropriado (para value e btns). Continue usando const para valores que não serão reatribuídos. Se você precisar reatribuir um valor, aí sim use let.

let count = 0;
const value = document.querySelector('#value');
const btns = document.querySelectorAll('.btn');

// As funções render_color e write_value não reatribuem count, então podem ser declaradas como constantes.s
const render_color = () => {
    if (count > 0) {
        value.style.color = 'green';
    } else if (count < 0) {
        value.style.color = 'red';
    } else {
        value.style.color = 'black';
    }
}

const write_value = (count) => {
    value.textContent = count;
}

// Arrow functions podem tornar o código mais conciso e legível.
// Por exemplo, as funções de callback no forEach e no addEventListener podem ser escritas como arrow functions.
// Em vez de adicionar um evento para cada tipo de botão (increase, decrease e reset),
// você pode ter um único evento para todos os botões e então verificar a classe do botão clicado dentro do evento.
btns.forEach(btn => {
    btn.addEventListener('click', (e) => {
        const styles = e.currentTarget.classList;
        if (styles.contains('decrease')) {
            count--;
        } else if (styles.contains('increase')) {
            count++;
        } else {
            count = 0;
        }
        render_color();
        write_value(count);
    });
});

