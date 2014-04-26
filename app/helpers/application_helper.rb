module ApplicationHelper
  def action_options
    [["Archive the items", "archive"], ["Delete the items", "delete"]]
  end

  def criteria_options
    (1..31)
  end

  def frequency_options
    [
      ["Every month", "monthly"],
      ["Every week", "weekly"],
      ["Every day", "daily"]
    ]
  end

end
