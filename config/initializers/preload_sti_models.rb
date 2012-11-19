if Rails.env.development?
  # Make sure we preload the parent and children classes in development
  require_dependency File.join("app","models","Entry.rb")
end