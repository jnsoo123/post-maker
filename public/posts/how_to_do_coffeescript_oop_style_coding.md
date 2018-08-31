- Creating a `constructor` method
- Create and call the `@addEvents` method inside the constructor
for the events of the class
- Create methods to separate actions and for it to be readable and organized
- Call the object below to run it

```javascript
class FooBar
  constructor: () ->
    @$elem = $('.the-element-you-need')

    @addEvents()

  addEvents: () ->
    @$elem.on 'click', (e) =>
      e.preventDefault()
      console.log 'Element Clicked!'

      @magicAction()

    @$elem.on 'hover', (e) =>
      e.preventDefault()
      console.log 'Element Hovered!'

    // Other events

  magicAction: () ->
    // Do Something
    return

$(document).on 'load', () =>
  new FooBar
```
