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


  User.create!([
    {
      email: "user@example.com", password: "123456", password_confirmation: "123456",
      reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1,
      current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10",
      current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"
    },
  ])


  EvidenceSource.create([
    {
      status: 'NEW', submitter_id: 1,
      title: 'From CMMI and Isolation to Scrum, Agile, Lean and Collaboration',
      source_title: 'Agile Conference, 2009. AGILE \'09.',
      year: 2009, volume_number: nil, issue_number: nil,
      page_str: '283-288', page_begin: 283, page_cease: 288,
      DOI: '10.1109/AGILE.2009.18',
    },
    {
      status: 'NEW', submitter_id: 1,
      title: 'Distributed Scrum: Agile Project Management with Outsourced Development Teams',
      source_title: 'System Sciences, 2007. HICSS 2007. 40th Annual Hawaii International Conference on',
      year: 2007, volume_number: nil, issue_number: nil,
      page_str: '274a-274a', page_begin: 274, page_cease: 274,
      DOI: '10.1109/HICSS.2007.180',
    },
    {
      status: 'NEW', submitter_id: 1,
      title: 'The Effectiveness of Pair Programming: Software Professionals\' Perceptions',
      source_title: 'IEEE Software',
      year: 2016, volume_number: 33, issue_number: 4,
      page_str: '72-79', page_begin: 72, page_cease: 79,
      DOI: '10.1109/MS.2015.106',
    },
    {
      status: 'NEW', submitter_id: 1,
      title: 'A study of pair-programming configuration for learning computer networks',
      source_title: 'Ubi-Media Computing (UMEDIA), 2015 8th International Conference on',
      year: 2015, volume_number: nil, issue_number: nil,
      page_str: '369-375', page_begin: 369, page_cease: 375,
      DOI: '10.1109/UMEDIA.2015.7297488',
    },
    {
      status: 'NEW', submitter_id: 1,
      title: 'Qualitative Analysis of Knowledge Transfer in Pair Programming',
      source_title: '2015 IEEE/ACM 37th IEEE International Conference on Software Engineering',
      year: 2015, volume_number: nil, issue_number: nil,
      page_str: '855-858', page_begin: 855, page_cease: 858,
      DOI: '10.1109/ICSE.2015.277',
    },
    ])
    