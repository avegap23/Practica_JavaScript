// 4)
function Coche(marca, modelo, precio, anio_matriculacion) {
    this.marca = marca;
    this.modelo = modelo;
    this.precio = precio;
    this.anio_matriculacion = anio_matriculacion;
}

const c1 = new Coche('Seat', 'Ibiza', 19000, 2006);
const c2 = new Coche('Ford', 'Puma', 25000, 2020);
const c3 = new Coche('Citröen', 'DS5', 22000, 2018);
const c4 = new Coche('Renault', 'Captur', 15000, 2015);
const c5 = new Coche('Opel', 'Corsa', 5000, 2003);

const listaCoches = [c1, c2, c3, c4, c5];

listaCoches.forEach(coche => {
    console.log(coche);
});

// 5)
function rebajaCoches(arr_coches, descuento_porciento) {
    arr_coches.forEach(coche => {
        for (precio in coche) {
            precio = precio - (precio * descuento_porciento);
        }
    });
    return arr_coches;
}

console.log("-----------------------------------");

console.log(rebajaCoches(listaCoches, 15));