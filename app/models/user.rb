class User < ActiveRecord::Base
  # In has_many association name of other model is plurialized
  has_many :thermometers, dependent: :destroy


end