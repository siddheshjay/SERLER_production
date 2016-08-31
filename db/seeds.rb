# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Inject preset values for research methods
  ResearchMethod.create([{method_name: 'Case Study', method_status: 1},
                         {method_name: 'Field Observation', method_status: 1},
                         {method_name: 'Experiment', method_status: 1},
                         {method_name: 'Interview', method_status: 1},
                         {method_name: 'Survey', method_status: 1}])
# Inject preset values for research participants
  Participant.create([{participate_name: 'undergraduate students'},
                     {participate_name: 'postgraduate students'},
                     {participate_name: 'practitioners'}])
# Inject preset values for Methodologies
  Methodology.create([{methodology_name: 'Scrum', description: 'Description'},
                      {methodology_name: 'Waterfall', description: 'Description'},
                      {methodology_name: 'Spiral', description: 'Description'},
                      {methodology_name: 'XP', description: 'Description'},
                      {methodology_name: 'Rational Unified Process', description: 'Description'},
                      {methodology_name: 'Crystal', description: 'Description'},
                      {methodology_name: 'Clean room', description: 'Description'},
                      {methodology_name: 'Feature Driven Development', description: 'Description'},
                      {methodology_name: 'Model Driven Development', description: 'Description'},
                      {methodology_name: 'Domain Driven Development', description: 'Description'},
                      {methodology_name: 'Formal methods', description: 'Description'},
                      {methodology_name: 'Problem Driven Development', description: 'Description'},
                      {methodology_name: 'Cloud computing', description: 'Description'},
                      {methodology_name: 'Service Oriented Development', description: 'Description'},
                      {methodology_name: 'Aspect Oriented Development', description: 'Description'},
                      {methodology_name: 'Valuse Driven Development', description: 'Description'},
                      {methodology_name: 'Product Driven Development', description: 'Description'},
                      {methodology_name: 'Agile', description: 'Description'},])
