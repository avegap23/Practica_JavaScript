document.addEventListener('DOMContentLoaded', () => {
  console.log('ready')
  init()
});

function init() {
  onshowmovie()
}

function onshowmovie() {
  const modalmovies = document.getElementById('modalmovies')
  if (modalmovies) {
    modalmovies.addEventListener('show.bs.modal', (event) => {
      const button = event.relatedTarget
      const person = button.getAttribute('data-bs-person')
      const nombre = button.getAttribute('data-bs-nombre')

      modalmovies.querySelector('h4').textContent = nombre

      // AJAX
      const xhr = new XMLHttpRequest();
      const url = "Controller?op=filmografia&person=" + person
      xhr.open("GET", url, true);
      xhr.onload = () => {
        if (xhr.status == 200) {
          const modalbody = modalmovies.querySelector('.modal-body')
          modalbody.innerHTML = xhr.responseText;
        }
      };
      xhr.send();
    })
  }
}
