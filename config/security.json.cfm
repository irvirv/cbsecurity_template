[
    {
        "whitelist": "rulebasedhandler\b.index",
        "securelist": "^rulebasedhandler\b..*",
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