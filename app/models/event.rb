class Event < ApplicationRecord
    belongs_to :owner, class_name: "User"
    has_many :tickets, dependent: :destroy
    
  def created_by?(user)
    return false unless user
    owner_id == user.id
  end
end