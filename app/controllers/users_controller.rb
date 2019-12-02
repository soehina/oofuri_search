class UsersController < ApplicationController
  before_action:forbid_login_user,{only:[:login]}
  def form
  end

#   def new
#     @user=User.new
#   end

#   def create
#     @user=User.new(name: params[:name],password_digest: params[:password])
#     if @user.save
#       session[:user_id]=@user.id
#       redirect_to('/results/new')
#     else
#       render('users/new')
#     end
#   end

  def login
    @user=User.find_by(name: params[:name],password_digest: params[:password])
    if @user
      session[:user_id]=@user.id
      redirect_to('/results/new')
    else
      render('users/form')
    end
  end

  def logout
    session.delete(:user_id)
    @current_user=nil
    redirect_to('/')
  end

  def edit
    @user=User.find_by(id: params[:id])
  end

  def update
    @user=User.find_by(id: params[:id])
    @user.name=params[:name]
    @user.password_digest=params[:password]
    if @user.save
      redirect_to("/")
    else
      render("/users/#{@current_user.id}/edit")
    end
  end
end
