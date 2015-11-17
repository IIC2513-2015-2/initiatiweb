class Api::BaseController < ApplicationController#ActionController::Base
  before_action :authenticate

  private

  def authenticate
    return unless api_key = request.headers[:authorization]
    @current_user = User.find_by(api_key: api_key)
  end
end
