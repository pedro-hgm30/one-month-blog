# Blog on Rails

By [Pedro Henrique](pedro.hgm30@gmail.com)

[pedro-hgm30.github.com](https://github.com/pedro-hgm30)

## Installing locally

1. Go to the [repo](https://github.com/pedro-hgm30/onemonthblog)
2. Clone locally using
 `git clone git@github.com:pedro-hgm30/one-month-blog.git`
3. If you haven't yet, install ruby on rails in your machine, [here](https://railsapps.github.io/installing-rails.html) is a quick guide
4. Navigate to the recently created directory and run `bundle install` (or just bundle depending on the version you're running)
5. Next, you must run the migrations with `rails db:migrate`
6. Then you're ready to start a local server using `rails s`
7. Navigate to the app in your [browser](http://localhost:3000)
8. Have a great time!

## Disclosure

These are the technologies that I used on the project: HTML, CSS, JS, and Ruby on Rails.
The ruby version is `ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux-gnu]`
The rails version is `Rails 5.2.3`
Node is also required to run Rails, the version that I'm using is `v10.15.3`

## Requirements

1. ##### Create a blog using either Ruby on Rails or JavaScript. 
2. ##### This blog should have essentially three pages: the *Home* page where all the posts are listed, the *Post* page where the full post is displayed, and the *Author* page where you have all the posts from that specific author
3. ##### The blog should also provide an option to register an Author
4. ##### The post itself should have a *title*, a *body*, and a  *timestamp*

I added other features such as an `admin` that can manage the blog, `users` that can interact with the blog, without being able to create posts like authors. There's also `pagination`, a `search mechanism` and much more.

## Bonus!

#### A post should have comments!

I used the `Active Record Associations` to create the logic behind the comments 

#### Besides the standard requirements and also de bonus requirements I made many other functionalities, so feel free to check the code or the [live version](https://theoneblog.herokuapp.com) if you want

