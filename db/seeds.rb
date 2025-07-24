# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Card.find_or_create_by!(title: "Sol Ring") do |card|
  card.card_type = "Artifact"
  card.oracle_text = "{T}: Add {C}{C}."
  card.flavor_text = "The sun is a star, and a star is a source of power."
end

Card.find_or_create_by!(title: "Lightning Bolt") do |card|
  card.card_type = "Instant"
  card.oracle_text = "Lightning Bolt deals 3 damage to any target."
  card.flavor_text = "The spark of invention can also be the spark of destruction."
end

Card.find_or_create_by!(title: "Giant Growth") do |card|
  card.card_type = "Instant"
  card.oracle_text = "Target creature gets +3/+3 until end of turn."
  card.flavor_text = "A little bit of mana can go a long way."
end

Card.find_or_create_by!(title: "Counterspell") do |card|
  card.card_type = "Instant"
  card.oracle_text = "Counter target spell."
  card.flavor_text = "I don't think so."
end

Card.find_or_create_by!(title: "Black Lotus") do |card|
  card.card_type = "Artifact"
  card.oracle_text = "{T}, Sacrifice Black Lotus: Add three mana of any one color."
  card.flavor_text = "Power that comes at a price."
end

Card.find_or_create_by!(title: "Serra Angel") do |card|
  card.card_type = "Creature — Angel"
  card.oracle_text = "Flying, vigilance"
  card.flavor_text = "Her sword sings a song of salvation."
end

Card.find_or_create_by!(title: "Shivan Dragon") do |card|
  card.card_type = "Creature — Dragon"
  card.oracle_text = "Flying
{R}: Shivan Dragon gets +1/+0 until end of turn."
  card.flavor_text = "The undisputed master of the mountains."
end

Card.find_or_create_by!(title: "Wrath of God") do |card|
  card.card_type = "Sorcery"
  card.oracle_text = "Destroy all creatures. They can't be regenerated."
  card.flavor_text = "A world cleansed by fire."
end

Card.find_or_create_by!(title: "Ancestral Recall") do |card|
  card.card_type = "Instant"
  card.oracle_text = "Target player draws three cards."
  card.flavor_text = "A glimpse into the stream of time."
end

Card.find_or_create_by!(title: "Time Walk") do |card|
  card.card_type = "Sorcery"
  card.oracle_text = "Take an extra turn after this one."
  card.flavor_text = "A single step can change the course of history."
end

Card.find_or_create_by!(title: "Chaos Orb") do |card|
  card.card_type = "World Enchantment"
  card.oracle_text = "All creatures have deathtouch"
  card.flavor_text = "In Gorgatha's domain, even the gentlest touch is a promise of the grave."
end

# Create some people
person1 = Person.find_or_create_by!(name: "Alice")
person2 = Person.find_or_create_by!(name: "Bob")
person3 = Person.find_or_create_by!(name: "Charlie")
person4 = Person.find_or_create_by!(name: "David")

# Create 5 games
Game.find_or_create_by!(id: 1) do |game|
  game.global_effects = [ "Deathtouch", "Flying" ]
  game.status = "playing"
  game.players.build(person: person1)
  game.players.build(person: person2)
  game.turns.build(card: Card.find_by(title: "Sol Ring"))
  game.turns.build(card: Card.find_by(title: "Lightning Bolt"))
end

Game.find_or_create_by!(id: 2) do |game|
  game.global_effects = [ "Vigilance" ]
  game.status = "playing"
  game.players.build(person: person1)
  game.players.build(person: person3)
  game.turns.build(card: Card.find_by(title: "Giant Growth"))
end

Game.find_or_create_by!(id: 3) do |game|
  game.global_effects = []
  game.status = "done"
  game.players.build(person: person2)
  game.players.build(person: person4)
  game.turns.build(card: Card.find_by(title: "Counterspell"))
end

Game.find_or_create_by!(id: 4) do |game|
  game.global_effects = [ "Haste", "Trample" ]
  game.status = "playing"
  game.players.build(person: person1)
  game.players.build(person: person4)
  game.turns.build(card: Card.find_by(title: "Black Lotus"))
end

Game.find_or_create_by!(id: 5) do |game|
  game.global_effects = [ "Indestructible" ]
  game.status = "playing"
  game.players.build(person: person2)
  game.players.build(person: person3)
  game.turns.build(card: Card.find_by(title: "Serra Angel"))
end
