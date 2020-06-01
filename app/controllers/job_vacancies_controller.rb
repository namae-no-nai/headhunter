class JobVacanciesController < ApplicationController 
  before_action :authenticate_head!, except: %i[index search]

  def index
    @job_vacancies = JobVacancy.all
  end
  
  def show
    @job_vacancy = JobVacancy.find(params[:id])
  end

  def new
    @job_vacancy = JobVacancy.new
  end

  def create
    @job_vacancy = JobVacancy.create(job_params)
    @job_vacancy.head = current_head
    if @job_vacancy.save
      flash[:notice] = 'Vaga cadastrada com sucesso'
      redirect_to @job_vacancy
    else
      render :new
    end
  end

  def search
    @job_vacancies = JobVacancy.search(params[:q])
    render :index
  end
  
  private
  
  def job_params
    params.require(:job_vacancy).permit(:title, :job_description,
                                        :desired_skills,
                                        :income_range, :job_level, :deadline,
                                        :area, :head_id)
  end
end
