[
    {
        "whitelist": "rulebasedhandler\.index",
        "securelist": "^rulebasedhandler\..*",
        "match": "event",
        "roles": "",
        "permissions": "view",
        "redirect": "security.loginform",
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