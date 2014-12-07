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

    end
  end
end