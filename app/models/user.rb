class User < ActiveRecord::Base
    has_many :bills
    has_secure_password

    def slug
        username.downcase.gsub(" ","-")
      end
    
      def self.find_by_slug(slug)
        User.all.find{|user| user.slug == slug}
      end

      # validates :username, format: { without: /[0-9]/, message: "does not allow numbers" }
      # validates :email, uniqueness: true
     
end