class ProfilesController < ApplicationController
  before_action :set_profile

  def show
  end

  def groups
    @groups = @user.groups
    @joined_groups = @user.joined_groups
  end

  def categories
    @categories = @user.categories
  end

  private

  def set_profile
    @user = User.find(params[:id])
  end
end
