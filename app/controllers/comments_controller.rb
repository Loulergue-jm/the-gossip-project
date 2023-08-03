class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = Comment.new(content: params[:comment][:content], user_id: current_user.id, gossip_id: params[:comment][:gossip_id])
    if @comment.save # essaie de sauvegarder en base @gossip
      flash[:notice] = "Parfait, commentaire enregistré"
    else
      flash[:alert] = "Désolé, erreur rencontrée"
    end
  redirect_to gossip_path(params[:comment][:gossip_id])
  end 
end
