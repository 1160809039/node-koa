
const menuService=require('../service/menuService')
module.exports={
   menuPageList:async (ctx,next)=>{

      var list=await menuService.menuPageList(ctx.query);
      ctx.body=list;
  },
  menuList:async (ctx,next)=>{
    var list=await menuService.menuList();

    ctx.body=list;
  },
  addMenu:async (ctx,next)=>{
    let param=  await new Promise((resolve,reject)=>{
       try {
           let postdata = "";
           ctx.req.addListener('data', (data) => {
             postdata += data
           })
           ctx.req.addListener("end",function(){
             // let parseData = parseQueryStr( postdata )
             resolve( postdata )
           })
          } catch ( err ) {
           reject(err)
         }
     })

     param=JSON.parse(param);
    var list=await menuService.addMenu(param);

    ctx.body=list;
  },
  deleteMenu:async (ctx,next)=>{
    var list=await menuService.deleteMenu(ctx.query);
    ctx.body=list;
  },

  selectMenu:async (ctx,next)=>{
    var list=await menuService.selectMenu(ctx.query);
    ctx.body=list;
  },
  updateModule:async (ctx,next)=>{
    let param=  await new Promise((resolve,reject)=>{
       try {
           let postdata = "";
           ctx.req.addListener('data', (data) => {
             postdata += data
           })
           ctx.req.addListener("end",function(){
             // let parseData = parseQueryStr( postdata )
             resolve( postdata )
           })
          } catch ( err ) {
           reject(err)
         }
     })

     param=JSON.parse(param);
    //let list=await menuService.selectMenu({parentid:param.parentid});

    let list=await menuService.updateModule(param);


    ctx.body=list;
  },
  updateMenu:async (ctx,next)=>{
    let param=  await new Promise((resolve,reject)=>{
       try {
           let postdata = "";
           ctx.req.addListener('data', (data) => {
             postdata += data
           })
           ctx.req.addListener("end",function(){
             // let parseData = parseQueryStr( postdata )
             resolve( postdata )
           })
          } catch ( err ) {
           reject(err)
         }
     })

     param=JSON.parse(param);
    //let list=await menuService.selectMenu({parentid:param.parentid});
    let list=await menuService.updateMenu(param);
    ctx.body=list;
  },
  selectMenuById:async(ctx,next)=>{
    let list=await menuService.selectMenuById(ctx.query);
    ctx.body=list[0];
  },
}
