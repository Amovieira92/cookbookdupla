class Recipe < ApplicationRecord
  belongs_to :recipe_type
  validates :title, :difficulty, :cuisine, :cook_time, :ingredients, :cook_method, presence: true

  def cook_time_min
    "#{cook_time} minutos"
  end  

end
