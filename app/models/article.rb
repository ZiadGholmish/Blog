class Article < ActiveRecord::Base

  has_many :article_categories
  has_many :categories, through: :article_categories
  belongs_to :user

  validates_presence_of :title, :desc

end
