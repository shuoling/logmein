class ConsultantsController < ApplicationController
  def index
        @consultant_list = Consultant.find(:all)
  end

  def change_user
        consultant = Consultant.find_by_id(params[:consultant][:consultant_id])
        session[:current_user] = consultant.name unless consultant.blank?
        redirect_to accounts_path
   end
end
