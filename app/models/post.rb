class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :slug, uniqueness: true
	acts_as_url :title, url_attribute: :slug

	def to_param
		slug
	end
end