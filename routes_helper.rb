require "./controller_list.rb"

$routes = Hash.new

def post(path, controller_action)
  controller, action = controller_action[:to].split("#")
  method = $controller_list["#{controller}"].new.method(:"#{action}")
  $routes[["POST", path]] = method
end

def get(path, controller_action)
  controller, action = controller_action[:to].split("#")
  method = $controller_list["#{controller}"].new.method(:"#{action}")
  $routes[["GET", path]] = method
end