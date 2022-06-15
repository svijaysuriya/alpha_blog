class Article < ApplicationRecord
    validates :title,presence: true,length:{minimum:3,maximum:15}
    validates :description,presence:true,length:{minimum:9,maximum:300}
end