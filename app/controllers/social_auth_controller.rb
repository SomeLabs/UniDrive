class SocialAuthController < ApplicationController

  before_action :authenticate_user!

  def create
    options = {
      user: current_user,
      provider: env['omniauth.auth'][:provider],
      auth_hash: env['omniauth.auth']
    }

    response = ::SocialAuth::Base.new(options).create

    render json: response
  end
end
