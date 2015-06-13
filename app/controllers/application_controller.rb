class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  class Forbidden < StandardError; end

  before_filter :authorize

  @images_root_dir = "#{Rails.root}/public/uploads"

  class << self
    def get_images_root_dir
      "#{@images_root_dir}"
    end

    def get_cloth_icon_dir
      "#{@images_root_dir}/cloth_icons"
    end

    def get_cloth_qr_dir
      "#{@images_root_dir}/cloth_qrs"
    end
  end

  def authorize
    crypt = ActiveSupport::MessageEncryptor.new(ENV["SECRET_KEY_BASE"])
    if (request.headers["Authorization"].present?)
      user_id = request.headers["Authorization"].split(":")[0]
      server_token = request.headers["Authorization"].split(":")[1]

      if server_token && user_id
        @current_user = User.find_by_uid(user_id)
        if (@current_user)
          @current_user = nil unless crypt.decrypt_and_verify(@current_user.token) == server_token
        end
      end
    end
  end

  def login_check
    raise Forbidden unless @current_user
  end
end
