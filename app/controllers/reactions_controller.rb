class ReactionsController < ApplicationController
    
    def create
      @publication = Publication.find(params[:publication_id])
      reaction_type = params[:reaction_type].to_sym
      @reaction = Reaction.new(publication: @publication, reaction_type: reaction_type)
  
      if user_signed_in?
        @reaction.user = current_user
      else
        @reaction.user_id = nil
      end
  
      if @reaction.save
        redirect_to @publication, notice: 'La reacción se agregó correctamente.'
      else
        redirect_to @publication, alert: 'No se pudo agregar la reacción.'
      end
    end
  end
  