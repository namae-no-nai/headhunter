class FeedbacksController < ApplicationController
  before_action :find_current_job, only: %i[new create]
  before_action :authenticate_head!, only: %i[new create]
  before_action :authenticate_user!, only: %i[index]
  def index
    @applicant = Applicant.find_by(user: current_user)
    @job_opening = JobOpening.find_by(applicant: @applicant)
    @feedbacks = Feedback.where(job_opening:@job_opening)
  end
  
  def new
    @feedback = Feedback.find_by(job_opening: @job_opening)
    if @feedback
      flash[:alert] = 'Feedback já enviado'
      redirect_to job_vacancy_path(@job_vacancy)
    else
      @feedback = Feedback.new
    end
  end

  def create
    @feedback = Feedback.create(feedback_params)
    @feedback.job_opening = @job_opening
    if @feedback.save
      @job_opening.refused!
      flash[:notice] = 'Feedback enviado'
      redirect_to job_vacancy_path(@job_vacancy)
    else
      render :new
    end
  end
  
  private

  def feedback_params
    params.require(:feedback).permit(:message, :job_opening_id)
  end

  def find_current_job
    @job_vacancy = JobVacancy.find(params[:job_vacancy_id])
    @job_opening = JobOpening.find_by(params[:job_opening_id])
  end
end
