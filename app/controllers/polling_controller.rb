# Handles the public submissions of answers to poll questions.
class PollingController < ApplicationController
  include Cms::PollsHelper
  include Cms::Authentication::Controller

  def update
    @response  = PollResponse.find(params[:id])
    unique_key = cookie_key(@response.poll)

    if !cookies[unique_key]
      @response.votes += 1
      @response.save!

      cookies[unique_key] = {
          :value   => true,
          :expires => 1.year.from_now
      }
      logger.warn "Saving cookie called '#{unique_key}'"
    else
      logger.warn "User attempted to submit another answer to the same poll."
    end

    render :nothing => true, :status => :ok
  end

  def results
    @poll = Poll.find(params[:id])
    render :layout => false
  end

  def reset
    @poll           = Poll.find(params[:id])

    cookie          = cookie_key(@poll)
    cookies.delete(cookie)

    redirect_to "/"
  end

  private
  def cookie_key(poll)
    cookie_for(poll)
  end
end