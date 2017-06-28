class ResponseSalariesController < ApplicationController
  def create
    @salary = Salary.new(response_id: params[:response_id], salary_id: params[:salary_id])
    @salary.save
  end

  def salary_params
    params.require(:response).permit(:response_id, :salary_id)
  end
end
