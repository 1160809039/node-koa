const menuDao=require('../dao/MenuDao')
const { MenuModel } = require('../utils/mongoutils');


module.exports={
  menuPageList:async (param)=>{
     let result=menuDao.menuPageList(param);

      return  result;
  },
  menuList:async ()=>{

    let result=  new Promise((resolve,reject)=>{
       MenuModel.find().then(docs => {

          resolve(docs);
      }, err => {

        reject(err);
      });
     })
        return  result;
  },
  addMenu:async (data)=>{


    let result= MenuModel.create(data);
    // promise.then(function (jawbreaker) {
    //
    // })
    return  result;
  },
  deleteMenu:async (data)=>{


    let result= MenuModel.deleteOne(data);

    return  result;
  },
  selectMenu:async(data)=>{
    let result= MenuModel.find(data);
    return  result;
  },
  updateModule:async(data)=>{
    let parentid=data.parentid;
    let _ids=data._ids;
    let res= await  new Promise((resolve,reject)=>{
       MenuModel.update()({_id:{$in:_ids}}, {$set:{parentid:parentid}},function(err,raw){
          if(err){
            reject(err)
          }
          else{
            resolve(raw)
          }
       })
    })

    return res;


  },
  updateMenu:async(data)=>{
    let result= MenuModel.findByIdAndUpdate(data._id,{$set:data});
    return  result;
  },
  selectMenuById:async(data)=>{
    let result= MenuModel.find(data);
    return  result;
  },
}
