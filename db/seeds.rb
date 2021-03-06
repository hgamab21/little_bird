# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all if User.any?
Like.destroy_all if Like.any?
Tag.destroy_all if Tag.any?
Post.destroy_all if Post.any?
Following.destroy_all if Following.any?

5.times do |i|
  user = User.create!(username:"user #{i}", password: "pw #{i}")
  7.times do |ii|
    post = Post.create!(author: user, post: "user #{i}'s #{ii}th post")
    user.posts << post
  end

end
