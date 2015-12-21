class WelcomeController < ApplicationController
  def index
    @calendar = Calendar.new(params[:year])
  end
end
