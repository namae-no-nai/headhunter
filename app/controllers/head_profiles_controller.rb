# frozen_string_literal: true

# Profile of the headhunter
class HeadProfilesController < ApplicationController
  before_action :authenticate_head!

  def index
    @job_vacancies = JobVacancy.where(head: current_head)
  end
end
