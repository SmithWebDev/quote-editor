puts "\n== Seeding the database with fixtures =="
# system('bin/rails db:fixtures:load')
Company.create!([
                  { name: 'KPMG' },
                  { name: 'PwC' }
                ])
#Quote.create!([
#                { name: 'First Quote',
#                  company_id: 1 },
#                { name: 'Second Quote',
#                  company_id: 1 },
#                { name: 'Third Quote',
#                  company_id: 1 }
#              ])
User.create!([
               { email: 'accountant@kpmg.com',
                 password: 'password',
                 company_id: 1 },
               { email: 'manager@kpmg.com',
                 password: 'password',
                 company_id: 1 },
               { email: 'eavesdropper@pwc.com',
                 password: 'password',
                 company_id: 2 }
             ])
