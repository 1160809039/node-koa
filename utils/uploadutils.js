const qiniu = require("qiniu");
const crypto = require('crypto');

module.exports ={

  //七牛云上传
   qiniuUpload:async (key,reader)=>{


      let config = new qiniu.conf.Config();
      config.zone = qiniu.zone.Zone_z2;

      let mac = new qiniu.auth.digest.Mac("aUwFa-JBIHHHmVcjXh5_m8IyEnOd-I8Nh218v1L-", "O7syti3ENgjxNx09VAcTt8zX2P1pDWLp6BMJ1t3R");
      let options = {
       scope: "shaozeming:"+key,
       returnBody: '{"key":"$(key)","hash":"$(etag)","fsize":$(fsize),"bucket":"$(bucket)","name":"$(x:name)","domain":"http://p8c48bjkj.bkt.clouddn.com"}'
      };
      let putPolicy = new qiniu.rs.PutPolicy(options);
      let uploadToken=putPolicy.uploadToken(mac);

      let formUploader = new qiniu.form_up.FormUploader(config);
     let putExtra = new qiniu.form_up.PutExtra();





     // console.log(tmp);
     // let putPolicy ={
     //            scope:'shaozeming:'+key,
     //            'deadline':tmp,
     //            'returnBody':'{
     //              \"name\": $(fname),
     //             \"size\": $(fsize),
     //             \"w\": $(imageInfo.width),
     //             \"h\": $(imageInfo.height),
     //             \"hash\": $(etag)}'
     //           };
     //  console.log(putPolicy);
     //   let encodedPutPolicy = new Buffer(putPolicy).toString('base64');
     //   console.log(encodedPutPolicy);
     //    let sign=crypto.createHmac('sha1', "O7syti3ENgjxNx09VAcTt8zX2P1pDWLp6BMJ1t3R").update(encodedPutPolicy).digest().toString('base64');
     //   console.log(sign);
     //   let uploadToken = "aUwFa-JBIHHHmVcjXh5_m8IyEnOd-I8Nh218v1L-" + ':' + sign + ':' + encodedPutPolicy;
     //   console.log(uploadToken);
       console.log(putExtra);
        let result=  await new Promise((resolve,reject)=>{
          formUploader.putStream(uploadToken, key, reader, putExtra, function(respErr,
            respBody, respInfo) {
            if (respErr) {
              reject(respErr);
            }
            if (respInfo.statusCode == 200) {
              resolve(respBody);
            } else {
              reject(respInfo);
            }
          });
        })

        console.log(result);

        return result;
   }

}
