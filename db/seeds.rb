# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ngo_names = ['CEMA Chile', 'Fundación Chol-Chol', 'Consejo de Defensa del Niño', 'Corporación para la Nutrición Infantil', 'Cruz Roja Chilena', 'Desafío Levantemos Chile', 'Educación 2020', 'Enseña Chile', 'Fundación Futuro', 'Fundación Iguales', 'Fundación para la Superación de la Pobreza', 'Neutralidad Si', 'ONG Derechos Digitales', 'Servicio País', 'Wikipedia:Wikimedia Chile', 'Worldwide Project']

ngos = ngo_names.map do |name|
  email = Faker::Internet.email(name)
  url = email.gsub(/.+@/, 'www.')
  Ngo.create!(
    name: name,
    description: Faker::Lorem.paragraph(2),
    email: email,
    webpage: url,
    logo: 'placeholder.gif'
  )
end

ngos.each do |ngo|
  10.times do
    ngo.initiatives << Initiative.new(
      title: Faker::Lorem.words(3).map(&:capitalize).join(' '),
      description: Faker::Lorem.paragraphs(3).join("\n"),
      active: true,
      hashtag: Faker::Lorem.words(1)[0]
    )
  end
end
