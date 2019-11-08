require 'sinatra'
require 'sinatra/reloader' if development?
require 'haml'
require 'active_support/all'
require_relative 'calendar'

set :public_folder, 'public'

helpers do
  def full_or_short
    return Calendar::SHORTRUDAYS if params[:short_days].present?
    Calendar::RUDAYS
  end
end

get '/' do
  @calendar = Calendar.new(params[:year])
  haml :index, layout: :application
end
