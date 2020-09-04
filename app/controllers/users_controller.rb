class UsersController < ApplicationController

    get '/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        erb :'users/show'
      end
    
    
      get '/signup' do
        if !logged_in
          erb :'/users/signup'
        else 
          redirect '/bills'
        end
      end
    
    
      post '/signup' do
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
    
           redirect '/signup'
        else
           @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
           @user.save
           session[:user_id] = @user.id
        
           redirect '/users/show'
         end
      end
    
    
    
      get '/login' do 
        if !logged_in
          erb :"users/login"
        else
            @user = User.new(:username => params[:username], :password => params[:password])
            @user.save
            session[:user_id] = @user.id
          redirect '/bills/bills'
        end
      end
    
    
    
    
      post '/login' do
        @user = User.find_by(:username => params[:username])
    
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect '/bills/bills'
        else
          redirect  '/signup'
        end
      end
    
    
      get '/logout' do
        if logged_in
          session.destroy
          redirect '/login'
        else
          redirect '/users/show'
        end
      end
    
    
    end
    