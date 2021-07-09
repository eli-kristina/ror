# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([
  {
    username: "admin",
    password: "admin123456"
  },
  {
    username: "user",
    password: "user123456"
  }
]);

Role.create([
  {
    name: "administrator"
  },
  {
    name: "authenticate_user"
  },
  {
    name: "guest"
  }
]);

Permission.create([
  {
    name: "create_user"
  },
  {
    name: "list_breeds"
  },
  {
    name: "create_breeds"
  },
  {
    name: "update_breeds"
  },
  {
    name: "delete_breeds"
  },
  {
    name: "get_votes"
  },
  {
    name: "create_votes"
  },
  {
    name: "get_favourites"
  },
  {
    name: "create_favourites"
  }
]);

UserRole.create([
  {
    user_id: 1,
    role_id: 1
  },
  {
    user_id: 2,
    role_id: 2
  }
]);

RolePermission.create([
  {
    role_id: 1,
    permission_id: 1
  },
  {
    role_id: 1,
    permission_id: 2
  },
  {
    role_id: 1,
    permission_id: 3
  },
  {
    role_id: 1,
    permission_id: 4
  },
  {
    role_id: 1,
    permission_id: 5
  },
  {
    role_id: 1,
    permission_id: 6
  },
  {
    role_id: 1,
    permission_id: 7
  },
  {
    role_id: 1,
    permission_id: 8
  },
  {
    role_id: 1,
    permission_id: 9
  },
  {
    role_id: 2,
    permission_id: 2
  },
  {
    role_id: 2,
    permission_id: 6
  },
  {
    role_id: 2,
    permission_id: 7
  },
  {
    role_id: 2,
    permission_id: 8
  },
  {
    role_id: 2,
    permission_id: 9
  }
]);

Cat.create([
  {
    name: "Abyssinian",
    life_span: "14 - 15",
    origin: "Egypt",
    temperament: "Active, Energetic, Independent, Intelligent, Gentle",
    image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Juvenile_Ragdoll.jpg/220px-Juvenile_Ragdoll.jpg",
    hairless: 0,
    short_legs: 0,
    suppressed_tail: 0
  },
  {
    name: "Aegean",
    life_span: "9 - 12",
    origin: "Greece",
    temperament: "Affectionate, Social, Intelligent, Playful, Active",
    image: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Aegean_Island_Cat.jpg/220px-Aegean_Island_Cat.jpg",
    hairless: 0,
    short_legs: 0,
    suppressed_tail: 0
  },
  {
    name: "Abyssinian",
    life_span: "14 - 15",
    origin: "Egypt",
    temperament: "Active, Energetic, Independent, Intelligent, Gentle",
    image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Juvenile_Ragdoll.jpg/220px-Juvenile_Ragdoll.jpg",
    hairless: 0,
    short_legs: 0,
    suppressed_tail: 0
  },
  {
    name: "Aegean",
    life_span: "9 - 12",
    origin: "Greece",
    temperament: "Affectionate, Social, Intelligent, Playful, Active",
    image: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Aegean_Island_Cat.jpg/220px-Aegean_Island_Cat.jpg",
    hairless: 0,
    short_legs: 0,
    suppressed_tail: 0
  }
]);