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

admin_array.each do |nome, email| 
    User.create!(email: email, name: nome, admin: true, approved: true, password: '123123', password_confirmation: '123123')
end