class Article < ApplicationRecord
    validates :title,presence: true
    validates :description,presence:true,length:{minimum:9,maximum:300}
end