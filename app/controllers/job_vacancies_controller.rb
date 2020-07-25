# frozen_string_literal: true

# Related to the state of job applied by an applicant
class JobVacanciesController < ApplicationController
  before_action :authenticate_head!, only: %i[new create]
  before_action :authenticate_user!, only: %i[index]
  before_action :authenticate_visitor, only: %i[index search]

  def index
    @job_vacancies = JobVacancy.all
  end

  def show
    @job_vacancy = JobVacancy.find(params[:id])
    @job_openings = JobOpening.where(job_vacancy: @job_vacancy)
    return unless user_signed_in?

    @applicant = Applicant.find_by(user: current_user)
    @job_openings = JobOpening.where(applicant: @applicant, job_vacancy: @job_vacancy)
  end

  def new
    @job_vacancy = JobVacancy.new
  end

  def create
    @job_vacancy = JobVacancy.create(job_params)
    @job_vacancy.head = current_head
    if @job_vacancy.save
      flash[:notice] = 'Vaga cadastrada com sucesso'
      redirect_to @job_vacancy
    else
      render :new
    end
  end

  def search
    @job_vacancies = JobVacancy.search(params[:q])
    render :index
  end

  private

  def job_params
    params.require(:job_vacancy).permit(:title, :job_description,
                                        :desired_skills,
                                        :income_range, :job_level, :deadline,
                                        :area, :head_id)
  end

  def authenticate_visitor
    redirect_to root_path unless user_signed_in? || head_signed_in?
    return unless user_signed_in?

    @applicant = Applicant.find_by(user: current_user)
    redirect_to new_applicant_path if @applicant.blank?
  end
end
