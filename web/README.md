# web-test

A Nginx server exposing different kind of endpoints that can be used for tests.

## env

    VERSION=1
    MESSAGE=hello world!
    SLEEP_MAX=59
    KEEP_ALIVE=1
    PATH_PREFIX=

## endpoints

* `/message`
* `/sleep`
* `/sleep/1`
* `/sleep/5`
* `/sleep/max`
* `/404`
* `/410`
* `/500`
* `/502`
* `/503`
* `/504`
* `/509`
* `/reqdump`

## build & publish

    make build
    make publish
