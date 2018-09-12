const mongoose = require('mongoose');

// Connect
mongoose.connect('mongodb://localhost:27017/blogs'); 

module.exports = mongoose;
