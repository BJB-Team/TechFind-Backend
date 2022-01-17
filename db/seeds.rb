# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

job_level = JobLevel.create([{name: "Internship"}, {name: "Part-time"}, {name: "Full-Time"}, {name: "Contract"} ,{name: "Casual"}])

job_type = JobType.create([{name: "Web Developer"}, {name: "Computer Programmer"}, {name: "Full-Stack Developerr"}, 
                            {name: "Software Application Developer"}, {name: "Computer Systems Analyst."}, {name: "Computer Systems Engineer"}])
