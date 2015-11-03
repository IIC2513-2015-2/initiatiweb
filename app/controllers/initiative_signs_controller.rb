class InitiativeSignsController < ApplicationController
  def create
    @initiative = Initiative.find(params[:initiative_id])
    @initiative_sign = InitiativeSign.create(initiative_sign_params.merge(user_id: current_user.id, initiative_id: params[:initiative_id]))

    # podemos responder de manera diferente ya sea
    # examinando si el request es o no Ajax (xhr)
    if request.xhr?
      @signs_count = @initiative.signs.count
      @user_sign = @initiative.signs.of_user(current_user.id) if current_user
      render partial: 'initiatives/signs'
    else
      redirect_to ngo_initiative_path(initiative.ngo, initiative)
    end

    # o podríamos hacerlo simplemente por el content type pedido
    # en el request:
    # respond_to do |format|
    #   format.html {}
    #   # éste es tipo default pedido en requests Ajax generados por Rails.
    #   # y es procesado automáticamente por el generador del request (se ejecutará código JS enviado)
    #   format.js { render text: 'alert("Gracias por firmar");' }
    # end
  end

  def count
    initiative = Initiative.find(params[:initiative_id])
    # Para un objeto pequeño como éste podemos hacerlo directamente.
    # Pero si es más complejo, es recomendable utilizar json builder (viene en Rails)
    # o alguna gema que ayude de mejor manera, como Rabl. Ambos permiten generar
    # el objeto JSON utilizando un template (esto será aún más necesario al crear APIs).
    render json: { quantity: initiative.signs.count }
  end

  private
  def initiative_sign_params
    params.require(:initiative_sign).permit(:message)
  end
end
