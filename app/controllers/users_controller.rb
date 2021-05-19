require './controller_helper.rb'

class UsersController
  def create
    name = $input[0]
    email =  $input[1]
    hobby = $input[2]
    my_user = User.new(name: name, email: email, hobby: hobby)
    my_user.save
    render "thanks", my_user
  end

  def new
    render "new"
  end

  def index
    my_users = User.all
    render "index", my_users
  end

  def show 
    my_users = User.all
    user_index = $path.split("/")[2].to_i
    my_user = User.find(user_index)
    #binding.pry
    render "show", my_user
  end

end