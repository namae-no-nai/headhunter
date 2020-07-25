# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_applicant
  before_action :authenticate_user
  before_action :can_edit, only: %i[edit update]

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.applicant = Applicant.find(params[:applicant_id])
    @post.head = current_head
    if @post.save
      flash[:notice] = 'Postado com sucesso'
      redirect_to @applicant
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @applicant
      flash[:notice] = 'Post atualizado'
    else
      @applicant = Applicant.find(params[:applicant_id])
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = 'Post deletado'
    redirect_to @applicant
  end

  private

  def post_params
    params.require(:post).permit(:content, :applicant_id, :head_id)
  end

  def find_applicant
    @applicant = Applicant.find(params[:applicant_id])
  end

  def can_edit
    @head = Head.find(params[:id])
    @post = Post.find(params[:id])
    return if @post.head == @head
      flash[:notice] = 'cannot edit'
      redirect_to applicants_path(@applicant)
    end
  end

  def authenticate_user
    redirect_to @applicant if user_signed_in?
  end
end
