
const multer = require('koa-multer');

const uploadutils=require('../utils/uploadutils');
const fs = require('fs');


module.exports={
  uploadQiniu:async (ctx, next)=>{
    let file = ctx.request.body.files.quillfile;
    let reader = fs.createReadStream(file.path); // 创建可读流
    let ext = file.name.split('.').pop();
    let key=  Date.parse( new Date() ).toString()+file.size+'.'+ext
  
    ctx.body= await uploadutils.qiniuUpload(key,reader);
  }
}
