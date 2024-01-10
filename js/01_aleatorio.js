// 1)
const numeroAleatorio = max => {
    return Math.round(Math.random() * max);
}

// 2)
const premios = new Array();

for (let i = 1; i < 11; i++) {
    premios[i] = numeroAleatorio(100000);
}

premios.forEach(element => {
    console.log(`Premio ${premios.indexOf(element)}: ${element}`)
});