class ArticlesController < ApplicationController
    #guardar lo de new en lo otro
   #before_action :find_article, only: [:show,:edit,:destroy,:update]
    before_action :find_article, except: [:new, :create,:index,:from_author]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
   #o only 
def index
    @articles = Article.all
end

   def show
    #mostrar la base de datos 
    #rails console
    #se guarda en una variable que pueda utilizar en una vista
    end
def edit 
    puts "\n\n\n #{@article.persisted?} \n\n\n"
    #enviar
    @categories = Category.all
end

def from_author
    @user= User.find(params[:user_id])
    #from_user : para encontrar un usuario 
#se le pone user_id por el routes
end

def update
    @article.update(article_parants)
    @article.save_categories

     redirect_to @article
end

#mostrar un formulario
def new
    @article = Article.new
    @categories= Category.all

end
def create
    @article = current_user.articles.create(article_parants)
#crea un article para el user
@article.save_categories
redirect_to @article
end
#guarda lo que esta en el new
def destroy
     @article.destroy
     redirect_to root_path
end

def article_parants
    params.require(:article).permit(:title,:content,category_elements:[] )
    #que tenga un parametro article
end

def find_article
    @article= Article.find(params[:id])

    puts "depolever"
end
end

