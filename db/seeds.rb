# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# LANGUAGES
    Language.create!(name: 'English')
    Language.create!(name: 'Français')
    Language.create!(name: 'Deutsche')
    Language.create!(name: 'العربية')

# ADMINS
    Admin.create!( email: 'admin@soulmedicine.dev', password: 'password', password_confirmation: 'password', translator: true, approver: true, superuser: true, admin: true )
    case Rails.env
    when "development"
        Admin.create!( email: 'superuser@soulmedicine.dev', password: 'password', password_confirmation: 'password', translator: true, approver: true, superuser: true, admin: false )
        Admin.create!( email: 'approver@soulmedicine.dev', password: 'password', password_confirmation: 'password', translator: true, approver: true, superuser: false, admin: false )
        Admin.create!( email: 'translator@soulmedicine.dev', password: 'password', password_confirmation: 'password', translator: true, approver: false, superuser: false, admin: false )
        Admin.create!( email: 'user@soulmedicine.dev', password: 'password', password_confirmation: 'password', translator: false, approver: false, superuser: false, admin: false )
    when "production"
        #
    end