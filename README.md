# Epawa API

An API that lists users in order of wallet balance, allows users to deposit and withdraw funds, allows users accounts to be randomly credited and allows searching for users by name.

## Built With

- Rails

## Getting Started

**To get started, follow the instructions below**

- First, make sure to have Ruby at >=2.5.1 and Rails at >=6.0

To get a local copy up and running follow these simple example steps.

- git clone the backend repo if you want to run the server on your local machine. Otherwise, skip the next 3 steps.

```
git clone https://github.com/onedebos/epawa-rails
```

- cd into the backend repo and install the gems

```
bundle install
```

- You may need webpack

```
rails webpacker:install
```

- Create and migrate the DB

```
rails db:create && db:migrate
```

- Seed the DB

```
rails db:seed
```

- run the rails server on port 3001

```
rails s -p 3001
```

- Make requests to the endpoints below

### Automated Tests

- Currently, there are no automated tests avaailable for this project. This will be implemented at a later date.

### Endpoints

**All endpoints accept a JSON body and give a JSON response**

- Deposit

```
put '/user/deposit/:id'
params = {deposit_amt}
```

- Withdrawals

```
put '/user/withdraw/:id'
params = {withdrawal}
```

- Random Debit and Credit

```
get '/user/credituser/:id', :to => 'users#credit_user'
get '/user/debituser/:id', :to => 'users#debit_user'
```

- Create a new user

```
POST '/users'
params = {name, wallet}
```

- List users with highest balance first

```
GET '/users'
```

- Find users by name

```
GET '/user/findname'
params = {name}
```

- Find users with balance above or equal to a given amount

```
GET '/users/user/balanceabove

params = {amt}

```

## Authors

👤 **Adebola**

- Github: [@githubhandle](https://github.com/onedebos)
- Twitter: [@twitterhandle](https://twitter.com/debosthefirst)
- Linkedin: [linkedin](https://www.linkedin.com/in/adebola-niran/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

## 📝 License

This project is [MIT](lic.url) licensed.
