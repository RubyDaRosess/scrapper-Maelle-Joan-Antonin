require 'rubygems'
require 'nokogiri'
require 'httparty'
require 'open-uri'

def crypto_scrap
    url = "https://coinmarketcap.com/all/views/all/"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(open(unparsed_page))
    raws = parsed_page.css('/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr')

    raws.each do
        
    end

end
crypto_scrap