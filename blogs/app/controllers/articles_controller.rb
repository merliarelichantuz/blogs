class ArticlesController < ApplicationController
	def new
		@article = Article.new
		@article.title="Demo"
	end
	def create
	@article = Article.create(title:params[:article][:title])
	render json: @article 
	end	


def index
  @articles = Article.all
end

def show
  @article = Article.find(params[:id])
end

def edit
  @article = Article.find(params[:id])
end
#metodo para editar
def edit
	@article =Article.find(params[:id])
	if @article.update_attributes(params[:article])
	redirect_to :action => :show, :id => @article.id 
   else
	 render  'edit'
    end
end     
def update
  @article = Article.find(params[:id])
  @article.update(
      title: params[:article][:title],
      status: params[:article][:status]
  )
  redirect_to root_path
end

def destroy
  @article = Article.find(params[:id])
  @article.destroy
  redirect_to root_path
end
end
