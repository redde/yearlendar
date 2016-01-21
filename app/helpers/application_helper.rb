module ApplicationHelper
  def full_or_short
    return Calendar::SHORTRUDAYS if params[:short_days].present?
    Calendar::RUDAYS
  end
end
