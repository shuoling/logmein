class AdminaccsController < ApplicationController
	def index
		@account = Account.new
                @acc_list = Account.paginate :page => params[:page], :order => 'id DESC'
	end
	
	def show
		@acc_list = Account.paginate :page => params[:page], :order => 'id DESC'
		@account = Account.find(params[:id])
	end
	
	def edit
                @acc_list = Account.paginate :page => params[:page], :order => 'id DESC'
		@account = Account.find(params[:id])
	end
	
	def update
                @acc_list = Account.paginate :page => params[:page], :order => 'id DESC'
		@account = Account.find(params[:id])
			if @account.update_attributes(params[:account])
				flash[:notice] = 'Account was successfully updated.'
				redirect_to adminaccs_path
			else
                          render :action => :edit
                        end
        end
	
	def destroy
		@account = Account.find(params[:id])
		@account.destroy
		redirect_to :action=> :index
	end
	
	def new
	        @account= Account.new	
	end
	 
	 def create
		@account= Account.new(params[:account])
                @acc_list = Account.paginate :page => params[:page], :order => 'id DESC'
		
		if @account.save
			flash[:notice] = "Account #{@account.name} created"
			@acc_list = Account.paginate :page => params[:page], :order => 'id DESC'
			render :action => :index
		else
			render :action => :index
		end
			
	end
end
