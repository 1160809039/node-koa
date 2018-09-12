const mongoose = require('../connect');

let schemas = {};

schemas.Article = mongoose.Schema({
    articleId: {
        type: Number,
        required: true
    },
    articleTitle: {
        type: String
    },
    articleContent: {
        type: String
    },
    articleDesc: {
        type: String
    },
    addDate: {
        type: Date
    },
    changeDate: {
        type: Date
    },
    categoryId: {
        type: Number
    },
    categoryName: {
        type: String
    },
    isEnable: {
        type: Number
    },
    commentId: {
        type: Number
    },
    commentNum: {
        type: Number
    },
    readNum: {
        type: Number
    },
    isDelete: {
        type: Number
    }
});


schemas.Menu = mongoose.Schema({
    id: {
        type: Number
    },
    title: {
        type: String
    },
    icon: {
        type: String
    },
    link: {
        type: String
    },
    parentid: {
        type: String
    },
    isdelete: {
        type: {}
    }
});
module.exports = schemas;
