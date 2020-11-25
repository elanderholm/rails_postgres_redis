LAUNCH_DARKLY_API_KEY = ENV['LAUNCH_DARKLY_API_KEY']
LAUNCH_DARKLY_PROJECT_NAME = ENV['LAUNCH_DARKLY_PROJECT_NAME']
LAUNCH_DARKLY_ENV_NAME = ENV['RELEASE_ENV_ID']
LaunchDarklyApi.configure do |config|
  config.api_key['Authorization'] = LAUNCH_DARKLY_API_KEY
  config.debugging = true
end

begin
  launch_darkly_env = Ld.get_environment(
    project: LAUNCH_DARKLY_PROJECT_NAME,
    env: LAUNCH_DARKLY_ENV_NAME  
  )
  
  $ld_client = Rails.configuration.ld_client = LaunchDarkly::LDClient.new(launch_darkly_env.apiKey)
rescue => e
  binding.pry
end
