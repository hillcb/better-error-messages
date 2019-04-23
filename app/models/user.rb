class User < ApplicationRecord
    validates_inclusion_of :name, :in => %w( m f )
    validates_exclusion_of :name, :in => %w( admin administrator )
    validates_confirmation_of :email
    validates :name, presence: true,
                     length: { minimum: 1}
    validates :email, presence: true,
                      length: { minimum: 1}
                      
end
