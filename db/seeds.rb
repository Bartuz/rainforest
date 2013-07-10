# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
User.delete_all
Review.delete_all
Product.create(name: "Szafa grajaca", description: "Stoi gra spiewa i tanczy", picture:"http://www.rajskidomek.com.pl/pliki/produkty/d_265_Posciel_ekskluzywna_satynowa_ornamentowa_200x200_cm_1.jpg", price: 99.99)
Product.create(name: "Majtki skorzane prane", description: "Sa fajne i tanczy", picture:"http://image.ceneo.pl/data/products/20778993/i-frankhauer-materac-piankowy-memory-z-lateksem-persefona-200x200.jpg", price: 99.99)
Product.create(name: "Broda biala",description: "Nic fajnego ale ladnie wyglada",price: 1.42, picture: "http://abcprezentacji.pl/pic/Ekran-recznie-rozwijany-na-trojnogu-AVtek-200x200-cm-_bp1788.jpg")
User.create(email: "admin", password: "admin", password_confirmation: "admin")
User.create(email: "admin", password: "user", password_confirmation: "user")
Product.find(1).reviews.build(user_id: 1,comment: "zajebista sprawa").save
Product.find(1).reviews.build(user_id: 2,comment: "Supraaaa!").save
Product.find(3).reviews.build(user_id: 2,comment: "GOWNO! Nie kupowac....").save