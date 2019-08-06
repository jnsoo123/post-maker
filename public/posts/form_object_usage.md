Why Form Objects?

Using this design pattern helps developers distinguish what the business logic is easier. Form objects are used to put all business logics here instead of putting them in the models to avoid clutter and distinguish which are the business logic and data integrity.

Business logic are for example, when the app(Ticket System) features a creation of a `Ticket` object:
- when a `Ticket` object is created, app should notify the user that handles the ticket
- the ticket should be automatically set as `pending`

Data Integrity on the other hand assures accuracy and consistency. The part when the system breaks when a certain data is missing. For example creation of a `User` object needs to always have an `email` field. Thus, this should be in the model and not in the form object

Conventions of using `Form Object` design pattern:
- always put it in `app/forms`
Example of a form object using the examples above:
```ruby
class TicketForm
  includes ActiveModel::Model

  validates :title, presence: true
  validates :body,  presence: true

  attr_accessor(
    :ticket,
    :title,
    :body,
    :user_id,
  )

  def initialize(attr={})
    super
    set_attributes if self.ticket.present?
  end

  def save
    return false if invalid?
    create_ticket
    notify_management
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, 'Ticket')
  end

  private

  def create_ticket
    Ticket.create(ticket_params)
  end

  def set_attributes
  end

  def ticket_params
    {
      title:   @title,
      body:    @body,
      user_id: @user_id
    }
  end

  def notify_management
    # Code to notify management
  end
end
```
Using this type of design pattern in form objects can benefit when using the `simple_form` gem. It will be easier to create forms with this type of pattern. (Using attributes as `attr_accessor`). It will use validations set in this form object to check if all fields are correct
