#The Hotness
The Hotness lets users take a photo of themselves using their computers webcam and receive face recognition based results on a variety of parameters.

The project is for the [API assessment](http://www.learnhowtoprogram.com/lessons/apis-assessment) for [Epicodus](http://www.epicodus.com/).

##Setup
In your terminal, clone this repo:

```console
$ clone https://github.com/geh4y8/thehotness.git
```

Make sure you've installed [postgres](http://www.postgresql.org/download/) and have started the server:

```console
$ postgres
```

Install all the dependencies:

```console
$ bundle install
```

Set up the databases on your local machine:

```console
$ rake db:create
$ rake db:migrate
```

Finally, start the rails server:

```console
$ rails s
```
It should now be available at `localhost:3000`.

Alternatively, the live app is on [Heroku](http://thehotness.herokuapp.com/).

##Author
[Guy Halperin](http://www.guyhalperin.com)

##License
MIT
