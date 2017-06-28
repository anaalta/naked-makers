class AgeController < ApplicationController
  def index
  end

  def new
    @age = Age.new
  end

  def create
    @age = Age.new(response_id: params[:response_id], age: params[:age])
    @age.save

    private

    def age_params
      params.require(:age).permit(:response_id, :age)
    end
end
