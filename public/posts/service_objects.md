A service object only does one thing. This is used to help the clear fat controllers/models.

Conventions in using `Service` objects:
- all services go under `app/services` folder
- services starts with a verb and does not end with `service`
  - eg. `ApproveTransaction`, `SendNotification`
- services respond to `call` method:
  - `ApproveTransaction.call`, `SendNotification.call`

Example of a service object:
```ruby
class ApproveTransaction
  def self.call
    new().call
  end

  def initialize
    # Initialize code...
  end

  def call
    approve_something
    notify_approved_user
  end

  private

  def approve_something
    # Code to approve transaction
  end

  def notify_approved_user
    # Code to notify the user involved
  end
end
```

