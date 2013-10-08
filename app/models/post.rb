class Post < ActiveRecord::Base
	validates :content, presence: true
#	validates :slug, presence: true, uniqueness: true
#	acts_as_url :title, url_attribute: :slug

#	def to_param
#		slug
#	end
end
