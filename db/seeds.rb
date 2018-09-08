user1=User.create!(email: "jon@test.com", password: "123456", password_confirmation: "123456")
user2=User.create!(email: "tom@test.com", password: "123456", password_confirmation: "123456")
user3=User.create!(email: "laurence@test.com", password: "123456", password_confirmation: "123456")
user4=User.create!(email: "julia@test.com", password: "123456", password_confirmation: "123456")

user1.create_account!(balance: 100.0)
user2.create_account!(balance: 100.0)
user3.create_account!(balance: 100.0)
user4.create_account!(balance: 100.0)