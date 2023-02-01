# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create!(name: "John Doe", photo: "https://picsum.photos/200/300", bio: "Lorem ipsum dolor sit amet", posts_counter: 0)
post = Post.create!(title: "Post 1", text: "Lorem ipsum dolor sit amet", comments_counter: 0, likes_counter: 0, author_id: user.id)
Comment.create!(text: "Lorem ipsum dolor sit amet", author_id: user.id, post_id: post.id)
Like.create!(author_id: user.id, post_id: post.id)

user = User.create!(name: "Bob Doe", photo: "https://picsum.photos/200/300", bio: "Lorem ipsum dolor sit amet", posts_counter: 0)
post = Post.create!(title: "Post 2", text: "Lorem ipsum dolor sit amet", comments_counter: 0, likes_counter: 0, author_id: user.id)
Comment.create!(text: "Lorem ipsum dolor sit amet", author_id: user.id, post_id: post.id)
Like.create!(author_id: user.id, post_id: post.id)

user = User.create!(name: "Jane Doe", photo: "https://picsum.photos/200/300", bio: "Lorem ipsum dolor sit amet", posts_counter: 0)
post = Post.create!(title: "Post 3", text: "Lorem ipsum dolor sit amet", comments_counter: 0, likes_counter: 0, author_id: user.id)
Comment.create!(text: "Lorem ipsum dolor sit amet", author_id: user.id, post_id: post.id)
Like.create!(author_id: user.id, post_id: post.id)