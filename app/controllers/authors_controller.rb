class AuthorsController < ApplicationController
  before_action :authenticate_author!, :redirect_unless_admin
  def manage
    @authors = Author.all
  end

  def destroy
    @author = Author.find(params[:id])

    if @author.destroy
        redirect_to root_url, notice: "Author deleted."
    end
  end

  private
  def redirect_unless_admin
    unless current_author.try(:admin?)
      flash[:alert] = "Only admins can do that"
      redirect_to root_path
    end
  end

end
