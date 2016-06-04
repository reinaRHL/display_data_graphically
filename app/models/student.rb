class Student < ActiveRecord::Base
    validates :name, :weight, :height, :color, :gpa, :email, presence: true 
    validates_numericality_of :height, :weight, :gpa

                    
end
