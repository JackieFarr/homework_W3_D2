require_relative("./bounty.rb")

Bounty.delete_all()

bounty1 = Bounty.new({
  "name" => "Joey",
  "species" => "Tribiani",
  "last_known_location" => "Pizza Place",
  "favourite_weapon" => "Sandwiches"
})

bounty2 = Bounty.new({
  "name" => "Ross",
  "species" => "Gellar",
  "last_known_location" => "Science Camp",
  "favourite_weapon" => "Fossils"
})

bounty3 = Bounty.new({
  "name" => "Rachel",
  "species" => "Green",
  "last_known_location" => "Ralph Lauren",
  "favourite_weapon" => "Money"
})

bounty4 = Bounty.new({
  "name" => "Monica",
  "species" => "Bing",
  "last_known_location" => "Apartment",
  "favourite_weapon" => "Food"
})

bounty5 = Bounty.new({
  "name" => "Chandler",
  "species" => "Bing",
  "last_known_location" => "Coffee Shop",
  "favourite_weapon" => "Humour"
})

bounty6 = Bounty.new({
  "name" => "Phoebe",
  "species" => "Buffet-Hannigan",
  "last_known_location" => "Massage Parlour",
  "favourite_weapon" => "Guitar"
})

bounty1.save()
bounty2.save()
bounty3.save()
bounty4.save()
bounty5.save()
bounty6.save()

bounty3.species = Gellar
bounty3.update()

bounty6.delete()

bounties = Bounty.all()
