
# Social media app with Ruby on Rails

We create a Ruby on Rails social media app for this project; you can create accounts and log in, guest users only can see, sign-in and sing-up pages.
<img src="./app/assets/images/sign_in.png">
<img src="./app/assets/images/Sign_up.png">

 If you log in, you will access the list of all users and see each user profile with their posts. 

You could send friends invitations (Add button) and see the pending friends list to accept or reject sent invitations to you. You can create your posts, comments then and like/dislike posts (yours or your friend posts), order by most recent, and counting the numbers of likes and comments.

<img src= "./app/assets/images/Timeline.png">

<img src="./app/assets/images/User_profile.png">


## Built With

- Ruby v2.7.0
- Ruby on Rails v5.2.4

## Live Demo

TBA


## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Ruby: 2.6.3
Rails: 5.2.3
Postgres: >=9.5

### Setup

Instal gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Github Actions

To make sure the linters' checks using Github Actions work properly, you should follow the next steps:

1. On your recently forked repo, enable the GitHub Actions in the Actions tab.
2. Create the `feature/branch` and push.
3. Start working on your milestone as usual.
4. Open a PR from the `feature/branch` when your work is done.


### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    rpsec --format documentation
```

> Tests will be added by Microverse students. There are no tests for initial features in order to make sure that students write all tests from scratch.

### Deployment

TBA

## Authors

TBA

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

TBA

## 📝 License

TBA

