require "nokogiri"
require "open-uri"

def crypto_scrap
  url = "https://coinmarketcap.com/all/views/all/"
  parsed_page = Nokogiri::HTML(URI.open(url))
  crypto_arr = Array.new
  raws = parsed_page.xpath("/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr")
    # Si vous pouvez, Prendez le chemin vers le tableau sur le site https://coinmarketcap.com/all/views/all/
  
    raws.each do |raw|
    # Pour chaque colonne, créé le hash avec deux clés, une pour le nom, l'autre pour la valeur
    
    crypto_hash = {
      title: raw.xpath("td[2]/div/a").text,
      value: raw.xpath("td[5]/div/a").text,
    }
    
    crypto_arr << crypto_hash
    # Prend chaque hash et le met dans le array
  end

  puts crypto_arr

end

crypto_scrap