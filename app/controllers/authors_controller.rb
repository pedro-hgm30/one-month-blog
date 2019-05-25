class AuthorsController < ApplicationController
  before_action :authenticate_author!, :redirect_unless_admin
 
  def manage
    @authors = Author.all
    @users = User.all
  end

  def destroy
    @author = Author.find(params[:id])

    if @author.destroy
      redirect_to root_url, notice: "Author deleted."
    end
  end

  def delete
    @user = User.find(params[:id])

    if @user.destroy
      redirect_to root_url, notice: "User deleted."
    end
  end

  # this method guarantees that the actions above
  # will only be performed by admin authors 
  private
  def redirect_unless_admin
    unless current_author.try(:admin?)
      flash[:alert] = "Only admins can do that"
      redirect_to root_path
    end
  end

end
