class RegistrationsController < Devise::RegistrationsController

  def create
    @registration = current_user.registration.new(sign_up_params)

    respond_to do |format|
      if @registration.save
        format.html { redirect_to root_path, notice: 'Account was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @registration = current_user.registration
  respond_to do |format|
    if @registration.update(account_update_params)
      format.html { redirect_to root_path, notice: 'Update was successful.' }
    else
      format.html { render :edit }
      format.json { render json: @registration.errors, status: :unprocessable_entity }
    end
  end
end

  private

    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :cellphone_number, :email, :password, :password_confirmation)
    end

    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :cellphone_number, :email, :password, :password_confirmation, :current_password)
    end
end
