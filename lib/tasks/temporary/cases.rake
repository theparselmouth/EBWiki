namespace :cases do
  desc "Add blurb to cases"
  task add_blurb: :environment do
    cases = Case.all
    puts "Going to update #{cases.count} cases"

    ActiveRecord::Base.transaction do
      cases.each do |this_case|
        this_case.blurb = "#{this_case.title}, on #{this_case.date} in #{this_case.city}, #{this_case.state.name}"
        this_case.save!
        print "."
      end
    end
  end
end