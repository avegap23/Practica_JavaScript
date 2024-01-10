// DECLARANDO LOS ARRAYS
const arrNumeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const arrStrings = ['Array', 'de', 'strings'];

// 3) i)
const filtrarNumerosPares = arr => arr.filter((element) => Boolean(element % 2 == 0)); // array.filter((*instancia*) => *condición a cumplir para filtrar la instancia*)

console.log(filtrarNumerosPares(arrNumeros));

// 3) ii)
const duplicarElementos = arr => arr.map((element) => element * 2); // array.map((*instancia*) => *la nueva instancia será el resultado de esto*)

console.log(duplicarElementos(arrNumeros));

// 3) iii)
const convertirAMayusculas = arr => arr.map((element) => element.toUpperCase());

console.log(convertirAMayusculas(arrStrings));