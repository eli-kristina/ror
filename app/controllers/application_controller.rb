require 'jwt'

class ApplicationController < ActionController::Base
  HMAC = "eyJkYXRhIjoidGVzdCJ9"

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    action = params[:action]

    begin
      decode_token = decode(header)
      payload =  HashWithIndifferentAccess.new decode_token[0]
      session[:current_user_id] = payload[:user_id]
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: "1", error_code: "ER-404", error_msg: e.message }
    rescue JWT::DecodeError => e
      render json: { error: "1", error_code: "ER-500", error_msg: e.message }
    end
  end

  protected

  # payload:
  # - user_id
  # - exp
  def encode(payload)
    JWT.encode payload, HMAC, 'HS256'
  end

  def decode(token)
    JWT.decode token, HMAC, true, { algorithm: 'HS256' }
  end

  def check_access(user_id, action)
    permissions = RolePermission.select("role_permissions.permission_id").
      joins("LEFT JOIN permissions ON permissions.id = role_permissions.permission_id").
      joins("LEFT JOIN user_roles ON user_roles.role_id = role_permissions.role_id").
      where("user_roles.user_id = ?", user_id).
      where("permissions.name = ?", action).
      order("permissions.name ASC").first
    
    if permissions.present?
      return true
    end
    return false
  end
end