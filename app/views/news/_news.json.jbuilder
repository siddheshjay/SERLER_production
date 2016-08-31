json.extract! news, :id, :news_id, :news_body, :created_at, :updated_at
json.url news_url(news, format: :json)