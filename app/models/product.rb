class Product
  include Mongoid::Document
	include Mongoid::Paperclip
	include Mongoid::Timestamps
	include Mongoid::Versioning


  field :name
  field :description
	field :_id, type: String, default: ->{ name.to_s.parameterize } #  `key :name`  use @  < v3	

	
  has_mongoid_attached_file :photo, :keep_old_files => true , :preserve_files =>true, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :url => "/system/attachments/:id/:style/:basename.:extension",  
                    :path => ":rails_root/public/system/attachments/:id/:style/:basename.:extension",  
                    :keep_old_files => :version_condition_met?    


   
	validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]



	validates_presence_of :name

 

end
