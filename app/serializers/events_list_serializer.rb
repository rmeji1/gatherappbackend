class EventsListSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :start_time, :yelp_id, :end_time, :event_id
  # has_one :event
end
