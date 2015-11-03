$(document).on('page:change', function() {
  // Escuchamos el evento ajax:success, que emitirán los requests Ajax
  // generados por Rails al recibir una respuesta exitosa
  $('#new_initiative_sign').on('ajax:success', function(event, data, status, xhr) {
    // reemplazamos el contenido html de este elemento por el que nos llegó en la respuesta al request Ajax
    $('#signs-container').html(data);
  });
});
