class UsersController < ApplicationController
	def index
		p "index"
		 @users = User.all
	end
	def show
		p "hi"
		@user=User.find(params[:id])
	end
	def new
		@user=User.new
	end
	def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
	def create
		@user=User.new(user_params)
		if @user.save
			flash[:success]="you are successfully added"
			redirect_to @user
		else
			render 'new'
	end
	

end


 private
 def user_params
 	params.require(:user).permit(:name, :email,:password,:password_confirmation)                                   
 end
end