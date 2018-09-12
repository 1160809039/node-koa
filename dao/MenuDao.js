const mysql=require('../utils/mysqlutils');

module.exports={
  menuList:async ()=>{
      let sqlStr='select * from admin_menu where isdelete=0';
      let conn=await mysql.getConnection();

      return  await new Promise((resolve,reject)=>{
        conn.query(sqlStr, function (err, ret) {
              if (err) {
               reject(err);
               conn.release();
               } else {
                resolve(ret);
                conn.release();
               }
        });
    });
  },
   menuPageList:async (param)=>{
        let sqlStr='select * from admin_menu where isdelete=0 limit ?,?';
        let conn=await mysql.getConnection();
        let sqlParam = [(param.page-1)*param.size, parseInt(param.size)];

        return  await new Promise((resolve,reject)=>{
          conn.query(sqlStr, sqlParam, function (err, ret) {
                if (err) {
                 reject(err);
                 conn.release();
                 } else {
                  resolve(ret);
                  conn.release();
                 }
          });
      });
   },
   addMenuItem:async (param)=>{
     let sqlStr='insert admin_menu values(?,?,?,0)';
     let conn=await mysql.getConnection();
     let sqlParam = [param.title,param.link,param.parentid];

     return  await new Promise((resolve,reject)=>{
       conn.query(sqlStr, sqlParam, function (err, ret) {
             if (err) {
              reject(err);
              conn.release();
              } else {
               resolve(ret);
               conn.release();
              }
       });
   });
   }
}
