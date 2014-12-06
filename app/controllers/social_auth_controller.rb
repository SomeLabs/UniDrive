class SocialAuthController < ApplicationController

  def create
    options = {
      user: current_user,
      provider: env['omniauth.auth'][:provider],
      auth_hash: env['omniauth.auth']
    }

    ::SocialAuth::Base.new(options).create
  end
end
