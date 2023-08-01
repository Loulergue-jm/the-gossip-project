class GossipController < ApplicationController
	def index
		@gossips = Gossip.all
	end
	def show
		@gossip = Gossip.find(params[:id])
	end
	
end
