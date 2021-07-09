namespace :pets do
    desc "Pull data from public API and store into local"
    task :save_data => :environment do
        limit = 1
        SavePetsDataJob.perform_async(limit)
    end
end