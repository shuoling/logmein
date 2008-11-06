class AdminconsController < ApplicationController
	def index
		@consultant = Consultant.new
                @con_list = Consultant.paginate :page => params[:page], :order => 'id DESC'
	end
	
	def new
	         @consultant = Consultant.new	
	end
	
	def show
		@con_list = Consultant.paginate :page => params[:page], :order => 'id DESC'
		@con = Consultant.find(params[:id])
	end
	
	def edit
		@consultant = Consultant.find(params[:id])
                @con_list = Consultant.paginate :page => params[:page], :order => 'id DESC'
	end
	
	def update
                @con_list = Consultant.paginate :page => params[:page], :order => 'id DESC'
		@consultant = Consultant.find(params[:id])
			if @consultant.update_attributes(params[:consultant])
				flash[:notice] = 'Consultant was successfully updated.'
				redirect_to admincons_path
			else
                             render :action => :index
                        end
        end

	
	def create
		@consultant = Consultant.new(params[:consultant])

		if @consultant.save
			flash[:notice] = "Consultant #{@consultant.name} created"
			@con_list = Consultant.paginate :page => params[:page], :order => 'id DESC'
			render :action => :index
		else
                        @con_list = Consultant.paginate :page => params[:page], :order => 'id DESC'
                        render :action => :index
		end
			
	end
		
	def delete_consultants
		unless params[:con_list]
			flash[:notice] = "No Accounts selected"
			@con_list = Consultant.paginate :page => params[:page], :order => 'id DESC'
			@consultant = Consultant.new
			render :action => :index
		else
			if @consultants = Consultant.find(params[:con_list])
				@consultants.each do |con|
					con.destroy
				end
			end	
		
			redirect_to :action=> :index
		end
	end

end
