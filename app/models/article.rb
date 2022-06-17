class Article < ApplicationRecord
    belongs_to :user # here singular because an article can belongs to only one user
    has_many :article_categories
    has_many :categories, through: :article_categories
    validates :title,presence: true,length:{minimum:3,maximum:15}
    validates :description,presence:true,length:{minimum:9,maximum:300}
end