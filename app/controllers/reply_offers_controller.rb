class ReplyOffersController < ApplicationController
  before_action :find_current_offer, only: %i[new create]
  before_action :authenticate_head!, only: %i[index]
  before_action :authenticate_user!, only: %i[new create]
  before_action :applicant_present, only: %i[new create]

  def index
    @job_offer = JobOffer.find_by(head: current_head)
    @reply_offers = ReplyOffer.where(job_offer: @job_offer)
  end

  def new
    @reply_offer = ReplyOffer.find_by(job_offer: @job_offer)
    if @reply_offer
      flash[:alert] = 'Proposta já enviada'
      redirect_to job_offers_path
    else
      @reply_offer = ReplyOffer.new
    end
  end

  def create
    @reply_offer = ReplyOffer.create(reply_params)
    @reply_offer.job_offer = @job_offer
    @reply_offer.save
    flash[:notice] = 'Proposta enviada'
    redirect_to job_offers_path   
  end

  private

  def applicant_present
    @applicant = Applicant.find_by(user: current_user)
    if @applicant.blank?
      redirect_to new_applicant_path
    end
  end
 

  def reply_params
    params.require(:reply_offer).permit(:answer, :message)
  end
  def find_current_offer
    @job_offer = JobOffer.find_by(params[:job_offer_id])
  end
end
