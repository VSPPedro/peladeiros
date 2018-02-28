# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Inserindo os administradores do sistema'
admin_array = [
    ['João Victor', 'joao@admin.com'],
    ['Nicolas Rodrigues', 'nicolas@admin.com'],
    ['Pedro Paiva', 'pedro@admin.com'],
    ['Rui Braz', 'rui@admin.com']
]

campus_array = [
    'Areia',
    'Cabedelo',
    'Cabedelo Centro',
    'Cajazeiras',
    'Campina Grande',
    'Catolé do Rocha',
    'Esperança',
    'Guarabira',
    'Itabaiana',
    'Itaporanga',
    'João Pessoa',
    'Mangabeira',
    'Monteiro',
    'Patos',
    'Pedras de Fogo',
    'Picuí',
    'Princesa Isabel',
    'Santa Luzia',
    'Santa Rita',
    'Soledade',
    'Souza'
]

admin_array.each do |nome, email| 
    User.create!(email: email, name: nome, admin: true, approved: true, password: '123123', password_confirmation: '123123')
end

puts 'Inserindo usuários aprovados por administradores'
54.times do
    User.create!(email: Faker::Internet.email, name: Faker::Name.name, approved: true, password: '123123', password_confirmation: '123123', campus: campus_array.sample)
end

puts 'Inserindo usuários não aprovados por administradores'
9.times do
    User.create!(email: Faker::Internet.email, name: Faker::Name.name, password: '123123', password_confirmation: '123123')
end
