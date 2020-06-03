class ApplicantsController < ApplicationController
  before_action :authenticate_visitor
  before_action :authenticate_head, only: %i[new create edit udpate]
  before_action :authenticate_applicant_profile, except: %i[new create]

  def star
    @applicant = Applicant.find(params[:applicant_id])
  
		if @applicant.mvp?
			@applicant.not_mvp!
		else
			@applicant.mvp!
			flash[:notice] = 'Perfil destacado'
		end
		redirect_to @applicant
  end

  def starred
    @job_vacancy = JobVacancy.find(params[:job_vacancy_id])
    @job_opening = JobOpening.find(params[:job_opening_id])
  
		if @job_opening.applicant.mvp?
			@job_opening.applicant.not_mvp!
		else
			@job_opening.applicant.mvp!
			flash[:notice] = 'Perfil destacado'
		end
		redirect_to @job_vacancy 
  end

  def index
    @applicants = Applicant.all
  end

  def show
    if user_signed_in?
      if @applicant = Applicant.find_by(user: current_user)
        @posts = Post.where(applicant: @applicant)
      else
        redirect_to new_applicant_path
      end
    end
    if head_signed_in?
      @applicant = Applicant.find(params[:id])
      @posts = Post.where(head: current_head, applicant: @applicant)
    end
  end

  def new
    @applicant = Applicant.new
  end

  def create
    @applicant = Applicant.create(applicant_params)
    @applicant.user = current_user
    if @applicant.save
      flash[:notice] = 'Perfil cadastrado com sucesso'
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @applicant = Applicant.find(params[:id])
  end

  def update
    @applicant = Applicant.find(params[:id])
    if @applicant.update(applicant_params)
      redirect_to @applicant
    else
      render :edit
    end
  end

  private

  def applicant_params
    params.require(:applicant).permit(:full_name, :social_name, :birthdate,
                                      :academic, :description, :experience,
                                      :photo, :user_id)
  end
  	def authenticate_head
      if head_signed_in?
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

  def find_applicant
    @applicant = Applicant.find_by(params[user: current_user])
  end

  def authenticate_applicant_profile
    if user_signed_in?
      if not find_applicant
				redirect_to new_applicant_path
			end
		end 
	end
end
