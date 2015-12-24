# Automagically 
Micro-framework to build API for your frontend app and simple admin to be able to store some content.
UNDER CONSTRUCTION.
---

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'automagically'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install automagically

## Usage

Inpired by:
* sinatra + padrino
* grape
* goliath
* active_model_serializer
* active_admin + rails_admin
* and rails of couse

## Quick start

```ruby
    require 'automagically'
    get :reports do
      title :string, public: true
      file :string
      author :string , public: true
    end
```

It means that you can make a `GET /reports` request and it will respond you with a collection of reports like: 

```json
{
    "reports": [
        {
            "title": "First one",
            "author": "Kent Willson"
        },
        {
            "title": "Report last",
            "author": "Maria Brown"
        }
    ]
}
```

More than that, it will give you access to CRUD your model via admin panel.
`/admin/reports` is really heavy because it's gonna be frontend app, which will use api to create/edit and store data.


## Configuring database

Yes, it should work automagically, so it is mostly about Convention over Configuration. That means that by default `automagically` will use `autoconfig.yml` file where it believes to find database configuration same format as Rails gives you.


## Restrictions

Yep, first of all there should be a bunch of restrictions, so then you have to use other instuments and don't use `automagically` when it is not appropriate. For example
Don't use `automagically`:
* when you need complex data processing on backend. It is not for processing, but just giveback some JSON.
* ...


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

