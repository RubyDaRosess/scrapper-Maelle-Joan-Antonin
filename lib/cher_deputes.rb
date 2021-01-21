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

def get_deputy_email(page)
  deputy_href = page.css('td[1]/a/@href').text
  deputy_url = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr#{deputy_href}"))
  deputy_email = deputy_url.css('.deputes-liste-attributs > dd:nth-child(8) > ul:nth-child(1) > li:nth-child(2) > a:nth-child(1)').text
end
  
def get_deputy_first_name(first_name)
  first_name = first_name.css('td[1]/a').text.delete_prefix('Mme ').delete_prefix('M, ').split.first
end

def get_deputy_last_name(last_name)
  last_name = last_name.css('td[1]/a').text.delete_prefix('Mme ').delete_prefix('M, ').split.last
end

def puts_deputy_on_array
  page = Nokogiri::HTML(URI.open('http://www2.assemblee-nationale.fr/deputes/liste/tableau'))
  tab = page.css('//table/tbody/tr')
  deputy_hash = tab.map {|x| {'first_name' => get_deputy_first_name(x), 'last_name' => get_deputy_last_name(x), 'email' => get_deputy_email(x) } }
end

begin
    pp puts_deputy_on_array
  rescue StandardError => e
    puts 'You messed up in debuty'
  end
  begin
    pp puts_deputy_on_array
  rescue StandardError => e
    puts e.message
  else
    puts 'Well Done!'
  end