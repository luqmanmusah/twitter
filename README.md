## README

# Redesign of Twitter

> The purpose of this project was to build a Twitter Redesign to immitate the basic feature of Twitter. That is Sharing your opinion, following another User and can be followed as well.

## Some of the advanced concepts explored in this project includes.

- Working with advanced associations, many-to-many relationships, a typical twitter follow and follower relationship model.
- Authentication using Devise
- Used RSpec as the test suit with the help of shoulda-matchers and capybara for effective testing. Both unit and integration testing was done.
- Used carrierwave gem to achieve image upload for profile photo.

## Built With

- Ruby v2.7.0
- Ruby on Rails v5.2.4
- RSpec
- Bootstrap ~4.0
- Bulma


## Screenshot

![twitter](https://user-images.githubusercontent.com/22328716/119786543-d2d2e680-bebf-11eb-8c51-663d86b4da31.png)

## Live Demo
[live](https://quiet-atoll-47092.herokuapp.com/)


## Video Presentation

[Loom Link](https://www.loom.com/share/bc1771107e294886a6ad41018201d00b)

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Ruby: 2.7.0
Rails: 5.2.3


### Setup

```
$ git clone https://github.com/luqmanmusah/twitter.git
$ cd twitter
```

Instal gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    rspec --format documentation
```


## ✒️ Author <a name = "author"></a>

👤 **Luqman Musah**

- Github: [@luqmanmusah](https://github.com/luqmanmusah)
- Linkedin: [Luqman Musah](https://www.linkedin.com/in/luqman-musah/)

## 📝 License

This Project has no Licence.
