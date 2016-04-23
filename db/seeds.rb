# Borrar registros
puts "++++++++++++++++++++++++++++++++++"
puts "Borrando registros"
puts "++++++++++++++++++++++++++++++++++"
User.destroy_all
Message.destroy_all
Category.destroy_all
Group.destroy_all
GroupsMessage.destroy_all
UsersGroup.destroy_all
MessagesCategory.destroy_all

# Crear usuarios
puts "++++++++++++++++++++++++++++++++++"
puts "Creando usuarios"
puts "++++++++++++++++++++++++++++++++++"
users = [
  { name: "Rick Grimes", email: "rick@grimes.com", password: "12345678", password_confirmation: "12345678", bio: "Esta es una bio pequeña y de prueba" },
  { name: "Tyrion Lannister", email: "tyrion@lannister.com", password: "12345678", password_confirmation: "12345678", bio: "Esta es una bio pequeña y de prueba" },
  { name: "Jean Grey", email: "jean@grey.com", password: "12345678", password_confirmation: "12345678", bio: "Esta es una bio pequeña y de prueba" },
  { name: "Paulina Vega", email: "paulina@vega.com", password: "12345678", password_confirmation: "12345678", bio: "Esta es una bio pequeña y de prueba" },
]
User.create( users )
rick = User.find_by_email("rick@grimes.com").id
tyrion = User.find_by_email("tyrion@lannister.com").id
jean = User.find_by_email("jean@grey.com").id
paulina = User.find_by_email("paulina@vega.com").id

# Crear categorías
puts "++++++++++++++++++++++++++++++++++"
puts "Creando categorías"
puts "++++++++++++++++++++++++++++++++++"
categories = [
  { name: "Features", user_id: rick },
  { name: "Bugs", user_id: tyrion },
  { name: "Fixes", user_id: jean },
  { name: "Glitches", user_id: paulina },
  { name: "Random", user_id: jean },
  { name: "Design", user_id: jean },
]
Category. create( categories )
features = Category.find(1).id
bugs = Category.find(2).id
fixes = Category.find(3).id
glitches = Category.find(4).id
random_cat = Category.find(5).id
design_cat = Category.find(6).id

# Crear grupos
puts "++++++++++++++++++++++++++++++++++"
puts "Creando grupos"
puts "++++++++++++++++++++++++++++++++++"
groups = [
  { name: "Grupo de Desarrollo", user_id: rick },
  { name: "Grupo de Diseño", user_id: paulina },
  { name: "Grupo de Front End", user_id: jean },
  { name: "Random", user_id: tyrion },
]
Group.create( groups )

# Popular grupos
puts "++++++++++++++++++++++++++++++++++"
puts "Populando grupos"
puts "++++++++++++++++++++++++++++++++++"
dev = Group.find(1).id
design = Group.find(2).id
fe = Group.find(3).id
random = Group.find(4).id
people = [
  { group_id: dev, user_id: rick },
  { group_id: dev, user_id: tyrion },
  { group_id: dev, user_id: jean },
  { group_id: design, user_id: jean },
  { group_id: design, user_id: paulina },
  { group_id: fe, user_id: rick },
  { group_id: fe, user_id: jean },
  { group_id: fe, user_id: tyrion },
  { group_id: random, user_id: rick },
  { group_id: random, user_id: paulina },
  { group_id: random, user_id: tyrion },
  { group_id: random, user_id: jean },
]
UsersGroup.create( people )

