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

=end

require "nokogiri"
require "open-uri"


#1) 2) 3) 4)
def
  pages = Nokogiri::HTML(URL.open("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
end

=begin
On récupère les prénoms et noms et on les formate pour qu'ils sortent de la bonne manière.
a = [
  { 
    "first_name" => "Jean",
    "last_name" => "Durant",
    "email" => "jean.durant@assemblée.fr"
  },
  { 
    "first_name" => "Martin",
    "last_name" => "Dupont",
    "email" => "martin.dupont@assemblée.fr"
  },
=end
def get_deputy_email(name)
    deputy_href = (town_href = name["href"])
    deputy_url = "https://www2.assemblee-nationale.fr/deputes/liste/alphabetique#{depute_href}"
    deputy_email = deputy_url.css('.deputes-liste-attributs > dd:nth-child(8) > ul:nth-child(1) > li:nth-child(2) > a:nth-child(1)').text
  end
  


def get_deputy_complete_name(pages)
  array_first_name=
  array_last_name=
end

def get_deputy_email(pages)

end



#5)

