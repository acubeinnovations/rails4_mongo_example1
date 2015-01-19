class Product
  include Mongoid::Document
	include Mongoid::Timestamps
	include Mongoid::Versioning

  field :name
  field :description
	field :_id, type: String, default: ->{ name } #  `key :name`  use @  < v3	

	validates_presence_of :name

end
