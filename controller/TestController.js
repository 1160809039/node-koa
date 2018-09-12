const { userModel } = require('../utils/mongoutils');

module.exports={
  insert: async(ctx,next)=>{
    let data = new userModel({
    name: 'varEczn',
    avatar: 'xxxx.jpg'
    });
    console.log(11)
    ctx.body= await new Promise((resolve,reject)=>{
     data.save().then(suc => {
         resolve(suc);
     }, err => {
         reject(err);
     })
   })



  }
}
