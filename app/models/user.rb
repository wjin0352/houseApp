class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # In has_many association name of other model is plurialized
  has_many :thermometers, dependent: :destroy
  has_many :readings


end
