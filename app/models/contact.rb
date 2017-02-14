class Contact < ActiveRecord::Base
  validates :user_id, :email, presence: true
  validates :email, uniqueness: {:scope => :user_id}

  belongs_to :owner,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :user_id

  has_many :shares,
    class_name: 'ContactShare',
    primary_key: :id,
    foreign_key: :contact_id

  has_many :shared_users,
    through: :shares,
    source: :user
end
