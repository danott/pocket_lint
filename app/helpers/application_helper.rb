module ApplicationHelper
  def action_options
    [["Archive", "archive"], ["Delete", "delete"]]
  end

  def considered_lint_s_options
    [
      ["Days", daily_options],
      ["Weeks", weekly_options],
      ["Months", monthly_options],
      ["Years", yearly_options]
    ]
  end

  def considered_lint_s_option(magnitude, unit)
    ["Items older than #{pluralize(magnitude, unit)}", pluralize(magnitude, unit)]
  end

  def daily_options
    (1..6).map do |digit|
      considered_lint_s_option(digit, "day")
    end
  end

  def weekly_options
    (1..5).map do |digit|
      considered_lint_s_option(digit, "week")
    end
  end

  def monthly_options
    (1..11).map do |digit|
      considered_lint_s_option(digit, "month")
    end
  end

  def yearly_options
    [considered_lint_s_option(1, "year")]
  end

  def link_to_pocket
    link_to "Pocket", "https://getpocket.com"
  end

  def link_to_square_cash(text)
    mail_to "thedanielott@gmail.com",
      text,
      cc: "cash@square.com",
      subject: "Here's your $2!",
      body: "Thanks for linting my Pocket!"
  end
end
