class HistoriesController < ApplicationController
	def index
		@history = History.new
                @histories = History.paginate :page => params[:page], :order => 'start_time DESC'
        end
	
        def remove_all
		History.destroy_all
                redirect_to :action=> :index
	end
	
end
