class JobVacanciesController < ApplicationController
	before_action :authenticate_visitor, only: %i[show new create destroy]
	before_action :authenticate_applicant, only: %i[new create edit update destroy] 

  def index
    @job_vacancies = JobVacancy.all
  end

  def show
    @job_vacancy = JobVacancy.find(params[:id])
    @job_offer = JobOffer.where(job_vacancy: @job_vacancy)
    @reply_job_offer = ReplyJobOffer.where(job_offer: @job_offers)
    @job_openings = JobOpening.where(job_vacancy: @job_vacancy)
    if user_signed_in?
      @applicant = Applicant.find_by(user: current_user)
      @job_openings = JobOpening.where(applicant: @applicant, job_vacancy: @job_vacancy)
    end
  end

  def new
    @job_vacancy = JobVacancy.new
  end

  def create
    @job_vacancy = JobVacancy.create(job_vacancy_params)
    @job_vacancy.head = current_head
    if @job_vacancy.save
      flash[:notice] = 'Vaga cadastrada com sucesso'
      redirect_to @job_vacancy
    else
      render :new
    end
  end

  def destroy
    @job_vacancy = JobVacancy.find(params[:id])
    @job_vacancy.destroy
    redirect_to job_vacancies_path
  end

  def search
    @job_vacancies = JobVacancy.search(params[:q])
    render :index
  end

  private

  def job_vacancy_params
    params.require(:job_vacancy).permit(:title, :job_description,
                                        :desired_skills,
                                        :income_range, :job_level, :deadline,
                                        :area, :head_id)
  end

  def authenticate_applicant
    if user_signed_in?
      redirect_to root_path
    end
  end

  def authenticate_visitor
    if not user_signed_in? 
      if not head_signed_in?
        redirect_to root_path
      end
    end
  end
end  
