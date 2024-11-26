# web-test

A Nginx server exposing different kind of endpoints that can be used for tests.

## env

    VERSION=1
    MESSAGE=hello world!
    SLEEP_MAX=59
    KEEP_ALIVE=0
    PATH_PREFIX=/

## endpoints

* `/message`
* `/sleep`
* `/sleep/1`
* `/sleep/5`
* `/sleep/max`
* `/404/my_header`
* `/410/my_header`
* `/500/my_header`
* `/503/my_header`
* `/404/my_response`
* `/410/my_response`
* `/reqdump`

## build & publish

    make build
    make publish
