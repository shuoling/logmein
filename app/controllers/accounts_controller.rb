class AccountsController < ApplicationController
	
	def show
		@account = Account.find(params[:id])
		@account_list = Account.paginate :page => params[:page], :order => 'id DESC'
		@consultant_list = Consultant.find(:all,:order=>'name')
	end	
	
	def index
          unless params[:consultant].blank?
                session[:current_user] = params[:consultant]
          end
        @account_list = Account.paginate :page => params[:page], :order => 'id DESC'
        @consultant_list = Consultant.find(:all)


        @can_use_direct = session[:current_user].nil? ? false : !Consultant.find(:first,:conditions=>["name = ?",session[:current_user]]).nil?

        # If the current_user in the session is blank then don't show the direct link
            if session[:current_user].nil?
              @can_use_direct = false
            else
              # If find a consultant by the name of session then set can)use_direct=true
              @can_use_direct = !Consultant.find_by_name(session[:current_user]).blank?
            end
        end

	def new
		@account = Account.new
	end
	
	def create
		@account = Account.new(params[:account])
	end
	
	def update
		@account = Account.find(params[:id])
	end
	
	def destroy
		@account = Account.find(params[:id])
		account.destroy
	end
	
	def assign_consultant
             	@account = Account.find(params[:id])
		@account_list = Account.paginate :page => params[:page], :order => 'id DESC'
		@consultant_list = Consultant.find(:all)
                  if @consultant = Consultant.find_by_id(params[:account][:consultant_id])
			if @account.add_consultant(@consultant)
				redirect_to "https://secure.logmeinrescue.com/HelpDesk/Login.aspx?Email=#{@account.name}&Password=#{@account.password}"
                                return false
			end
                    end
         end

        def pick_consultant
          @account = Account.find(params[:id])

        if  @consultant = Consultant.find(:first, :conditions=>["name = ?", session[:current_user]])
          if @account.add_consultant(@consultant)
                    redirect_to "https://secure.logmeinrescue.com/HelpDesk/Login.aspx?Email=#{@account.name}&Password=#{@account.password}"
                    return false
          else
              redirect_to :action => :index
              flash[:notice] = "The account is using by #{@consultant.name}"
              return false
          end
        else
          redirect_to :action => :index
          flash[:notice] = "Can't find the consultant #{session[:current]}"
         end
        end


	def clear_accounts
		unless params[:account_list]
			flash[:notice] = "No Accounts selected"
			@account_list = Account.paginate :page => params[:page], :order => 'id DESC'
			@consultant_list = Consultant.find(:all)
			render :action => :index
		else
			if @accounts = Account.find(params[:account_list])
				@accounts.each do |acc|
					acc.remove_consultant
                                end
                        end	
		
			redirect_to :action=> :index
		end

	end

        def clear_session
          session[:current_user] = nil
          redirect_to :action=>:index
        end

end
