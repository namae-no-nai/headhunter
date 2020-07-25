class ApplicantsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update]
  before_action :authenticate_head!, only: %i[index]
  before_action :authenticate_visitor, only: %i[show]
  before_action :profile_owner, only: %i[edit update]
  

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
      @applicant = Applicant.find_by(params[:id])
      @posts = Post.where(head: current_head, applicant: @applicant)
      @favorite = Favorite.where(head_id: current_head, applicant_id: @applicant)
    end
  end
  
  def new
    @applicant = Applicant.new
  end
  
  def create
    @applicant = Applicant.create(applicant_params)
    @applicant.user = current_user
    if @applicant.save
      flash[:notice] = 'Perfil criado com sucesso'
      redirect_to root_path
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
  
  def profile_owner
    @applicant = Applicant.find(params[:id])
    if @applicant.user != current_user
      redirect_to root_path
      flash[:alert] = 'Ação não permitida'
    end
  end

  def authenticate_visitor
    if !(user_signed_in? || head_signed_in?)
      redirect_to root_path
    end
  end    
end