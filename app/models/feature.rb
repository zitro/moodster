class Feature < ApplicationRecord
  belongs_to :user

  def gender
  	 eval(self[:hashreturn]).first[:faceAttributes][:gender]
  end

  def age
		 eval(self[:hashreturn]).first[:faceAttributes][:age]
  end

  def emotions
		 eval(self[:hashreturn]).first[:faceAttributes][:emotion].map {|k, v| @k = "#{k}: #{(v*100).to_s[0..5].to_f}%"}.join("','")
  end

	def makeup
		 eval(self[:hashreturn]).first[:faceAttributes][:makeup]
	end

	def glasses
		 eval(self[:hashreturn]).first[:faceAttributes][:glasses]
	end

	def facialHair
		 eval(self[:hashreturn]).first[:faceAttributes][:facialHair]
	end

	def accessories
		 eval(self[:hashreturn]).first[:faceAttributes][:accessories]
	end
end
