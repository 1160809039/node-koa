const router = require('koa-router')()
const menuController=require('../controller/MenuController')
const articleController=require('../controller/ArticleController')
const categoryController=require('../controller/CategoryController')
const uploadController=require('../controller/uploadController')

const test=require('../controller/TestController')

router.get('/test', async (ctx, next) => {
  await test.insert(ctx,next);
})

router.get('/admin/menu/list', async (ctx, next) => {
  await menuController.menuList(ctx,next);
})
router.get('/admin/menu/selectById', async (ctx, next) => {
  await menuController.selectMenuById(ctx,next);
})
router.post('/admin/menu/add', async (ctx, next) => {
  await menuController.addMenu(ctx,next);
})
router.post('/admin/menu/update', async (ctx, next) => {
  await menuController.updateMenu(ctx,next);
})
router.post('/admin/menu/updateModule', async (ctx, next) => {
  await menuController.updateModule(ctx,next);
})
router.get('/admin/menu/delete', async (ctx, next) => {
  await menuController.deleteMenu(ctx,next);
})
router.get('/admin/menu/select', async (ctx, next) => {
  await menuController.selectMenu(ctx,next);
})

router.get('/admin/menu/pagelist', async (ctx, next) => {
  await menuController.menuPageList(ctx,next);
})

router.get('/admin/category/list', async (ctx, next) => {
  await categoryController.listCategory(ctx,next);
})

router.get('/admin/article/list', async (ctx, next) => {
  await articleController.listArticle(ctx,next);
})
router.get('/admin/article/id', async (ctx, next) => {
  await articleController.getArticleById(ctx,next);
})

router.get('/admin/article/count', async (ctx, next) => {
  await articleController.listArticleCount(ctx,next);
})
router.post('/admin/article/insert', async (ctx, next) => {
  await articleController.insertArticle(ctx,next);
})

router.post('/admin/article/update', async (ctx, next) => {
  await articleController.updateArticle(ctx,next);
})

router.post('/admin/article/delete', async (ctx, next) => {
  await articleController.deleteArticle(ctx,next);
})
router.post('/admin/uploadFile', async (ctx, next) => {
  await uploadController.uploadQiniu(ctx,next);
})


module.exports = router
