class DelintPocket
  def self.call(person)
    items = PocketItem.for_person(person)
    stale_items = PocketItemPundit.stale?(items)
    transformation = PocketItemTransformation.new(person, stale_items)
    transformation.perform
  end
end
