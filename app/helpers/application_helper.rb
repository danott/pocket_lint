module ApplicationHelper
  def action_options
    [["Archive", "archive"], ["Delete", "delete"]]
  end

  def criteria_options
    (1..31).map do |digit|
      ["Items older than #{pluralize(digit, "day")}", digit]
    end
  end

  def frequency_options
    [
      ["Every month", "monthly"],
      ["Every week", "weekly"],
      ["Every day", "daily"]
    ]
  end

  def link_to_pocket
    link_to "Pocket", "https://getpocket.com"
  end
end
