class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorize_request, except: :get_api_key

  # POST: /api/user/get_api_key
  # PARAMS:
  # - username: string
  # - password: string
  def get_api_key
    username = params[:username]
    password = params[:password]
    user = User.find_by_username(username);
    
    if user.present?
      if user.authenticate(password)
        role = Role.select("roles.name").
          joins("LEFT JOIN user_roles ON roles.id = user_roles.role_id").
          where("user_roles.user_id = ?", user.id).first
        payload = {
          user_id: user.id,
          exp: Time.now.to_i + (1 * 3600)
        }
        token = encode(payload);
        data = {
          user_id: user.id,
          user_name: user.username,
          roles: role.present? ? role.name : 'guest',
          token: token
        }

        render json: { "error": "0", "error_code": "", "error_msg": "", "data": data }
      else
        render json: { "error": "1", "error_code": "ER-404", "error_msg": "User not found" }
      end
    else
      render json: { "error": "1", "error_code": "ER-404", "error_msg": "User not found" }
    end
  end

  # POST: /api/users/create
  # HEADERS:
  # - Authorization: Bearer {token}
  # PARAMS:
  # - username: string
  # - password: string
  def create_user
    access = "create_user"
    username = params[:username]
    password = params[:password]

    if check_access(session[:current_user_id], access)
      begin
        exists = User.find_by_username(username)

        if exists.blank?
          user = User.create(username: username, password: password)
          UserCreateJob.perform_later(user.id)

          render json: { "error": "0", "error_code": "", "error_msg": "" }
        else
          render json: { "error": "1", "error_code": "ER-409", "error_msg": "User already exists" }
        end
      rescue => exception
        render json: { "error": "1", "error_code": "ER-400", "error_msg": "User can not be created" }
      end
    else
      render json: { "error": "1", "error_code": "ER-401", "error_msg": "permission denied" }
    end
  end

  # GET: /api/breeds
  # HEADERS:
  # - Authorization: Bearer {token}
  # PARAMS:
  # - id (optional)
  # - limit (optional)
  # - page (optional)
  def list_breeds
    access = "list_breeds"
    limit = params[:limit] || 10
    page = params[:page] || 1
    offset = (page.to_i - 1) * limit.to_i

    if check_access(session[:current_user_id], access)
      query = Cat.limit(limit).offset(offset)
      query = query.where("id = ?", params[:id]) unless params[:id].blank?
      cats = query.all

      render json: { "error": "0", "error_code": "", "error_msg": "", "data": cats }
    else
      render json: { "error": "1", "error_code": "ER-401", "error_msg": "permission denied" }
    end
  end

  # POST: /api/breeds
  # HEADERS:
  # - Authorization: Bearer {token}
  # PARAMS:
  # - name
  # - life_span
  # - origin
  # - temperament
  # - image
  # - hairless
  # - short_legs
  # - suppressed_tail
  def create_breeds
    access = "create_breeds"

    if check_access(session[:current_user_id], access)
      begin
        cat = Cat.create(
          name: params[:name], 
          life_span: params[:life_span],
          origin: params[:origin],
          temperament: params[:temperament],
          image: params[:image],
          hairless: params[:hairless],
          short_legs: params[:short_legs],
          suppressed_tail: params[:suppressed_tail]
        )

        render json: { "error": "0", "error_code": "", "error_msg": "", "id": cat.id }
      rescue => exception
        render json: { "error": "1", "error_code": "ER-400", "error_msg": "breeds can not be created" }
      end
    else
      render json: { "error": "1", "error_code": "ER-401", "error_msg": "permission denied" }
    end
  end

  # PUT: /api/breeds/:id
  # HEADERS:
  # - Authorization: Bearer {token}
  # PARAMS:
  # - name
  # - life_span
  # - origin
  # - temperament
  # - image
  # - hairless
  # - short_legs
  # - suppressed_tail
  def update_breeds
    access = "update_breeds"
    
    if check_access(session[:current_user_id], access)
      begin
        cat = Cat.find(params[:id])
        cat.name = params[:name] if params[:name].present?
        cat.life_span = params[:life_span] if params[:life_span].present?
        cat.origin = params[:origin] if params[:origin].present?
        cat.temperament = params[:temperament] if params[:temperament].present?
        cat.image = params[:image] if params[:image].present?
        cat.hairless = params[:hairless] if params[:hairless].present?
        cat.short_legs = params[:short_legs] if params[:short_legs].present?
        cat.suppressed_tail = params[:suppressed_tail] if params[:suppressed_tail].present?
        cat.save

        render json: { "error": "0", "error_code": "", "error_msg": "", "data": cat }
      rescue => exception
        render json: { "error": "1", "error_code": "ER-400", "error_msg": "breeds can not be updated" }
      end
    else
      render json: { "error": "1", "error_code": "ER-401", "error_msg": "permission denied" }
    end
  end

  # DELETE: /api/breeds/:id
  # HEADERS:
  # - Authorization: Bearer {token}
  def delete_breeds
    access = "delete_breeds"

    if check_access(session[:current_user_id], access)
      cat = Cat.find(params[:id])
      cat.destroy

      render json: { "error": "0", "error_code": "", "error_msg": "breeds deleted" }
    else
      render json: { "error": "1", "error_code": "ER-401", "error_msg": "permission denied" }
    end
  end

  # GET: /api/votes
  # HEADERS:
  # - Authorization: Bearer {token}
  # PARAMS:
  # - cat_id (optional)
  # - limit (optional)
  # - page (optional)
  def get_votes
    access = "get_votes"
    limit = params[:limit] || 10
    page = params[:page] || 1
    offset = (page.to_i - 1) * limit.to_i

    if check_access(session[:current_user_id], access)
      query = Vote.where("user_id = ?", session[:current_user_id]).limit(limit).offset(offset)
      query = query.where("id = ?", params[:cat_id]) unless params[:cat_id].blank?
      votes = query.all

      render json: { "error": "0", "error_code": "", "error_msg": "", "data": votes }
    else
      render json: { "error": "1", "error_code": "ER-401", "error_msg": "permission denied" }
    end
  end

  # POST: /api/votes
  # HEADERS:
  # - Authorization: Bearer {token}
  # PARAMS:
  # - cat_id
  # - value
  def create_votes
    access = "create_votes"

    if check_access(session[:current_user_id], access)
      vote = Vote.where("user_id = ?", session[:current_user_id]).
        where("cat_id = ?", params[:cat_id]).first
      
      if vote.present?
        vote.value = params[:value]
        vote.save
      else
        Vote.create(user_id: session[:current_user_id], cat_id: params[:cat_id], value: params[:value])
      end

      render json: { "error": "0", "error_code": "", "error_msg": "vote created or updated" }
    else
      render json: { "error": "1", "error_code": "ER-401", "error_msg": "permission denied" }
    end
  end

  # GET: /api/favourites
  # HEADERS:
  # - Authorization: Bearer {token}
  # PARAMS:
  # - cat_id (optional)
  # - limit (optional)
  # - page (optional)
  def get_favourites
    access = "get_favourites"
    limit = params[:limit] || 10
    page = params[:page] || 1
    offset = (page.to_i - 1) * limit.to_i

    if check_access(session[:current_user_id], access)
      query = Favourite.where("user_id = ?", session[:current_user_id]).limit(limit).offset(offset)
      query = query.where("id = ?", params[:cat_id]) unless params[:cat_id].blank?
      favourites = query.all

      render json: { "error": "0", "error_code": "", "error_msg": "", "data": favourites }
    else
      render json: { "error": "1", "error_code": "ER-401", "error_msg": "permission denied" }
    end
  end

  # POST: /api/favourites
  # HEADERS:
  # - Authorization: Bearer {token}
  # PARAMS:
  # - cat_id
  def create_favourites
    access = "create_favourites"

    if check_access(session[:current_user_id], access)
      favourite = Favourite.where("user_id = ?", session[:current_user_id]).
        where("cat_id = ?", params[:cat_id]).first
      
      if favourite.present?
        favourite.destroy
      else
        Favourite.create(user_id: session[:current_user_id], cat_id: params[:cat_id])
      end

      render json: { "error": "0", "error_code": "", "error_msg": "favourite created or updated" }
    else
      render json: { "error": "1", "error_code": "ER-401", "error_msg": "permission denied" }
    end
  end
end