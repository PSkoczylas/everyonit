# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


User.create(email: 'abc@abc.com', first_name: 'Peter',last_name: 'Jumpforest',
            password: 'Abcd12345', password_confirmation: 'Abcd12345',
            description: 'Szukam roboty w Javie. Na studiach klepnąłem 8 projektów, w tym 5 w Javie. Lubię Javę,
            sprawdź mój git. Pozdro.',
            title: 'Wannable Java Developer',
            open_for_job: 2
)

User.create(email: 'abcd@abc.com', first_name: 'Tadeusz', last_name: 'Nowak',
            password: 'Abcd12345', password_confirmation: 'Abcd12345',
            description: 'Szukam roboty w Ruby. Jest to najlepszy język we wszechświecie. Pozdrawiam.',
            title: 'Wannable Ruby Developer',
            open_for_job: 2
)
