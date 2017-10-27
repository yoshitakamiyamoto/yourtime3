class GoogleCalendar
  def self.calendar
    require 'signet/oauth_2/client'
    require 'google/apis/calendar_v3'
    client = Signet::OAuth2::Client.new(
      client_id: ENV["CLIENT_ID"],
      client_secret: ENV["CLIENT_SECRET"],
      access_token: ENV["ACCESS_TOKEN"],
      refresh_token: ENV["REFRESH_TOKEN"],
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token'
    )
    client.refresh!
    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client
    time_min = Time.utc(Date.today.year, Date.today.month, Date.today.day - 7, 0).iso8601
    time_max = Time.utc(Date.today.year, Date.today.month, Date.today.day + 1, 0).iso8601
    events = service.list_events('primary', single_events: true, order_by: 'startTime', time_max: time_max,
          time_min: time_min)
    total_time = 0
    number = 0
    events.items.each do |item|
      if events.items[number].end.date_time == nil
      else
        total_time += item.end.date_time.to_time - item.start.date_time.to_time
      end
      number += 1
    end
    total_hour = total_time / 3600 #グーグルカレンダーに書いてある予定の総時間
    sleeping_time = 8 #睡眠時間
    work_time = 8 #働いている時間
    empty_time = (24*7) - (sleeping_time*7) - (work_time*7) - total_hour
  end
end
