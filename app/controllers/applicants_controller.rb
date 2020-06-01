class ApplicantsController < ApplicationController
  def show
    if @applicant = Applicant.find_by(user: current_user)
    @applicant = Applicant.find_by(user: current_user)
    else
      redirect_to new_applicant_path
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
end