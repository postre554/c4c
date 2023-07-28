# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


comment = Comment.create!(
  texto: "Este es un comentario de ejemplo.",
  fecha_publicacion: Time.now, # Puedes ajustar la fecha y hora según tus necesidades
  user_id: 1,
  publication_id: 15
)



comment = Comment.create!(
  texto: "Este es un comentario de ejemplo.2",
  fecha_publicacion: Time.now, # Puedes ajustar la fecha y hora según tus necesidades
  user_id: 2,
  publication_id: 4
)
