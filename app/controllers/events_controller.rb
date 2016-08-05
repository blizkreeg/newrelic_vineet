class EventsController < ApplicationController
  respond_to :json

  def create
    org = Org.find(params[:org_id].to_i)
    event = Event.create!(org_id: org.id, ts: Time.at(params[:event_ts].to_i), hostname: params[:event_host], name: params[:event_name])

    render json: { event_id: event.id }, status: 201
  rescue ActiveRecord::RecordNotFound
    render json: { error: "org #{params[:org_id]} not found" }, status: 500
  end
end
