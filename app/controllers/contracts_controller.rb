class ContractsController < ApplicationController

  def create
    contract = CreateContract.new({date: params[:wedding_date], rate: params[:rate], photographer_id: current_photographer.id}).execute()
    flash[:message] = 'New session added successfully.'
    redirect_to action: 'show', id: contract.id
  end

  def show

  end

  def search
    @contracts = FindContractsByDate.new(wedding_date_params[:date]).execute()
  end

  private

  def wedding_date_params
    params.require(:contract).permit(:date)
  end
end
