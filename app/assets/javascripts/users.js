// Creamos un nuevo scope para que todas las variables
// locales definidas aquí no sean globales.
(function() {
  var ERROR_CLASS = 'field_with_errors';
  var ERROR_MESSAGE_CLASS = 'error';

  function clearErrors($form) {
    var $containers = $form.find('.' + ERROR_CLASS);
    $containers.removeClass(ERROR_CLASS).find('.' + ERROR_MESSAGE_CLASS).hide();
  }

  function markError($elem, message) {
    var $container = $elem.closest('div');
    if($container.hasClass(ERROR_CLASS)) {
      // si ya está marcado como error, no hacemos nada
      return;
    }
    $container.addClass(ERROR_CLASS);
    // obtenemos o creamos un elemento para mostrar el mensaje de error
    var $errorMessage = $container.find('.' + ERROR_MESSAGE_CLASS);
    if(!$errorMessage.length) {
      $errorMessage = $('<span></span>').addClass(ERROR_MESSAGE_CLASS);
      $errorMessage.insertAfter($elem);
    }
    $errorMessage.html(message).show();
  }

  function userValidation() {
    $('#new_user').on('submit', function(event) {
      var $form = $(this);
      clearErrors($form);
      var $requiredFields = $form.find('input.required');
      $requiredFields.each(function(i, elem) {
        var $elem = $(elem);
        if($elem.val().trim().length === 0) {
          markError($elem, 'Debes ingresar un valor');
          event.preventDefault();
        }
      });

    });
  }
  // Debemos usar page:change en lugar de DOMContentLoaded (jquery 'ready')
  // para que el callback se ejecute no sólo en ese evento sino también
  // al cambiar de página usando turbolinks (page:change no es un evento estándar,
  // sino que gatillado por turbolinks al cambiar de página o al cargar un DOM inicial, DOMContentLoaded)
  $(document).on('page:change', userValidation);
})();
