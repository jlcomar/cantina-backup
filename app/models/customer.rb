class Customer < ApplicationRecord
    has_many :sales

    include Activatable
    
    validates :name, presence: true
    validates :matriculation, presence: true

    # def recent_sales
    #     self.sales.where("created_at >= ?", 1.week.ago)
    # end
end
