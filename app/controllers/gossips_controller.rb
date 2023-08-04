class GossipsController < ApplicationController
	before_action :authenticate_user, except: [:index, :show]

  def index
		@gossips = Gossip.all
	end
	def show
		@gossip = Gossip.find(params[:id])
    @comment = Comment.new
	end
	
	def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: current_user)
    if @gossip.save # essaie de sauvegarder en base @gossip

    flash[:notice] = "Parfait, enregistrement effectué"
    redirect_to gossips_path# si ça marche, il redirige vers la page d'index du site
    else
    flash.now[:alert] = error_string(@gossip)
    render :new# sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    post_params = params.require(:gossip).permit(:title, :content)
    if  @gossip.user == current_user && @gossip.update(post_params)
      flash[:notice] = "Parfait, modification effectuée"
      redirect_to gossip_path(@gossip.id)# si ça marche
    else
      flash.now[:alert] = if (error_string(@gossip).empty?) then "impossible de mettre à jour" else error_string(@gossip) end
      render :edit# sinon, si ça ne marche pas
    end
  end
	
  def destroy
    @gossip = Gossip.find(params[:id])
    if @gossip.destroy
      flash[:notice] = "Suppression effectuée"
      redirect_to root_path
    else
      flash.now[:alert] = error_string(@gossip)
      render :show# sinon, si ça ne marche pas
    end
  end

private

def authenticate_user
  unless current_user
    flash[:alert] = "Enregistre toi ou connecte toi avant tout"
    redirect_to new_session_path
  end
end

end
