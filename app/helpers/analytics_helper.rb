module AnalyticsHelper
  def analytics_enabled?
    analytics_tracker.present? && analytics_host.present?
  end

  def analytics_tracker
    ENV["ANALYTICS_TRACKER"]
  end

  def analytics_host
    ENV["ANALYTICS_HOST"]
  end
end
