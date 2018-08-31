class Post < ApplicationRecord
  def self.refresh
    Post.destroy_all

    Dir[Rails.root.join('public', 'posts', '*.md')].each do |file|
      file_name = file.split('/').last.gsub('.md', '').gsub('_', ' ').capitalize
      body      = File.read(file)

      Post.create title: file_name, body: body
    end
  end
end
