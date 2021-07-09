class HomeController < ApplicationController
  def index
    render json: { "error": "0", "error_code": "", "error_msg": "welcome to RoR" }
  end
end