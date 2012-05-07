$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'iBraid'
  app.frameworks += ['QuartzCore']
  app.files_dependencies 'app/right_over_center_stroke.rb' => 'app/stroke.rb',
    'app/right_over_center_to_bottom_stroke.rb' => 'app/stroke.rb',
    'app/left_over_center_stroke.rb' => 'app/stroke.rb',
    'app/left_over_center_to_bottom_stroke.rb' => 'app/stroke.rb'
  
end
