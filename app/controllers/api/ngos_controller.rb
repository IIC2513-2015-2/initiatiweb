module Api
  class NgosController < BaseController

    def show
      ngo = Ngo.find(params[:id])
      puts ngo_url(ngo)
      render json: ngo, include: 'initiatives'
    end

    def update
      ngo = Ngo.find(params[:id])
      # This action requires to have a valid user
      if not @current_user || ngo.users.include?(@current_user)
        render nothing: true, status: :unauthorized and return
      end
      if ngo.update(ngo_params)
        render nothing: true, status: :no_content
      else
        render json: { errors: ngo.errors }, status: :bad_request
      end
    end

    private

    def ngo_params
      params.require(:ngo).permit(:name)
    end
  end

end
