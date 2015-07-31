Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://redistogo:8dbe6d7cda51ed6a9bc1be2de72d8148@sole.redistogo.com:9483/' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://redistogo:8dbe6d7cda51ed6a9bc1be2de72d8148@sole.redistogo.com:9483/' }
end