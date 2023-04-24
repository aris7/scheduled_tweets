# frozen_string_literal: true

class MainController < ApplicationController
  def index
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])    
    end 
    # flash.now[:notice] = 'Logged in successfully'
    # flash.now[:alert] = 'Invalid email or password'
  end
end
