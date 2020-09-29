class Bill < ActiveRecord::Base
    belongs_to :user

    # validates :amount, format: { with: /[0-9]/, message: "please use 0 - 9 for the amount" }
    

    # @amount = params[:amount]
    #     if @amount ~= [0-9]
    
end

