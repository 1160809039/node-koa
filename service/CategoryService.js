var categoryDao=require('../dao/CategoryDao')


module.exports={
  listCategory:async ()=>{
      return categoryDao.listCategory();
  }
}
