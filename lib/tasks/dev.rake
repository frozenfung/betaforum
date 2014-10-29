namespace :dev do
  task :create => :environment do
    Topic.create(
        :title => 'From rake', 
        :content => 'rake rake and rake',
        :user => User.new
      )
  end
end