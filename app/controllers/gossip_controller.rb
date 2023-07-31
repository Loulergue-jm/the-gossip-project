class GossipController < ApplicationController
	def index
		@gossips = Gossip.all
	end
	def show_one
		@gossip = Gossip.find(params[:id])
	end
	def author_info
		@user = @gossip.user
	end
end
