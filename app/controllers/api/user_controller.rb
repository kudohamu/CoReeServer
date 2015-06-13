class Api::UserController < ApplicationController
  require 'securerandom'

  def login
    crypt = ActiveSupport::MessageEncryptor.new(ENV["SECRET_KEY_BASE"])

    @result = "failed"
    case params["provider"]
    when "twitter" then
      client = Twitter::REST::Client.new do |config|
        config.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
        config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
        config.access_token = params["auth_token"]
        config.access_token_secret = params["auth_token_secret"]
      end

      tw_user = client.user(params[:user_id].to_i)

      if (User.where(uid: params[:user_id]).exists?)
        user = User.where(uid: params[:user_id]).first

        token = SecureRandom.uuid

        user.token = crypt.encrypt_and_sign(token)
        @result = if (user.save)
          token
        else
          "failed"
        end
      else
        token = SecureRandom.uuid
        crypt_token = crypt.encrypt_and_sign(token)
        user = User.create(
          name: tw_user.name,
          provider: "twitter",
          uid: params[:user_id],
          token: crypt.encrypt_and_sign(token)
        )

        @result = if (user)
          token
        else
          "failed"
        end
      end
    end

    render formats: [:json], handlers: [:jbuilder]
  end
end
