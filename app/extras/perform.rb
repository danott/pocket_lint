person = Person.new("7fb26223-1d76-3f13-3ba3-718170")
items = PocketItem.for_person(person)
stale_items = PocketItemPundit.stale?(items)
transformation = PocketItemTransformation.new(person, stale_items)
transformation.perform
