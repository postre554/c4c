class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :publication

  enum reaction_type: {
    no_me_gusta: 0,
    me_gusta: 1
  }

  validate :user_reaction_limit, on: :create


  
end
