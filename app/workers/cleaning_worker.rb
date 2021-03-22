require "sidekiq-scheduler"

class CleaningWorker
  include Sidekiq::Worker

  def perform
    Diary.where("expiration::date < ?", DateTime.now).destroy_all
  end
end
