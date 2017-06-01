class HomeController < ApplicationController
  
  before_action :login_check
  
  
  def index
    @hello = Post.all
  end
  
   def add 
    a = Post.new 
    a.article = params[:article]
    a.save
    redirect_to "/home/index"      
   end 
  
  def delete 
     
    deleting_post = Post.find(params[:ls])
    deleting_post.delete
    redirect_to '/home/index'
     
  end 
  
  
  def update 
    
    @post = Post.find(params[:ll])
    
  end 
   
   
  def modify 
    
    modifying_post = Post.find(params[:kk])
    modifying_post.feeling = params[:felt]
    modifying_post.save 
    redirect_to '/home/index'
    
  end 
  
  
  def like 
    
    l =Like.new 
    #아래있는건 거의 user_id라고보면됨 
    l.user = current_user 
    l.post_id = params[:post_id]
    l.save
    redirect_to '/home/index'
    
  end 
  
  def unlike
    
    l = Like.where(:post_id => params[:post_id]).where(:user => current_user).take 
    l.delete
    redirect_to '/home/index'
    
  end 
  
  
  
  
  
end
