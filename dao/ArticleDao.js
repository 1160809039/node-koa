const mysql=require('../utils/mysqlutils');



module.exports={
    listArticle:async (param)=>{
      let sqlStr='select articleId,articleTitle,articleDesc,addDate,changeDate,categoryId,categoryName,isEnable from articles where isDelete=0  limit ?,?';
      let conn=await mysql.getConnection();
      let sqlParam = [(param.page-1)*param.size, parseInt(param.size)];
      return await new Promise((resolve,reject)=>{
        conn.query(sqlStr,sqlParam, function (err, ret) {
              if (err) {
               reject(err);
               conn.release();
               } else {
                resolve(ret);
                conn.release();
               }
        });
      })

    },

    listArticleCount:async ()=>{
      let sqlStr='select count(*) from articles where isDelete=0';
      let conn=await mysql.getConnection();
      return await new Promise((resolve,reject)=>{
        conn.query(sqlStr, function (err, ret) {
              if (err) {
               reject(err);
               conn.release();
               } else {
                resolve(ret);
                conn.release();
               }
        });
      })

    },
    getArticleById:async (param)=>{
      let sqlStr='select * from articles where isDelete=0 and articleId=?';
      let conn=await mysql.getConnection();
      let sqlParam =param.id;
      return await new Promise((resolve,reject)=>{
        conn.query(sqlStr,sqlParam, function (err, ret) {
              if (err) {
               reject(err);
               conn.release();
               } else {
                resolve(ret);
                conn.release();
               }
        });
      })

    },
    insertArticle:async (param)=>{
      let sqlStr='insert into articles (articleTitle,articleContent,articleDesc,'
          +'addDate,categoryId,categoryName,isEnable,commentNum,readNum,isDelete) values (?,?,?,?,?,?,?,0,0,0)';
      let conn=await mysql.getConnection();

      let sqlParam =[param.articleTitle,param.articleContent,param.articleDesc,param.addDate,param.categoryId,param.categoryName,param.isEnable];
      return await new Promise((resolve,reject)=>{
        conn.query(sqlStr,sqlParam, function (err, ret) {
              if (err) {
               reject(err);
               conn.release();
               } else {
                resolve(ret);
                conn.release();
               }
        });
      })

    },
    updateArticle:async (param)=>{


      let sqlStr='update articles set articleTitle=?,articleContent=?,articleDesc=?,'
          +'addDate=?,categoryId=?,categoryName=?,isEnable=? where articleId=?';
      let conn=await mysql.getConnection();

      let sqlParam =[param.articleTitle,param.articleContent,param.articleDesc,param.addDate,param.categoryId,param.categoryName,param.isEnable,param.articleId];
      return await new Promise((resolve,reject)=>{
        conn.query(sqlStr,sqlParam, function (err, ret) {
              if (err) {
               reject(err);
               conn.release();
               } else {
                resolve(param);
                conn.release();
               }
        });
      })

    },

    deleteArticle:async (param)=>{


      let sqlStr='delete from  articles where articleId in '+param.Ids;
      let conn=await mysql.getConnection();


      return await new Promise((resolve,reject)=>{
        conn.query(sqlStr, function (err, ret) {
              if (err) {
               reject(err);
               conn.release();
               } else {
                resolve(ret);
                conn.release();
               }
        });
      })

    }

}
