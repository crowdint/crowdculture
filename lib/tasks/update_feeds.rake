namespace :feeds do
  desc "Update feeds"
  task :update => :environment do
    Feed.update_feeds
    Facebook.update
  end
end