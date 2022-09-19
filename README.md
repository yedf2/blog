# README

This blog can be access by this link [https://b.dtm.pub](https://b.dtm.pub)
## Quick Start

You can startup this project in two ways:

### Using docker-compose

requirement: docker & docker-compose have been installed
```
git clone https://github.com/yedf2/blog && cd blog
docker-compose up -d
```

### From Source
requirement: ruby(>=2.7) has been installed
```
git clone https://github.com/yedf2/blog && cd blog
bundle install
bin/rails db:migrate
bin/rails db:seed
bin/rails server
```

If you want to crawl the newest museums in `https://www.museumsusa.org/`, you can run `bin/crawl` and then run `bin/rails db:seed` to load the downloaded museus to database

## Visit

After the project has been startup, you can now visit by this link [localhost:3000](localhost:3000)

## Files
- [./db](./db): schema of database, initial data of database, table creating scripts
- [./bin/crawl](./bin/crawl): Get museums and parse HTML
- [./app](./app): UI&Controller
