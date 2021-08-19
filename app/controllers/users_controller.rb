class UsersController < ApplicationController

  before_action :require_login, except:[:new, :create]

  def index
    #show all users except the current user
    @users = User.where("id != ?", current_user.id )

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password, :password_confirmation))
    email = params[:user][:email]
    password = params[:user][:password]
    #save
    return auto_login(email, password) if @user.save
    render :new
  end

  def show
    @user = User.find_by(username: params[:username])
    @comments = @user.comments
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private

  def auto_login(email, password)
    user = User
            .find_by(email: email.downcase)
            .try(:authenticate, password)
    if user
      #store session of current user
      session[:user_id] = user.id
      puts "Logged In"
      redirect_to article_path
    else
      render :new
    end
  end
end

