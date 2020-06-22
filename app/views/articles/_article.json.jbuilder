json.extract! article, :id, :title, :content, :highlight_image, :highlight, :user_id, :click_count, :created_at, :updated_at
json.url article_url(article, format: :json)
