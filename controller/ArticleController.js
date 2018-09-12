const articleService=require('../service/ArticleService');
const rabbitmq=require('../utils/rabbitmqutils');

module.exports={
  listArticle:async (ctx,next)=>{

     var list=await articleService.listArticle(ctx.query);
     ctx.body=list;
 },
 getArticleById:async (ctx,next)=>{

    var list=await articleService.getArticleById(ctx.query);
    ctx.body=list;
},
listArticleCount:async (ctx,next)=>{

   var list=await articleService.listArticleCount();
   ctx.body=list;
},
insertArticle:async (ctx,next)=>{

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

    let list=await articleService.insertArticle(param);
    rabbitmq.update(JSON.stringify(param));
     ctx.body=list;
},
updateArticle:async (ctx,next)=>{
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
    var list= await articleService.updateArticle(param);

    ctx.body=list;
},


deleteArticle:async (ctx,next)=>{
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
    let list= await articleService.deleteArticle(param);
    rabbitmq.update(JSON.stringify(param));
    ctx.body=list;
}

}
