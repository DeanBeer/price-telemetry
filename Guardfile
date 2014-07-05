guard :rspec,
      failed_mode: :none,
      notification: false do

  # General crap
  watch('spec/spec_helper.rb')  { "spec" }
  watch(%r{^spec/shared/(.+)\.rb$}) { "spec" }

  # Specific crap
  watch(%r{^app/(.+)\.rb$}) { |m| "spec/cases/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$}) { |m| "spec/cases/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/cases/routing/#{m[1]}_routing_spec.rb", "spec/cases/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb"] }
  watch('config/routes.rb') { "spec/cases/routing" }
  watch(%r{^spec/cases/.+_spec\.rb$})
  watch(%r{^spec/factories/(.+)_factory\.rb$}) { |m| "spec/cases/models/#{m[1]}_spec.rb" }

  # Massive changes
  watch('app/controllers/application_controller.rb')  { "spec/cases/controllers" }
  watch('app/models/permitted_params.rb')  { "spec/cases/controllers" }

end

