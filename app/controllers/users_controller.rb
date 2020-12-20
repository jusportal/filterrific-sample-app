class UsersController < ApplicationController
  def index
    @filterrific = initialize_filterrific(
      User,
      params[:filterrific]
    ) or return
    @users = @filterrific.find.page(params[:page])
 
    respond_to do |format|
      format.html
      format.js
    end
  end
end
