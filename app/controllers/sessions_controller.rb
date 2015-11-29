class SessionsController < ApplicationController
  def index

  end

  def search
    @sessions = FindSessionsByDate.new(wedding_date_params[:date]).execute()
  end

  private

  def wedding_date_params
    params.require(:wedding_search).permit(:date)
  end
end
