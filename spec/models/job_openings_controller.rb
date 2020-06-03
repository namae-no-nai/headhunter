class JobOpeningsController < ApplicationController
  before_action :authenticate_visitor
  before_action :authenticate_head, only: %i[index new create]
  before_action :find_applicant
  before_action :already_sent, only: %i[new create]

  
  def index
    @job_openings = JobOpening.where(applicant: @applicant)
  end

  def show
    @job_vacancy = JobVacancy.find(params[:job_vacancy_id])
    @job_opening = JobOpening.find_by(job_vacancy: @job_vacancy, applicant: @applicant)
    @feedback = Feedback.find_by(job_opening: @job_opening)
  end

  def new
    @job_vacancy = JobVacancy.find(params[:job_vacancy_id])
    @job_opening = JobOpening.new
  end

  def create
    @job_vacancy = JobVacancy.find(params[:job_vacancy_id])
    @job_opening = JobOpening.create(job_opening_params)
    @job_opening.applicant = Applicant.find_by(user: current_user)
    @job_opening.job_vacancy = JobVacancy.find(params[:job_vacancy_id])
    if @job_opening.save
      @job_opening.on_hold!
      flash[:notice] = 'Carta criada com sucesso'
      redirect_to @job_opening.job_vacancy
    else
      @job_vacancy = JobVacancy.find_by(params[:job_vacancy_id])
      render :new
    end
  end

  private

  def job_opening_params
    params.require(:job_opening).permit(:letter, :status,
                                        :job_vacancy_id, :applicant_id)
  end

  def authenticate_head
    if head_signed_in?
      redirect_to root_path
    end
  end

  def already_sent
    @applicant = Applicant.find_by(user: current_user)
    @job_vacancy = JobVacancy.find(params[:job_vacancy_id])
    @job_opening = JobOpening.where(applicant: @applicant, job_vacancy: @job_vacancy)
    if @job_opening.any?
      redirect_to job_openings_path
      flash[:alert] = 'Carta já enviada'
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
