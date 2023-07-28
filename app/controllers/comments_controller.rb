class CommentsController < ApplicationController
  before_action :set_comment, only: %i[  show edit update destroy ]
  before_action :set_publication
  # GET /comments or /comments.json
  def index
    @publication = Publication.find(params[:publication_id])
    @comments = @publication.comments
    
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    @comment = @publication.comments.build
  end

    
  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @publication = Publication.find(params[:publication_id])
    @comment = @publication.comments.build(comment_params)

    if current_user
      @comment.user_id = current_user.id
    else
      # Si el usuario no está logueado, establece user_id = 2 (usuario anónimo)
      @comment.user_id = 2
    end

    puts "Comment User ID: #{@comment.user_id}"
  
    if @comment.save
      redirect_to @publication, notice: 'Comentario creado exitosamente.'
    else
      render :new
    end
  end
  

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private


    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:texto, :fecha_publicacion, :user_id, :publication_id)
    end

    def set_publication
      @publication = Publication.find(params[:publication_id])
    end
end
