zmq-phpdoc
==========

Helper autocomplete for php zmq extension

## Installation

With composer, just require the file `zmq.php` by:

- Adding the file as a repository in `"repositories"` block,
- and adding the repository as a dev dependency in `"require-dev"` block:

``` js
    "require-dev": {
        "ekho/zmq-phpdoc": "1.0"
    },
    
    { '...' },
    
    "repositories": [
        {
            "type": "package",
            "package": {
                "name": "ekho/zmq-phpdoc",
                "version": "1.0",
                "dist": {
                    "url": "https://raw.githubusercontent.com/ekho/zmq-phpdoc/master/zmq.php",
                    "type": "file"
                }
            }
        }
    ]
```
