class ListingsController < ApplicationController
  before_action :find_user_skill, only: [:show]

  def index
    @user_skills = UserSkill.all
  end

  def show
  end

  def new
    @user_skill = UserSkill.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_user_skill

  end
end
