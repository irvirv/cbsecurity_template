[
    {
        "whitelist": "rulebasedhandler\.index",
        "securelist": "^rulebasedhandler\..*",
        "match": "event",
        "roles": "",
        "permissions": "view",
        "useSSL": false
    },
    {
        "whitelist": "",
        "securelist": "^shopping",
        "match": "url",
        "roles": "",
        "permissions": "shop,checkout",
        "redirect": "security.loginform",
        "useSSL": true
    }
]