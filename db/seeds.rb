def generate_user(full_name, email, password)
  first_name = full_name.split[0].downcase!
  user = User.create!(full_name: full_name, email: email, password: password)
  user.photo.attach(io: File.open("#{Rails.root}/test/fixtures/files/#{first_name}.png"), filename: "#{first_name}.png", content_type: "image/png")
  user
end

def generate_teacher(user, description, price, address, photo)
  teacher = Teacher.create!(user_id: user.id, description: description, price: price, address: address)
  teacher.photo.attach(io: File.open("#{Rails.root}/test/fixtures/files/#{photo}.png"), filename: "#{photo}.png", content_type: "image/png")
end

teacher_1 = generate_user("Maria Fernanda Silva", "maria@fernanda.com", "maria1234")
generate_teacher(teacher_1, "In this salsa class I'll show students how to warm up and move safely, demonstrate how to perform dance moves and give them feedback.", 50.3, "Marlborough School, Draycott Ave, SW3 3AP", "salsa")

teacher_2 = generate_user("Mariana Luiza Ferreira", "mariana@luiza.com", "mariana1234")
generate_teacher(teacher_2, "Let's tango! In this class I design pieces and performances for couples and teach theory of dance. I have more than 10 years of experience in the matter.", 62.5, "St Andrew's Church, Greyhound Rd, W14 9SA", "tango")

teacher_3 = generate_user("Carlos Alberto Nogueira", "carlos@alberto.com", "carlos1234")
generate_teacher(teacher_3, "This samba class is designed to teach you individual and couple dance styles. From Brazil, I've been working for more than 6 years with samba de gafieira", 70, "16 Flaxman Terrace, WC1H 9AT", "samba")

teacher_4 = generate_user("Thiago Grande Melo", "thiago@grande.com", "thiago1234")
generate_teacher(teacher_4, "Frevo is such a original and specific dance style from Brazil, you probably didn't even know it. In this class you'll learn basic steps and have a lot of fun", 30, "Charing Cross Sports Club, Aspenlea Rd, W6 8ND", "frevo")

puts '--> Users and Teachers Generation Completed'
