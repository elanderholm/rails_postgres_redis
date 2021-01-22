access_token = ENV['LAUNCHDARKLY_ACCESS_TOKEN']#'api-ce00e0a5-8be8-495a-959e-e1a39639410a' #ENV['LAUNCH_DARKLY_ACCESS_TOKEN']

##SETUP auth using access token
LaunchDarklyApi.configure do |config|
  config.api_key['Authorization'] = access_token
  config.debugging = true
end

##et ld_client to use the api key for the specific environment
Rails.configuration.ld_client = LaunchDarkly::LDClient.new(ENV['LAUNCHDARKLY_ENV_SPECIFIC_SDK_KEY'])
