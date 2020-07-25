# frozen_string_literal: true

# Used for hedhunter to favorite an applicant
class FavoritesController < ApplicationController
  before_action :authenticate_head!

  def create
    @favorite = Favorite.new
    @favorite.head = current_head
    @favorite.applicant = Applicant.find(params[:applicant_id])
    @favorite.save
    flash[:notice] = 'Candidato destacado'
    redirect_to applicant_path(@favorite.applicant)
  end

  def destroy
    @favorite = Favorite.search(params[:applicant_id], current_head)
    @favorite.destroy
    flash[:notice] = 'Candidato não é mais destacado'
    redirect_to applicant_path(@favorite.applicant)
  end
end
