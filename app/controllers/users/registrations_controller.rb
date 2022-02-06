# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!, :redirect_unless_register, only: [:new, :create]
  skip_before_action :require_no_authentication

  private

  def redirect_unless_register
    unless user_signed_in?
      flash[:alert] = "Эта операция дсотупна только зарегистрированным пользователям"
      redirect_to root_path
    end
  end

  def after_sign_up_path_for(resource)
    users_path
  end

  def sign_up(resource_name, resource)
    true
  end
end
