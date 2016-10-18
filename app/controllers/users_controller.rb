class UsersController < ApplicationController
def new
    @user = User.new
    @faculty_names = Faculty.all
end

def create
  
  user_name = Faculty.where(:id=>params[:user][:faculty_id]).select(:faculty_name).take.faculty_name.to_s
  if !User.exists?(:faculty_id=>params[:user][:faculty_id])
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      
      @user.update(faculty_name: user_name)
      
      redirect_to '/login'
      flash[:success] = user_name+ " is signed up!"
    else
      flash[:error] = "Please Enter Sign-up info"
      redirect_to '/signup'
    end
  else
    flash[:error] = "User Already Exists!"
    redirect_to '/signup' 
  end
end

 # def destroy
  # User.find(params(:user_id).destroy
  # redirect_to '/signup'
 # end

private
  def user_params
    params.require(:user).permit(:faculty_id, :faculty_name, :email, :password)
  end
end
