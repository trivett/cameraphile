# require 'amazon/ecs'

class Camera < ActiveRecord::Base
  has_and_belongs_to_many :wishlists
  has_many :photos

  validates_uniqueness_of :name



  def get_price
    term = self.name.to_s
    puts term
    begin
    amazon_price = Amazon::Ecs.item_search(term, {:search_index => "Photo", :response_group => "Offers"}).first_item.get_element("Price/FormattedPrice").get_unescaped

    if amazon_price
      puts amazon_price
      self.update(price: amazon_price)
    end

    rescue
      puts "error"
      self.price = "Unknown"

    else
      puts amazon_price || "Unknown"
      self.update(price: amazon_price) || self.update(price:"Unknown")
    end
    self.save
  end


  def get_asin
    term = self.name.to_s
    puts term
    begin
      res = Amazon::Ecs.item_search(term, {:search_index => "Photo"})
      response = res.first_item.get_element("ASIN").get_unescaped
      if response
        self.update(asin: response)
      end
    rescue
      puts "error"
      self.price = "Unknown"
    else
      self.update(asin: response) || self.update(asin: "Unknown")
    end
    self.save
  end

end
