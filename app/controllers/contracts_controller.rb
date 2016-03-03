
class ContractsController < ApplicationController
  include ContractRunners

  def create
    run(Create, contract_params) do |on|
      on.success { |contract|
        flash[:message] = 'New session added successfully.'
        redirect_to action: 'show', id: contract.id
      }
      on.failure {
        render :new
      }
    end
  end

  def search
    @contracts = run(Search, contract_params)
  end

  private

  def contract_params
    params[:photographer_id] ||= current_photographer.id if current_photographer
    params.permit(:rate, :wedding_date, :photographer_id, :customer_id)
  end

end
