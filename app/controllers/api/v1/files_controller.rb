module Api
  module V1
    class FilesController < ApplicationController
      before_action :authenticate_user!

      def index
        @files = current_user.files.where(parent_id: nil)
      end

      def show
        @files = current_user.files.where(parent_id: params[:id])
      end

      def link
        @file = ::ExternalFile.where(id: params[:id])
        options = {
            user: current_user,
            provider: @file.application.provider
        }

        link = ::LinkServices::BaseService.new(options).fetch_link(@file)


        render { json: {link: link} }
      end

    end
  end
end