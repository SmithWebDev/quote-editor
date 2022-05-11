puts "
== Seeding the database with fixtures =="
# system('bin/rails db:fixtures:load')
Company.create!([
                  { name: "KPMG" },
                  { name: "PwC" },
                ])
Quote.create!([
                { name: "First Quote",
                  company_id: 1 },
                { name: "Second Quote",
                  company_id: 1 },
                { name: "Third Quote",
                  company_id: 1 },
              ])
User.create!([
               { email: "accountant@kpmg.com",
                 password: "password",
                 company_id: 1 },
               { email: "manager@kpmg.com",
                 password: "password",
                 company_id: 1 },
               { email: "eavesdropper@pwc.com",
                 password: "password",
                 company_id: 2 },
             ])
LineItemDate.create!([
                       { quote_id: 1,
                         date: Date.current },
                       { quote_id: 1,
                         date: Date.current + 1.week },
                     ])
LineItem.create!([
                   { line_item_date: today,
                     name: "Meeting room",
                     description: "A cosy meeting room for 10 people",
                     quantity: 1,
                     unit_price: 1000 },
                   { line_item_date: today,
                     name: "Meal tray",
                     description: "Our delicious mean tray",
                     quantity: 10,
                     unit_price: 25 },
                   { line_item_date: next_week,
                     name: "Meeting room",
                     description: "A cosy meeting room for 10 people",
                     quantity: 1,
                     unit_price: 1000 },
                   { line_item_date: next_week,
                     name: "Meal tray",
                     description: "Our delicious mean tray",
                     quantity: 10,
                     unit_price: 25 },
                 ])
