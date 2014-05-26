class PocketItem
  def initialize(attrs)
    @attrs = attrs.symbolize_keys.slice(:item_id, :time_added, :given_title, :resolved_title, :given_url, :resolved_url)
  end

  def id
    attrs[:item_id]
  end

  def time_added
    Time.at(attrs[:time_added].to_i)
  end

  def title
    attrs[:resolved_title] || attrs[:given_title]
  end

  def url
    attrs[:resolved_url] || attrs[:given_url]
  end

  private

  def attrs
    @attrs
  end
end
