module Cms::PollsHelper
  def response_results(response)
    total = response.poll.total_votes == 0 ? 0 : (response.votes.to_f / response.poll.total_votes.to_f) * 100
    "#{response.votes} votes (#{sprintf("%.2f", total)}%)"
  end

  def cookie_for(poll)
    "cmspolls_#{poll.id}".to_sym
  end
end