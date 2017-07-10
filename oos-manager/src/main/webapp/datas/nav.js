var navs = [
    {
        "title": "权限管理",
        "icon": "fa-cubes",
        "spread": true,
        "children": [{
            "title": "用户管理",
            "icon": "&#xe641;",
            "href": basePath + "/user/list"
        }, {
            "title": "角色管理",
            "icon": "&#xe63c;",
            "href": basePath + "/role/list"
        }, {
            "title": "资源管理",
            "icon": "&#xe63c;",
            "href": basePath + "/permission/list"
        }]
    }, {
        "title": "商品管理",
        "icon": "fa-cogs",
        "spread": false,
        "children": [{
            "title": "商品列表",
            "icon": "fa-table",
            "href": basePath + "/item/list"
        }, {
            "title": "商品添加",
            "icon": "fa-table",
            "href": basePath + "/item/add"
        }, {
            "title": "参数模板",
            "icon": "fa-navicon",
            "href": basePath + "/paramTemplet/list"
        }, {
            "title": "规格参数",
            "icon": "fa-navicon",
            "href": basePath + "/param/list"
        }]
    }, {
        "title": "实时汇率计算",
        "icon": "fa-stop-circle",
        "href": "http://qq.ip138.com/hl.asp",
        "spread": false
    }, {
        "title": "CMS",
        "icon": "fa-cogs",
        "spread": false,
        "children": [{
            "title": "内容分类管理",
            "icon": "fa-table",
            "href": basePath + "/content/cat/list"
        }, {
            "title": "内容管理",
            "icon": "fa-navicon",
            "href": basePath + "/content/list"
        }]
    }
];