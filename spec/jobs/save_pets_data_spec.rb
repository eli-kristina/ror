require 'rails_helper'

RSpec.describe SavePetsDataJob, type: :job do
  describe "Job for Save Pets Data" do
    it "job was enqueued" do
      ActiveJob::Base.queue_adapter = :test
      expect {
        SavePetsDataJob.perform_later(1)
      }.to have_enqueued_job
    end

    it "job was enqueued for correct date and time" do
      ActiveJob::Base.queue_adapter = :test
      expect {
        SavePetsDataJob.set(wait_until: Date.tomorrow.noon, queue: "low").perform_later(1)
      }.to have_enqueued_job.with(1).on_queue("low").at(Date.tomorrow.noon)
    end

    it "job was enqueued with no wait" do
      ActiveJob::Base.queue_adapter = :test
      expect {
        SavePetsDataJob.set(queue: "low").perform_later(1)
      }.to have_enqueued_job.with(1).on_queue("low").at(:no_wait)
    end
  end
end