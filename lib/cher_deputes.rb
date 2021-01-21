=begin
Décomposons le programme en 2 sous-problèmes simples:

Tu dois être capable d'obtenir un e-mail de mairie à partir de la page de cette dernière (pas en partant du listing complet des mairies). Fais d'abord une méthode get_townhall_email(townhall_url) qui récupère l’e-mail d'une mairie à partir de l'URL de mairies, par exemple celle de Avernes.
Une fois que tu sais le faire pour une mairie, tu vas vouloir industrialiser et répéter ça sur tout 
l'annuaire du Val d'Oise. La prochaine étape est de coder une méthode get_townhall_urls qui récupère les URLs de chaque ville du Val d'Oise.
=end

# require "open-uri"
# require "nokogiri"
# PAGE URL = "https://www.annuaire-des-mairies.com/val-d-oise.html"

# def get_townhall_url
# doc = Nokogiri::HTML(URI.open(PAGE URL))
# townhall_url_xml = doc.xpath('insérer le bon chemin')
# townhall_url=Array.new
# townhall_url_xml.each do |link|
# townhall_url << "https://www.annuaire-des-mairies.com/val-d-oise.html"
# end

# return townhall_url
# end

# def get_townhall_email(townhall_url)
#     townhall_url.each do |city_url|
#     doc = Nokogiri::HTML(URI.open(city_url))
#     townhall_email_xml=doc.xpath('insérer le bon chemin')
#     puts townhall_email_xml.text
#     end
# end

# def perform
#     townhall_url = get_townhall_url
#     get_townhall_email(townhall_url)
# end

# perform


require "open-uri"
require "nokogiri"
PAGE_URL = "https://www.annuaire-des-mairies.com/val-d-oise.html"

def get_townhall_url
doc = Nokogiri::HTML(URI.open(PAGE_URL))
raw = doc.xpath('//*[@id="voyance-par-telephone"]/table/tbody/tr[2]/td/table/tbody/tr')
townhall_url=Array.new
puts raw
raw.each do |link|
    puts raw.xpath('/td/p/a')
# townhall_url << "https://www.annuaire-des-mairies.com/val-d-oise.html"
end
end
get_townhall_url