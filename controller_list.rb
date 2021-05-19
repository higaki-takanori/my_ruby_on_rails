Dir[File.expand_path('../app/controllers', __FILE__) << '/*.rb'].each do |file|
  require file
end

$controller_list = {
  "users" => UsersController,
  "home" => HomeController
}