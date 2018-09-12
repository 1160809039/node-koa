const mysql=require('../utils/mysqlutils');



module.exports={
    listCategory:async ()=>{
      let sqlStr='select * from categories where isDelete=0';
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
