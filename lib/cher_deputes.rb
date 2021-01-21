=begin
2.4. Cher député
Maintenant, fini de se faire mâcher le travail par tes gentils formateurs de THP. 
Tu dois récupérer la liste complète des députés de France ainsi que leurs adresses e-mail. 
Cherche par toi-même le site le plus aisé à scrapper et stocke les informations 
extraites dans une array de hashs selon ce format (un peu différent des exercices précédents - voir plus bas le formatage)

Pour les tests, nous t'invitons à te poser et t'inspirer des tests précédents. Deux tests suffiront.

méthode = 1) on récupère les prénoms 
          2) on récupère les noms
          3) on récupère les emails
          4) on formate le tout
          5) les array et hashs
          6) méthode du groupe de David = faire une boucle pour formater et "cleaner certains trucs" mais je pense qu'on
          peut trouver plus simple

1) et 2) https://www2.assemblee-nationale.fr/deputes/liste/alphabetique
        http://www2.assemblee-nationale.fr/deputes/liste/tableau

=end

require "nokogiri"
require "open-uri"

def get_deputy_email(page) # Prend les emails des députés / "page" = paramètre
  deputy_href = page.css('td[1]/a/@href').text # Prend tous les href des différentes pages des députés et formatage .text  https://stackoverflow.com/questions/2505104/html-to-plain-text-with-ruby
  deputy_url = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr#{deputy_href}")) # fabrique mes url pour scrapper mes données
  deputy_email = deputy_url.css('.deputes-liste-attributs > dd:nth-child(8) > ul:nth-child(1) > li:nth-child(2) > a:nth-child(1)').text 
  # crée une variable avec le chemin pour scrapper les emails et formatage .text 
end
  
def get_deputy_first_name(first_name) # méthode pour stocker les prénoms des députés
  first_name = first_name.css('td[1]/a').text.delete_prefix('Mme ').delete_prefix('M. ').split.first  
  # Ici on utilise delete_prefix pour enlever "M." et "Mme", .split.first pour découper la string par mots pour la stocker dans un array, 
  # peut aussi s'utiliser avec split(//) pour découper par lettres, "first" prend la première valeur de l'array
end

def get_deputy_last_name(last_name) # méthode pour stocker les noms des députés
  last_name = last_name.css('td[1]/a').text.delete_prefix('Mme ').delete_prefix('M. ').split.last 
  # Comme ci-dessus sauf que "last" prend la dernière valeur de l'array
end

def puts_deputy_on_array # méthode pour mettre les données sur les députés dans des hash puis dans un tableau
  page = Nokogiri::HTML(URI.open('http://www2.assemblee-nationale.fr/deputes/liste/tableau'))
  tab = page.css('//table/tbody/tr') # tab = site.css nokogiri pour scrapper le code html où sont stockées les données du tableau
  deputy_hash = tab.map {|x| {'first_name' => get_deputy_first_name(x), 'last_name' => get_deputy_last_name(x), 'email' => get_deputy_email(x) } }
  # Prend les données du tableau, utilise ".map" pour créer un array avec ces données
end

#juste un puts
puts puts_deputy_on_array