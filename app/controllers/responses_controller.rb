class ResponsesController < ApplicationController

  def new
    @languages = Language.all
    @salaries = Salary.all
  end

  def create
    if !response_params[:languages] || response_params[:city] == ""
      flash[:notice] = "Please complete the first two fields"
      redirect_to new_response_path
      return
    end
    @response ||= Response.new
    @response.save
    create_languages
    create_salaries
    create_response_location_age(@response.id, response_params[:city], response_params[:age] )
  end

  private

  def response_params
    params.require(:response).permit(:city, :age, languages: [], salaries: [])
  end

  def create_languages
    response_params[:languages].each do |language|
    create_language_join_response_path(language, @response.id)
    end
  end

  def create_salaries
    response_params[:salaries].each do |salary|
    create_salary_join_response_path(salary, @response.id)
    end
  end

  def create_language_join_response_path(language, response_id)
    @response_language = ResponseLanguage.new(language_id: language, response_id: response_id)
    @response_language.save
  end

  def create_salary_join_response_path(salary, response_id)
    @response_salary = ResponseSalary.new(salary_id: salary, response_id: response_id)
    @response_salary.save
  end

  def create_response_location_age(response_id, city, age)
    redirect_to response_locations_path(response_id: response_id, city: city, age: age)
  end

end
