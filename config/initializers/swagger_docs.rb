Swagger::Docs::Config.register_apis({
  "1.0" => {
    :api_extension_type => :json,
    :api_file_path => "public/",
    :base_path => "http://localhost:3000/api-docs",
    :clean_directory => true,
    :formatting => :pretty,
    :info => {
      :title => "Blog App API",
      :description => "Documentation for blog app API",
      :contact => "adedejifavour6@gmail.com",
      :license => "MIT",
      :license_url => "https://opensource.org/licenses/MIT"
    },
    :security_definitions => {
      :api_key => {
        :type => :apiKey,
        :name => "api_key",
        :in => :header
      }
    },
    :security => [
      {
        :api_key => []
      }
    ],
    :swagger => "2.0"
  }
})
