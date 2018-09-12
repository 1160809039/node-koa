const categoryService=require('../service/CategoryService');


module.exports={
  listCategory:async (ctx,next)=>{

     var list=await categoryService.listCategory();
     ctx.body=list;
 }
}
