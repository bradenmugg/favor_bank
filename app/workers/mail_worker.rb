class HardWorker
  include Sidekiq::Worker

  def mail_worker(favor)
    favor.new_favor_email
  end
end