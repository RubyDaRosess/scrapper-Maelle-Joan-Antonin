=begin
Décomposons le programme en 2 sous-problèmes simples:

Tu dois être capable d'obtenir un e-mail de mairie à partir de la page de cette dernière (pas en partant du listing complet des mairies). Fais d'abord une méthode get_townhall_email(townhall_url) qui récupère l’e-mail d'une mairie à partir de l'URL de mairies, par exemple celle de Avernes.
Une fois que tu sais le faire pour une mairie, tu vas vouloir industrialiser et répéter ça sur tout 
l'annuaire du Val d'Oise. La prochaine étape est de coder une méthode get_townhall_urls qui récupère les URLs de chaque ville du Val d'Oise.
=end

require "nokogiri"
require "open-uri"

def get_townhall_urls_and_emails(name)
  town_href = name["href"].delete_prefix "."
  # prends le href des liens de toutes les villes, enlève le prefix " . " pour faire fonctionner comme y faut l'url
  town_url = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com#{town_href}"))
  # ouvre les url des villes grace au href
  emails = town_url.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
  # va chercher les emails des villes sur les differentes pages
end

def emails_hashing
  site = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
  tables = site.css('[@class="lientxt"]')
  tables.map { |name| { name.text => get_townhall_urls_and_emails(name) } }
end

puts emails_hashing
puts "Il y a #{emails_hashing.length} emails"
