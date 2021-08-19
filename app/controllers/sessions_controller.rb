class SessionsController < ApplicationController

  def new

  end

  def create
    #find user by email
    user = User
            .find_by(email: params[:session][:email].downcase)
            .try(:authenticate, params[:session][:password])
    if user
      #store session of current user
      session[:user_id] = user.id
      puts "Logged In"
      redirect_to article_path
    else
      render :new
    end
  end

  def destroy
    #set session to nil
    session[:user_id] = nil
    puts "Logged Out"
    redirect_to article_path
  end

end