require_relative '../../app/facades/session_contract'

class ContractsController < ApplicationController
  
  def create
    contract = SessionContract.create(params)
    flash[:message] = 'New session added successfully.'
    redirect_to action: 'show', id: contract.id
  end

  def show

  end

  def search
    @contracts = SessionContract.find_by_date(params[:contract][:date])
  end
end
