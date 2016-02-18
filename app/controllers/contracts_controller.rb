require_relative '../../app/facades/session_contract'

class ContractsController < ApplicationController

  def create
    flash[:message] = 'New session added successfully.'
    redirect_to action: 'show', id: SessionContract.create(params).id
  end

  def show

  end

  def search
    @contracts = SessionContract.find_by_date(params[:contract][:date])
  end
end
