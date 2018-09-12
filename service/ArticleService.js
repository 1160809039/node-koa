var articleDao=require('../dao/ArticleDao')


module.exports={
  listArticle:async (param)=>{
      return articleDao.listArticle(param);
  },
  getArticleById:async (param)=>{
      return articleDao.getArticleById(param);
  },
  listArticleCount:async ()=>{
      return articleDao.listArticleCount();
  },
  insertArticle:async (param)=>{

      return articleDao.insertArticle(param);
  },
  updateArticle:async (param)=>{


      return articleDao.updateArticle(param);
  },
  deleteArticle:async (param)=>{


      return articleDao.deleteArticle(param);
  }
}
