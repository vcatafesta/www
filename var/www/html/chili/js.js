console.log("Hello World from JavaScript")
console.warn("Foi gerado um aviso!")
console.error("Foi gerado um erro!")

number = 10
nome = 'Vilmar'
fullname = "Vilmar Catafesta"
decimal = 12.4
isApproved = true
surname = null
age = null
languages = ['JavaScript', 'PHP', 'Python']
user = { email: 'vcatafesta@gmail.com', password: '123', age: 55 }
console.log(number)
console.log(typeof nome)
console.log(typeof decimal)
console.log(typeof decimal)
console.log(typeof isApproved)
console.log(typeof surname)
console.log(typeof age)
console.log(typeof languages)
console.log(languages)
console.log(typeof languages)
console.log(user)
console.log(user.email)
console.log(typeof user)
number = 20
console.log(number)
console.log(nome.length)
console.log(fullname.split(''))
console.log(fullname.split(' '))
console.log(fullname.toLowerCase())
console.log(fullname.toUpperCase())
console.log(fullname.indexOf('Catafesta'))
console.log('qualquer coisa'.indexOf('Catafesta'))
console.log(fullname.slice(0, 7))

// methods
list = ['a', 'b', 'c', 'd', 'e']
console.log(list.length)
console.log(list[2]) // c
list[5] = 'f'
console.log(list)
console.log(list.length - 1)

// objetos
produtos = {
  nome: 'camisa',
  price: 15.99,
  inStock: true,
  sizes: ['P', 'M', 'G'],
  'Cor principal': 'azul'
}
console.log(produtos.nome)
console.log(produtos['nome'])
console.log(produtos['Cor principal'])

// destructuring
const { price, inStock } = produtos
console.log(price)
console.log(inStock)

const [n1, n2] = list
console.log(n1)
console.log(n2)

// JSON

