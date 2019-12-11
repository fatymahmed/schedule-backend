Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origin 'http://localhost:3000'
    resources '*' headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
  end

  allow do
    origin 'http://localhost:3000' 
    # put heroku link here
    resources '*' headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
  end
end