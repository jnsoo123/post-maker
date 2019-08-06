Facade pattern is usually used in Rails' controllers to make them thinner. An example of a fat controller is using a lot of variables or instance variables to use in the view.

```ruby
# your_app/app/controllers/users_controller.rb
class UsersController < ApplicationController
  def index
    @classmates = current_user.classroom.students
    @school     = current_user.school
    @lessons    = Lesson.where(grade: current_user.grade)
    @note       = Note.new
  end
end
```

Where you can use the facade pattern to make the controlelr thinner and lesser variables.

```ruby
# your_app/app/facades/users_index_facade.rb
class UsersIndexFacade
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def classmates
    user.classroom.students
  end

  def school
    user.school
  end

  def lessons
    Lesson.where(grade: user.grade)
  end

  def note
    Note.new
  end
end

# your_app/app/controllers/users_controller.rb
class UsersController < ApplicationController
  def index
    @facade = UsersIndexFacade.new(current_user)
  end
end
```

And you can use it like this in the views:

```erb
<%= @facade.classmates %>
<%= @facade.lessons %>
<%= @facade.school %>
<%= @form_for @facade.note do |f| %>
<% end %>
```
