class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable and :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

end
