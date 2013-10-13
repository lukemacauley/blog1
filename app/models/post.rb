class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :slug, uniqueness: true
	validates :user_id, presence: true
	
	acts_as_url :title, url_attribute: :slug

	default_scope -> { order('created_at DESC') }

	belongs_to :user

	def to_param
		slug
	end
end