# Crear mensajes
puts "++++++++++++++++++++++++++++++++++"
puts "Creando mensajes"
puts "++++++++++++++++++++++++++++++++++"
messages = [
  { body: "<p>Qué calor está haciendo hoy</p>", privacy: 0, user_id: tyrion },
  { body: "<p>Ese Negan es un loquillo</p>", privacy: 0, user_id: rick },
  { body: "<p>Trabajando con Caracol :D</p>", privacy: 0, user_id: paulina },
  { body: "<p>X-Men assemble!!! Ah, no, esos son los Avengers xD</p>", privacy: 0, user_id: jean },
  { body: "<p>Nota mental: Encontrar a khaleesi</p>", privacy: 1, user_id: tyrion },
  { body: "<p>Tengo que arreglar un bug con los zombies</p>", privacy: 1, user_id: rick },
  { body: "<p>Que no se me olvide cobrarle a Caracol :P</p>", privacy: 1, user_id: paulina },
  { body: "<p>Logan como que ha estado haciendo ejercicio mmmm</p>", privacy: 1, user_id: jean },
  { body: "<p>Tyrion hiciste el feature de autenticación?</p>", privacy: 2, user_id: rick },
  { body: "<p>Estoy haciendo lo de la autenticación pero me sale error T_T</p>", privacy: 2, user_id: tyrion },
  { body: "<p>Pilas Tyrion que eso es crítico :v</p>", privacy: 2, user_id: jean },
  { body: "<p>Pau el diseño te quedo divino</p>", privacy: 2, user_id: jean },
  { body: "<p>Gracias Jean, cómo vas diseñando el UX?</p>", privacy: 2, user_id: paulina },
  { body: "<p>Bien, ya casi acabo :D</p>", privacy: 2, user_id: jean },
  { body: "<p>Muchachos cómo quieren que se vea el listado de items?</p>", privacy: 2, user_id: jean },
  { body: "<p>Como un acordeon, que se despliegue cuando uno le da clic</p>", privacy: 2, user_id: rick },
  { body: "<p>Yo pienso que un modal sería mejor</p>", privacy: 2, user_id: tyrion },
  { body: "<p>No sabes nada Tyrion Snow xD</p>", privacy: 2, user_id: rick },
  { body: "<p>ja ja ja ¬_¬</p>", privacy: 2, user_id: tyrion },
  { body: "<p>Vieron la novela anoche?</p>", privacy: 2, user_id: jean },
  { body: "<p>Nop, estaba viendo TWD ;)</p>", privacy: 2, user_id: rick },
  { body: "<p>Y yo GoT :P</p>", privacy: 2, user_id: tyrion },
  { body: "<p>Pero si ustedes actúan ahí, no se vale!!!</p>", privacy: 2, user_id: jean },
  { body: "<p>Yo me dormí temprano</p>", privacy: 2, user_id: paulina },
]
Message.create( messages )

# Asignar mensajes a grupos
puts "++++++++++++++++++++++++++++++++++"
puts "Asignando mensajes"
puts "++++++++++++++++++++++++++++++++++"
msg = [
  { group_id: dev, message_id: 9 },
  { group_id: dev, message_id: 10 },
  { group_id: dev, message_id: 11 },
  { group_id: design, message_id: 12 },
  { group_id: design, message_id: 13 },
  { group_id: design, message_id: 14 },
  { group_id: fe, message_id: 15 },
  { group_id: fe, message_id: 16 },
  { group_id: fe, message_id: 17 },
  { group_id: fe, message_id: 18 },
  { group_id: fe, message_id: 19 },
  { group_id: random, message_id: 20 },
  { group_id: random, message_id: 21 },
  { group_id: random, message_id: 22 },
  { group_id: random, message_id: 23 },
  { group_id: random, message_id: 24 },
]
GroupsMessage.create( msg )

# Asignar cateogrías a mensajes
puts "++++++++++++++++++++++++++++++++++"
puts "Asignando categorías"
puts "++++++++++++++++++++++++++++++++++"
cats = [
  { category_id: features, message_id: 9 },
  { category_id: features, message_id: 10 },
  { category_id: bugs, message_id: 10 },
  { category_id: features, message_id: 11 },
  { category_id: fixes, message_id: 11 },
  { category_id: design_cat, message_id: 12 },
  { category_id: design_cat, message_id: 13 },
  { category_id: design_cat, message_id: 14 },
  { category_id: features, message_id: 15 },
  { category_id: features, message_id: 16 },
  { category_id: features, message_id: 17 },
  { category_id: features, message_id: 18 },
  { category_id: random_cat, message_id: 18 },
  { category_id: features, message_id: 19 },
  { category_id: random, message_id: 20 },
  { category_id: random, message_id: 21 },
  { category_id: random, message_id: 22 },
  { category_id: random, message_id: 23 },
  { category_id: random, message_id: 24 },
]
MessagesCategory.create( cats )
