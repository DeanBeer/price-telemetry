class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def permitted_params
    @permitted_params ||= PermittedParams.new(params)
  end

end
