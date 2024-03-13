class Country < ApplicationRecord
  has_many :recipes

  def country_flag(country)
    country_hash = {  france: "fi-fr",
                      italy: "fi-it" }

    return country_hash[country.to_sym]
  end
end
