        // Verifica si ya se ha realizado la acción
        var clic = localStorage.getItem('clic') === 'true';

        // Espera a que se cargue completamente la página
        window.onload = function() {
            // Verifica si aún no se ha hecho clic
            if (!clic) {
                // Encuentra el botón por su id
                var boton = document.getElementById('ver');

                // Simula un clic en el botón
                boton.click();

                // Marca que se ha hecho clic en el almacenamiento local
                localStorage.setItem('clic', 'true');
            }
        };
