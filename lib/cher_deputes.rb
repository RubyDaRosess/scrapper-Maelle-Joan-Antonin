=begin
2.4. Cher député
Maintenant, fini de se faire mâcher le travail par tes gentils formateurs de THP. 
Tu dois récupérer la liste complète des députés de France ainsi que leurs adresses e-mail. 
Cherche par toi-même le site le plus aisé à scrapper et stocke les informations 
extraites dans une array de hashs selon ce format (un peu différent des exercices précédents) :

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
  etc
]
Pour les tests, nous t'invitons à te poser et t'inspirer des tests précédents. Deux tests suffiront.


doc = Nokogiri::HTML(URI.open(PAGE URL))
deputee_list_xml = doc.xpath('insérer le bon chemin')
deputee_list=Array.new
deputee_list_xml.each do |link|
deputee_list << "https://www.assemblee-nationale.fr/dyn/vos-deputes"
end

return deputee_list
end

def get_deputee_email(deputee_list)
    deputee_list.each do |deputee_email|
    doc = Nokogiri::HTML(URI.open('insérer le bon chemin'))
    deputee_email_xml=doc.xpath('insérer le bon chemin')
    puts deputee_email_xml.text
    end
end

def perform
    deputee_email = get_deputee_email_url
    get_deputee_email(deputee_list_url)
end

perform

=end

require "open-uri"
require "nokogiri"
@page = Nokogiri::HTML(URI.open("https://www.assemblee-nationale.fr/deputes/liste/alphabetique")) 

def get_deputy_name

    
    deputy_name = name['href'].delete_prefix
end

puts deputy_name

def get_deputy_url

end

puts deputy_url 

def get deputy_email
    deputy_email = deputy_email.xpath("insérez le bon chemin").text
end

