class JobOffersController < ApplicationController
  before_action :find_current_job, only: %i[new create]
  before_action :authenticate_head!, only: %i[new create]
  before_action :authenticate_user!, only: %i[index]
  before_action :applicant_present, only: %i[index]
  
  def index
    @applicant = Applicant.find_by(user: current_user)
    @job_opening = JobOpening.find_by(applicant: @applicant)
    @job_offer = JobOffer.where(job_opening:@job_opening)
  end

  def new
    @job_offer = JobOffer.find_by(job_opening: @job_opening)
    if @job_offer
      flash[:alert] = 'Proposta já enviada'
      redirect_to job_vacancy_path(@job_vacancy)
    else
      @job_offer = JobOffer.new
    end
  end

  def create
    @job_offer = JobOffer.new(job_offer_params)
    @job_offer.job_opening = @job_opening
    @job_offer.head = current_head
    if @job_offer.save
      @job_opening.accepted!
      flash[:notice] = 'Proposta enviada'
      redirect_to job_vacancy_path(@job_vacancy)
    else
      render :new
    end
  end

  private

  def job_offer_params
    params.require(:job_offer).permit(:initial_date, :salary, :benefits,
                                      :expectatives, :description,
                                      :job_opening_id)
  end

  def applicant_present
    @applicant = Applicant.find_by(user: current_user)
    if @applicant.blank?
      redirect_to new_applicant_path
    end
  end

  def find_current_job
    @job_vacancy = JobVacancy.find(params[:job_vacancy_id])
    @job_opening = JobOpening.find_by(params[:job_opening_id])
  end
end
