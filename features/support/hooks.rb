Before do
  #Session.create!({wedding_date: Date.tomorrow})
  Repository.for(:session).create({wedding_date: Date.today + 1, photographer_id: 1})
end