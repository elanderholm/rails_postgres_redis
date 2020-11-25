LAUNCH_DARKLY_API_KEY = ENV['LAUNCH_DARKLY_API_KEY'] || 'api-ce00e0a5-8be8-495a-959e-e1a39639410a'
LAUNCH_DARKLY_PROJECT_NAME = ENV['LAUNCH_DARKLY_PROJECT_NAME'] || 'default'
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
  Spring.after_fork do
    Rails.configuration.ld_client = LaunchDarkly::LDClient.new(launch_darkly_env.apiKey)
  end
rescue => e
  binding.pry
end
