This can be very useful especially when creating ruby gems/engines so the user can install your
gem/engine via version tag. Here are the cheatsheet of [git-flow](https://danielkummer.github.io/git-flow-cheatsheet/)

Steps in creating release tags:
- Make sure you are in the `develop` branch.
  Run `$ git flow release start version_x.y.z`.
  This will create a brnch called `release/version_x.y.z`.
- Publish the release branch to Github.
  Run `$ git flow release publish version_x.y.z`.
  This is so that the branch gets pushed to the git servers in case of any accidents with the proceeding steps.
- Make version number updates to codebase. Commit these changes and push to `release/version_x.y.z` branch.
```ruby
# lib/foo_bar/version.rb
module FooBar
  VERSION = '0.2.0' # From '0.1.0'
end
```
- Finish up the release branch. The release branch will merge this branch to master and develop and make it ready for deployment. Run `$ git flow release finish version_x.y.z`. When prompted to give tag for this branch, just use `version_x.y.z`. After this, push tags to github. Run `$ git push --tags`
- Push to master and develop branch. `$ git checkout develop`. `$ git push origin develop`. `$ git checkout master`. `$ git push origin master`
