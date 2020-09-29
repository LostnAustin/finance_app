class BillsController < ApplicationController

    get '/bills' do
        if logged_in   
          @bills = Bill.all
          erb :'/bills/bills'
        else
          redirect '/login'
        end
      end
    
    
      get '/bills/new' do
        if logged_in
          erb :'bills/new'
        else 
          redirect '/login'
        end
      end
    
      post '/bills' do
        if logged_in
          if params[:amount] == "" || params[:description] == ""
            redirect '/bills/new'
          else
            @bill = current_user.bills.build(description: params[:description], amount: params[:amount])
            if @bill.save
              redirect "/bills/#{@bill.id}"
            else
              redirect '/bills/new'
            end
          end
        else
          redirect '/login'
        end
      end
    
      get '/bills/:id' do
        if logged_in
          @bill = Bill.find_by_id(params[:id])
        
          erb :"/bills/bills"
        else
          redirect '/login'
        end
      end
    
      
      get '/bills/:id/edit' do
        if logged_in
          @bill = Bill.find_by_id(params[:id])
            if @bill && @bill.user == current_user
            erb :"/bills/edit"
            else
            redirect '/bills'
            end
          else
            redirect '/login'
          end
      end
    
    
      patch '/bills/:id' do
        if logged_in
          if params[:amount] == ""
            redirect  "/bills/#{params[:id]}/edit"
          else
            @bill = Bill.find_by_id(params[:id])
            if @bill && @bill.user == current_user
              if @bill.update(description: params[:description], amount: params[:amount])
                redirect  "/bills/#{@bill.id}"
              else
                redirect  "/bills/#{@bill.id}/edit"
              end
            else
              redirect '/bills'
            end
          end
        else
          redirect '/login'
        end
      end
    
      delete '/bills/:id/delete' do
        if logged_in
          @bill = Bill.find_by_id(params[:id])
          if @bill && @bill.user == current_user
            @bill.delete
          end
          redirect '/bills'
        else
          redirect '/login'
        end
      end
    
    
    
    
    
end