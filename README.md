#  Cool Text
## *By August von Trapp & Brett New*

Cool Text allows users to add contacts, and send messages to one or many contacts at the same time. Users can also text 'news' or 'space' to 480-568-2488, and receive that moment's headlines or an astronomy picture of the day, relatively.

## Technologies Used

* **Application**: *Ruby on Rails 5, Twilio API*<br>
* **Testing**: *Rspec*<br>
* **Database**: *Postgres, ActiveRecord*

Installation
------------

Install *Cool Text* by cloning the repository.  
```
$ git clone https://github.com/brettnew/twilio-app.git
```

Check to make sure ruby and rails are installed on your machine.  
```
$ ruby -v
$ rails -v
```
If they are not installed, please follow instructions [here](http://guides.rubyonrails.org/getting_started.html#installing-rails) to install ruby on rails.

Install required gems:
```
$ bundle install
```

Install ngrok:
```
$ brew cask install ngrok
```

Run Postgres and ngrok:
```
$ postgres
$ ngrok http 3000
```

Navigate to project file and migrate database:
```
$ rake db: create
$ rake db: migrate
```

Start the Rails webserver:
```
$ rails server
```

Navigate to `localhost:3000` in your browser of choice.

License
-------
_This software is licensed under the MIT license._<br>
Copyright (c) 2016 **August von Trapp & Brett New**
