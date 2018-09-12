const amqp = require('amqplib/callback_api');
// amqp.connect('amqp://guest:guest@localhost:5672', function(err, conn) {});
// amqp.connect('amqp://guest:guest@localhost:5672', function(err, conn) {
//   conn.createChannel(function(err, ch) {});
// });

// amqp.connect('amqp://guest:guest@localhost:5672', function(err, conn) {
//   conn.createChannel(function(err, ch) {
//     let q = 'update';
//
//     ch.assertQueue(q, {durable: false});
//     // // Note: on Node 6 Buffer.from(msg) should be used
//      // ch.sendToQueue(q, new Buffer('Hello World!'));
//     // console.log(" [x] Sent 'Hello World!'");
//
//     conn.close();
//   });
// });

module.exports={
  update:(data)=>{

    amqp.connect('amqp://guest:guest@localhost:5672', function(err, conn) {
      conn.createChannel(function(err, ch) {
        let q = 'delete';

        ch.assertQueue(q, {durable: true});
        // // Note: on Node 6 Buffer.from(msg) should be used
         ch.sendToQueue(q, new Buffer(data));
        //conn.close();
        // console.log(" [x] Sent 'Hello World!'");
       setTimeout(()=>{conn.close();},200)
      });
    });
  }
};
