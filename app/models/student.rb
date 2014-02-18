class Student < ActiveRecord::Base


    validates :no, :presence => true, :uniqueness => {:case_sensitive => false}
    validates :password, :confirmation => true


    def self.authenticate no, password
        student = find_by_no no
        if student && student.pid == password
            student
        else
            false
        end
    end

    # 如果需要編碼，詳細請見 
    # http://webdevrefinery.com/forums/topic/9724-ruby-on-rails-user-authentication/
    
    def encrypt_password
        if password.present?
            self.salt = BCrypt::Engine.generate_salt
            self.password = BCrypt::Engine.hash_secret password, salt
        end
    end

end

