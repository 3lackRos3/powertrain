class Engine < ActiveRecord::Base
	has_many :applications
	belongs_to :run
end
