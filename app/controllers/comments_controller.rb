class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@article = Article.find(params[:article_id]);
		@comment = @article.comments.create(params[:comment].permit(:body));
		@comment.user_id = current_user.id if current_user;
		respond_to do |format|
			if @comment.save
				format.html {
					redirect_to @article,
					notice: "Comment successfully posted."
				}
				format.json {
					render :show,
					status: :created,
					location: @article
				}
			else
				format.html {
					render :new,
					status: :unprocessable_entity
				}
				format.json{
					render json: @comment.errors,
					status: :unprocessable_entity
				}
			end
		end
	end

	def update
		@article = Article.find(params[:article_id]);
		@comment = @article.comments.find(params[:id]);
		respond_to do |format|
			if @comment.update(params[:comment].permit(:body))
				format.html { redirect_to @article, notice: "Comment was successfully updated." }
				format.json { render :show, status: :ok, location: @article }
			else
				format.html { render :edit, status: :unprocessable_entity }
				format.json { render json: @comment.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
		@article = Article.find(params[:article_id]);
		@comment = @article.comments.find(params[:id]);
	end
	
	def destroy
		@article = Article.find(params[:article_id]);
		@comment = @article.comments.find(params[:id]);
		@comment.destroy
		respond_to do |format|
			format.html { redirect_to @article, notice: "Comment was successfully destroyed." }
			format.json { head :no_content }
		end
	end
end