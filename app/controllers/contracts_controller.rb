require_relative '../../app/facades/session_contract'

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

  def show

  end

  def search
    @contracts = SessionContract.find_by_date(params[:contract][:date])
  end

  def run(klass, *args, &block)
    klass.new(repo, &block).run(*args)
  end

  def repo
    @repo = PhotographerRepository.new
  end

  private

  def contract_params
    params[:photographer_id] ||= current_photographer.id if current_photographer
    params.permit(:rate, :wedding_date, :photographer_id, :customer_id)
  end

end
