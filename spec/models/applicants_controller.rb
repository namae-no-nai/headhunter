class ApplicantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_head!
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
      @favorite = star
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

  def star
    if head_signed_in?
      @favorite = Favorite.search(params[:applicant_id],current_head)
    end 
	end
end
