guard :rspec,
      failed_mode: :none,
      notification: false do

  watch('spec/spec_helper.rb')  { "spec" }

  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }

  # Rails example
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/cases/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$})          { |m| "spec/cases/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/cases/routing/#{m[1]}_routing_spec.rb", "spec/cases/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb"] }
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch('config/routes.rb')                           { "spec/cases/routing" }
  watch('app/controllers/application_controller.rb')  { "spec/cases/controllers" }

end

