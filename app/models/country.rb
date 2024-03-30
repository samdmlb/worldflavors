class Country < ApplicationRecord
  has_many :recipes

  def flag
    country_hash = {  france: "fi-fr",
                      italy: "fi-it",
                      belgium: "fi-be",
                      germany: "fi-de",
                      greece: "fi-gr",
                      ireland: "fi-ie",
                      portugal: "fi-pt",
                      spain: "fi-es",
                      england: "fi-gb-eng",
                      switzerland: "fi-ch",
                      poland: "fi-pl",
                      norway: "fi-no",
                      sweden: "fi-se",
                      netherlands: "fi-nl",
                      denmark: "fi-dk",
                      iceland: "fi-is",
                      bulgaria: "fi-bg" }

    return country_hash[name.remove(" ").to_sym]
  end
end
