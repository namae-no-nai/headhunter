class JobOpeningsController < ApplicationController
    
  def index
    @job_openings = JobOpening.where(applicant: @applicant)
  end

  def show
    @job_vacancy = JobVacancy.find(params[:job_vacancy_id])
    @job_opening = JobOpening.find_by(job_vacancy: @job_vacancy,
                                      applicant: @applicant)
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
end 
