class Feature < ApplicationRecord
  belongs_to :user

  def gender
  	 eval(self[:hashreturn]).first[:faceAttributes][:gender]
  end

  def age
		 myage = eval(self[:hashreturn]).first[:faceAttributes][:age]
		 "#{myage} Years Old"
  end

  def emotions
		 eval(self[:hashreturn]).first[:faceAttributes][:emotion].map {|k, v| @k = "#{k.capitalize}: #{(v*100).to_s[0..5].to_f}% "}.join(" / ")
  end

	def makeup
		 eval(self[:hashreturn]).first[:faceAttributes][:makeup].map {|k, v| @k = "#{k.capitalize}: #{v} / "}.join
	end

	def glasses
		 eval(self[:hashreturn]).first[:faceAttributes][:glasses]
	end

	def facialHair
		 eval(self[:hashreturn]).first[:faceAttributes][:facialHair].map{|k,v| "#{k} : #{v} "}.join(" / ")
	end

	def accessories
		 @things = eval(self[:hashreturn]).first[:faceAttributes][:accessories].first
     if @things != nil
       @things.map{|k,v| "#{k.capitalize} : #{v} "}.join(" / ")
     else
       "No Accessories"
     end
	end
end
