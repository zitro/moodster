class Feature < ApplicationRecord
  belongs_to :user

  def gender
  	 eval(self[:hashreturn]).first[:faceAttributes][:gender]
  end

  def age
		 eval(self[:hashreturn]).first[:faceAttributes][:age]

  end

  def emotions
		 eval(self[:hashreturn]).first[:faceAttributes][:emotion]
  end
end
