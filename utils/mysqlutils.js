
const mysql = require("mysql");

const pool = mysql.createPool({
    host: "localhost",    // 主机地址
    port: 3306,                 // 端口
    user: "root",               // 数据库访问账号
    password: "root",         // 数据库访问密码
    database: "myblogs",           // 要访问的数据库
    charset: "UTF8_GENERAL_CI", // 字符编码 ( 必须大写 )
    typeCast: true,             // 是否把结果值转换为原生的 javascript 类型
    supportBigNumbers: true,    // 处理大数字 (bigint, decimal), 需要开启 ( 结合 bigNumberStrings 使用 )
    bigNumberStrings: true,     // 大数字 (bigint, decimal) 值转换为javascript字符对象串
    multipleStatements: false,  // 允许每个mysql语句有多条查询, 未防止sql注入不开启
    //connectTimeout: 5000,     // 数据库连接超时时间, 默认无超时
});
pool.connectionLimit = 30;      // 连接池中可以存放的最大连接数量
pool.waitForConnections = true; // 连接使用量超负荷是否等待, false 会报错
pool.queueLimit = 0;            // 每个连接可操作的 列数 上限, 0 为没有上限

module.exports ={
  getConnection:()=>{
    return new Promise((resolve, reject) => {
        pool.getConnection((err, conn) => {
            if (err) {
                console.log("数据库连接获取失败");
            } else {
                resolve(conn);
            }
        });
      });
  }
}
