class User < ApplicationRecord
    validates_presence_of :name, :message => '^Please set name for user'
    validates_inclusion_of :name, :in => %w( m f )
    validates :name, presence: true,
                     length: { minimum: 1}
    validates :email, presence: true,
                      length: { minimum: 1}
end
