class Country < ApplicationRecord
  has_many :recipes

  def flag
    country_hash = {  france: "fi-fr",
                      italy: "fi-it"
                       }

    return country_hash[name.to_sym]
  end
end
