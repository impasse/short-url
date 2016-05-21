# Short URL

**Node.js version >= 6.0.0**

## Demo

[_Live Demo_](http://halo.red/)

## Install

#### Install Redis

```
apt-get install redis # ubuntu/debian
dnf install redis # fedroa
yum install redis # rhel/centos
pacman -S redis # archlinux
```

#### Clone this repository

```
git clone https://github.com/lingmm/short-url.git
```

#### Install the dependencies

```
cd short-url
npm install
```

## Configuration

edit the `config.json`
- **url_prefix** for the url prefix when generate short url
- **redis_config** redis connection config
- **minimum** the minimum length when generate short url
- **bind** the server will bind this address
- **loglevel** the log level of request

## Run

```
npm start
```
