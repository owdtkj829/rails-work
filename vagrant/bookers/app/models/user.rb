class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  validates :name,uniqueness: { case_sensitive: :false },
    		length: { minimum: 2, maximum: 20 }
  validates :introduction,length:{maximum:50}
  has_many :books, dependent: :destroy
  attachment :profile_image
end
