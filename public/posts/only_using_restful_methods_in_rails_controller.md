This is how DHH, the creator of Ruby on Rails, make his controllers. He only uses the Rails' RESTful methods:
- `index`
- `show`
- `new`
- `create`
- `edit`
- `update`
- `destroy`

For example, you need to show a list of message sin a page and list of unread messages in another page, normally people do it this way.

```ruby
# your_app/app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def unread
    @messages = Message.where(status: :unread)
  end
end
```

Its better to create a new controller for fetching unread messages instead. So basically, if you need an action that is not within the RESTful methods, its better to make a new controller for it. Better yet, use a namespaced module for it to be organized.

```ruby
# your_app/app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end
end

# your_app/app/controllers/messages/unreads_controller.rb
module Messages
  def UnreadsController < ApplicationController
    def index
      @messages = Message.where(status: :unread)
    end
  end
end
```
