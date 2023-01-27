[
    {
        "whitelist": "rulebasedhandler\\.index",
        "securelist": "rulebasedhandler\\.test2",
        "match": "event",
		"action": "redirect",
        "roles": "",
        "permissions": "modify",
        "useSSL": false
    },
	{
        "securelist": "^rulebasedhandler\\.*",
        "match": "event",
		"action": "redirect",
        "roles": "",
        "permissions": "view",
        "useSSL": false
    }
]