class RegistrationsController < ApplicationController
  def new
  end

  def create
    if current_user.create(user_params)
      redirect_to root_path
    end
   else
    render :edit
   end
end
