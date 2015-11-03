// creamos un nuevo scope para no crear variables globales
(function() {
  var $document = $(document);
  var signsCheckerInterval = undefined;

  $document.on('page:change', function() {
    // Escuchamos el evento ajax:success, que emitirán los requests Ajax
    // generados por Rails al recibir una respuesta exitosa
    $('#new_initiative_sign').on('ajax:success', function(event, data, status, xhr) {
      // reemplazamos el contenido html de este elemento por el que nos llegó en la respuesta al request Ajax
      $('#signs-container').html(data);
    });


    var $signsCounter = $('#signs-count strong');
    if($signsCounter.length) {
      // setInterval nos entrega un identificador que luego podremos
      // utilizar para eliminar la continuidad de su ejecución
      signsCheckerInterval = window.setInterval(function() {
        // $.getJSON es similar a $.get, pero sirve exclusivamente
        // si sabemos que la respuesta será un objeto JSON. A su vez,
        // $.get es un shortcut de $.ajax especificando HTTP method GET.

        // Obtenemos la URL desde la cual obtener la cuenta de firmas
        // desde el atributo data-update-url, que fue generado desde
        // el servidor en este elemento.
        $.getJSON($signsCounter.data('update-url'), function(data) {
          $signsCounter.html(data.quantity);
        });
      }, 5000);
    }
  });

  // IMPORTANTE: como al usar turbolinks no estamos realmente cambiando de página necesariamente,
  // necesitamos dejar de hacer el chequeo cuando la página cambia mediante turbolinks.
  // Escuchando este evento podemos saber cada vez que estemos a punto de cambiar la página por una página nueva
  // y, por lo tanto, deberíamos eliminar el chequeo de firmas.
  $document.on('page:before-unload', function() {
    window.clearInterval(signsCheckerInterval);
  });
})();
