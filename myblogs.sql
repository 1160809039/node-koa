/*
 Navicat Premium Data Transfer

 Source Server         : laravel
 Source Server Type    : MySQL
 Source Server Version : 50713
 Source Host           : 118.24.148.167:3306
 Source Schema         : myblogs

 Target Server Type    : MySQL
 Target Server Version : 50713
 File Encoding         : 65001

 Date: 12/09/2018 10:27:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `link` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentid` int(11) NULL DEFAULT NULL,
  `isdelete` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, '用户管理', 'anticon-user', '', NULL, b'0');
INSERT INTO `admin_menu` VALUES (2, '信息管理', 'anticon-bars', '', NULL, b'0');
INSERT INTO `admin_menu` VALUES (3, '模块管理', 'anticon-setting', '', NULL, b'0');
INSERT INTO `admin_menu` VALUES (4, '数据管理', 'anticon-line-chart', '', NULL, b'0');
INSERT INTO `admin_menu` VALUES (5, '网站用户', NULL, 'index', 1, b'0');
INSERT INTO `admin_menu` VALUES (6, '博客文章', NULL, 'articlemanage', 2, b'0');
INSERT INTO `admin_menu` VALUES (7, '博客评论', NULL, 'articlemanage', 2, b'0');
INSERT INTO `admin_menu` VALUES (8, '后台目录', NULL, 'articlemanage', 3, b'0');
INSERT INTO `admin_menu` VALUES (9, '数据统计', NULL, 'statistics', 4, b'0');

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles`  (
  `articleId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `articleTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `articleContent` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `articleDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `addDate` datetime(0) NULL DEFAULT NULL,
  `changeDate` datetime(0) NULL DEFAULT NULL,
  `categoryId` int(11) NULL DEFAULT NULL,
  `categoryName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `isEnable` tinyint(1) NULL DEFAULT NULL,
  `commentId` int(11) NULL DEFAULT NULL,
  `commentNum` int(11) NULL DEFAULT NULL,
  `readNum` int(11) NULL DEFAULT NULL,
  `isDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`articleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES (4, 'Spring Cloud之 Config Server 使用ip端口号配置高可用', '<p>先看官方文档的配置</p><pre>---\nspring:\n  profiles: peer1\neureka:\n  instance:\n    hostname: peer1\n  client:\n    serviceUrl:\n      defaultZone: http://peer2/eureka/\n\n---\nspring:\n  profiles: peer2\neureka:\n  instance:\n    hostname: peer2\n  client:\n    serviceUrl:\n      defaultZone: http://peer1/eureka/<br><br>两台注册中心的高可用的时候，就是分别注册到对方上去<br><br><br>同理，三台以上的时候</pre><pre>---\nspring:\n  profiles: peer1\neureka:\n  instance:\n    hostname: peer1\n  client:\n    serviceUrl:\n      defaultZone: http://peer2/eureka/,http://peer3/eureka/\n\n---\nspring:\n  profiles: peer2\neureka:\n  instance:\n    hostname: peer2\n  client:\n    serviceUrl:\n      defaultZone: http://peer1/eureka/,http://peer3/eureka/</pre><pre>---\nspring:\n  profiles: peer3\neureka:\n  instance:\n    hostname: peer3\n  client:\n    serviceUrl:\n      defaultZone: http://peer1/eureka/,http://peer2/eureka/<br><br>不论多少台主机，都是将自己注册到除了自己之外的其他注册中心上去<br>不过这里有一个小问题，就是peer是一个主机名，如果想要使用还需要在host文件中配置，如果想要简单一点，只用ip就可以了。</pre><pre>---\nspring:\n  profiles: peer1<br>server:<br>  port: 8761\neureka:\n  instance:\n  client:\n    serviceUrl:\n      defaultZone: http://127.0.0.1:8762/eureka/,http://127.0.0.1:8763/eureka/\n\n---\nspring:\n  profiles: peer2<br>server:<br>  port: 8762\neureka:\n  instance:\n  client:\n    serviceUrl:\n      defaultZone: http://127.0.0.1:8761/eureka/,http://127.0.0.1:8763/eureka/</pre><pre><code>---\nspring:\n  profiles: peer3\nserver:\n  port: 8763 \neureka:\n  instance:\n  client:\n    serviceUrl:\n      defaultZone: http://127.0.0.1:8761/eureka/,http://127.0.0.1:8762/eureka/</code></pre><pre>如果您在一台知道自己的主机名的机器上运行（默认情况下使用java.net.InetAddress查找），则不需要eureka.instance.hostname</pre><p><br></p><p><br></p>', 'Spring Cloud之 Config Server 使用ip端口号配置高可用', '2018-04-21 07:07:29', NULL, 1, '后台', 0, NULL, 8, 63, 0);
INSERT INTO `articles` VALUES (5, 'webpack4的react打包错误', '<p>&nbsp;因为之前一直用的是脚手架创建项目，第一次自己学习创建webpack打包。loader我是复制别人的。&nbsp;</p><pre><code>module: {\n   loaders: [\n     {\n       test: /\\.js?$/,\n       exclude: /(node_modules)/,\n       loader: \'babel-loader\',\n       query: {\n         presets: [\'react\', \'es2015\']\n       }\n     }\n   ]\n },</code></pre><p><br></p><p>&nbsp;结果打包的时候报错了。<br></p><p>ERROR in ./js/index.js<br>Module build failed: Error: Plugin/Preset files are not allowed to export objects, only functions. In I:\\desk\\File Manager\\Demo\\react\\my-app\\node_modules\\babel-preset-react\\lib\\index.js<br>at createDescriptor (I:\\desk\\File Manager\\Demo\\react\\my-app\\node_modules\\@babel\\core\\lib\\config\\config-descriptors.js:179:11)<br>at I:\\desk\\File Manager\\Demo\\react\\my-app\\node_modules\\@babel\\core\\lib\\config\\config-descriptors.js:104:12<br>at Array.map (&lt;anonymous&gt;)<br>at createDescriptors (I:\\desk\\File Manager\\Demo\\react\\my-app\\node_modules\\@babel\\core\\lib\\config\\config-descriptors.js:103:27)<br>at createPresetDescriptors (I:\\desk\\File Manager\\Demo\\react\\my-app\\node_modules\\@babel\\core\\lib\\config\\config-descriptors.js:95:10)<br>at I:\\desk\\File Manager\\Demo\\react\\my-app\\node_modules\\@babel\\core\\lib\\config\\config-descriptors.js:81:14<br>at cachedFunction (I:\\desk\\File Manager\\Demo\\react\\my-app\\node_modules\\@babel\\core\\lib\\config\\caching.js:40:17)<br>at presets (I:\\desk\\File Manager\\Demo\\react\\my-app\\node_modules\\@babel\\core\\lib\\config\\config-descriptors.js:26:68)<br>at mergeChainOpts (I:\\desk\\File Manager\\Demo\\react\\my-app\\node_modules\\@babel\\core\\lib\\config\\config-chain.js:298:68)<br>at I:\\desk\\File Manager\\Demo\\react\\my-app\\node_modules\\@babel\\core\\lib\\config\\config-chain.js:251:7<br>at buildRootChain (I:\\desk\\File Manager\\Demo\\react\\my-app\\node_modules\\@babel\\core\\lib\\config\\config-chain.js:64:27)<br>at loadPrivatePartialConfig (I:\\desk\\File Manager\\Demo\\react\\my-app\\node_modules\\@babel\\core\\lib\\config\\partial.js:41:53)<br>at loadFullConfig (I:\\desk\\File Manager\\Demo\\react\\my-app\\node_modules\\@babel\\core\\lib\\config\\full.js:33:37)<br>at transformSync (I:\\desk\\File Manager\\Demo\\react\\my-app\\node_modules\\@babel\\core\\lib\\transform-sync.js:13:36)<br>at Object.transform (I:\\desk\\File Manager\\Demo\\react\\my-app\\node_modules\\@babel\\core\\lib\\transform.js:20:65)<br>at transpile (I:\\desk\\File Manager\\Demo\\react\\my-app\\node_modules\\babel-loader\\lib\\index.js:55:20)<br>at Object.module.exports (I:\\desk\\File Manager\\Demo\\react\\my-app\\node_modules\\babel-loader\\lib\\index.js:179:20)</p><p><br></p><p>去官网上看了一下发现官网上presets里面都是 @babel/xxx，跟着试了一下果然如此</p><p>&nbsp; npm install&nbsp;@babel/preset-react --save-dev</p><p>&nbsp; npm install&nbsp;@babel/preset-react --save-es2015</p><p><br></p><pre><code>module: {\n  rules: [\n    {\n      test: /\\.js$/,\n      exclude: /(node_modules|bower_components)/,\n      use: {\n        loader: \'babel-loader\',\n        options: {\n          presets: [\'@babel/preset-react\',\'@babel/preset-es2015\']\n        }\n      }\n    }\n  ]\n}</code></pre><p><br></p>', '  因为之前一直用的是脚手架创建项目，第一次自己学习创建webpack打包。loader我是复制别人的。结果打包的时候报错了。', '2018-04-21 12:29:06', NULL, 2, '前端', 0, NULL, 1, 38, 0);
INSERT INTO `articles` VALUES (6, 'elasticsearch简单的安装以及集群配置详解', '<p>首先要确保有java8的环境,安装方法如下(centos)&nbsp;</p><p><br></p><pre><code>wget --no-check-certificate --no-cookies --header \"Cookie: oraclelicense=accept-securebackup-cookie\" http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-x64.rpm\n npm -ivh  jdk-8u161-linux-x64.rpm</code></pre><p><br></p><p>环境安装完毕，下载elesticsearch&nbsp;</p><p><br></p><pre><code>wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.5.2.zip</code></pre><p><br></p><p>解压elasticsearch-5.5.2.zip&nbsp;</p><p><br></p><pre><code>unzip elasticsearch-5.5.2.zip</code></pre><p><br></p><p>如果没有unzip这个命令的话可以先运行&nbsp;</p><p><br></p><pre><code>yum install unzip</code></pre><p><br></p><p><br></p><p>elasticsearch不能直接用root账户运行，所以需要创建一个用户，而且需要将elasticsearch文件夹属主修改为新创建的这个用户，不然的话启动的时候会有一些权限引起的错误</p><p>接着创建用户并修改文件夹属主和属组&nbsp;</p><p><br></p><pre><code>groupadd elasticsearch\nuseradd elasticsearch\npasswd  elasticsearch\nchown -R  elasticsearch:elasticsearch  elasticsearch</code></pre><p><br></p><p>打开位于elasticsearch文件夹中/conifg目录下的 elasticsearch.yml配置文件修改配置</p><p>cluster.name: elas_cluster&nbsp; &nbsp;集群的名字</p><p>node.name: node-q1&nbsp; &nbsp;节点的名称</p><p>node.master: true<br>node.data: true</p><p>&nbsp;配置文件中给出了三种配置高性能集群拓扑结构的模式,如下：</p><p>1. 如果你想让节点从不选举为主节点,只用来存储数据,可作为负载器</p><p>&nbsp; &nbsp; &nbsp; &nbsp;node.master: false</p><p>&nbsp; &nbsp; &nbsp; node.data: true</p><p>2. 如果想让节点成为主节点,且不存储任何数据,并保有空闲资源,可作为协调器</p><p>&nbsp; &nbsp; &nbsp; &nbsp;node.master: true</p><p>&nbsp; &nbsp; &nbsp; &nbsp;node.data: false</p><p>3. 如果想让节点既不称为主节点,又不成为数据节点,那么可将他作为搜索器,从节点中获取数据,生成搜索结果等</p><p>&nbsp; &nbsp; &nbsp; &nbsp; node.master: false</p><p>&nbsp; &nbsp; &nbsp; &nbsp;node.data: false</p><p>默认情况是两个都是true,如果没几台服务器的话就用默认的就可以了。</p><p>network.host: 192.168.0.1 绑定的ip，设置为0.0.0.0后可以用外网访问</p><p>network.publish_host:&nbsp;192.168.0.1&nbsp;&nbsp;指定elasticsearch节点对外的监听地址,就是外网地址，搭建集群的时候最好指定一下，否则可能集群没办法启动,默认应该是去监听内网地址的</p><p>node.attr.rack: r2&nbsp; 给节点添加额外属性，这个暂时没发现什么用处</p><p>path.data: /path/to/data&nbsp; &nbsp; 数据保存的目录<br>path.logs: /path/to/logs&nbsp; &nbsp; 日志保存的目录</p><p>bootstrap.memory_lock: true&nbsp; 禁止内存交换，最好设置为false，不然非常影响性能，如果因为这个启动的时候报错，可以去修改limits.conf，配置下面有说</p><p>http.port:9200&nbsp; &nbsp; &nbsp;路由地址端口</p><p>transport.tcp.port:9300&nbsp; &nbsp; &nbsp;TCP协议转发地址端口,像java使用这个端口去操作</p><p>注：ES默认的HTTP监听端口是9200，如果当前被占用，则在9200~9300范围内递增；另外TCP的默认监听端口是9300，如果当前被占用，则再9300~9400范围内递增。所以单机少量节点，不配置具体端口的话，也是可以运行的。</p><p>&nbsp;</p><p>discovery.zen.ping.unicast.hosts: [\"192.168.36.130\", \"192.168.36.132:9300\"]&nbsp; &nbsp; &nbsp; 单播的地址，配置集群中其他节点的ip,新加入的节点通过这些ip同步到集群,这里的端口应该使用transport.tcp.port端口</p><p>discovery.zen.minimum_master_nodes: 2&nbsp; &nbsp; &nbsp; &nbsp; master节点是选取出来的,一个集群只能有一个，以上node.master: true配置是说该节点具有被选举的权利，而现在这个配置就是告诉 Elasticsearch 当没有足够 master 候选节点的时候，就不要进行 master 节点选举，等 master 候选节点足够了才进行选举。(因为你是一台台去启动服务器的) 这样是为了防止集群中同时存在两个master,这个数值应该配置为 ( master 候选节点个数 / 2) + 1。所以要高可用的话至少三台以上有被选举权。</p><p>gateway.recover_after_nodes: 2&nbsp; 通俗来说就是等集群有几个节点启动起来了再来选举master，分配分片数据什么的，这里配得不好可能有的问题就是启动的时候可能会多耗点性能</p><p>index.number_of_shards: 5&nbsp; &nbsp; &nbsp; &nbsp;设置索引的分片数,默认为5&nbsp; &nbsp; 分片的意思就是一整个索引文档，分成5个部分去保存</p><p>index.number_of_replicas: 1&nbsp; &nbsp; &nbsp;&nbsp;设置索引的副本数,默认为1&nbsp; 1个副本相当于一个备份<br></p><p>&nbsp;</p><p>配置一下</p><p><br></p><pre><code>vi /etc/security/limits.conf</code></pre><p><br></p><div>添加如下内容:</div><div>&nbsp;* &nbsp;soft nofile 65536</div><div>&nbsp;* hard nofile 131072</div><div>&nbsp;* soft nproc 2048</div><div>&nbsp;* hard nproc 4096</div><div><div>&nbsp;* &nbsp;soft memlock unlimited</div><div>&nbsp;* hard memlock&nbsp;unlimited</div></div><div>再敲个命令</div><p><br></p><pre><code>ulimit -l unlimited</code></pre><p><br></p><p><br></p><p>&nbsp;修改 /etc/sysctl.conf<br></p><div>文件末尾添加 vm.max_map_count=262144</div><div>&nbsp;</div><div>报存后退出</div><p>&nbsp;敲命令</p><p><br></p><pre><code>sysctl -w vm.max_map_count=262144</code></pre><p><br></p><p>一切就绪后启动</p><p>elasticsearch目录下bin中运行&nbsp; ./elasticsearch</p><p>启动的时候发现报错，而且可能一次又一次，一次好几个错，错误这里就不说了，主要都是因为账户权限，内存线程什么引起的，网上的解决方法很多，贴几个链接</p><p>https://blog.csdn.net/gongpulin/article/details/78568595</p><p>https://blog.csdn.net/u013083576/article/details/78499884</p><p>&nbsp;</p><p>单个成功访问ip地址加端口后,端口是http.port端口</p><p><br></p><p>这里如果是用docker而且是自己搭起来并没用官网的那个镜像的话，需要注意两点，一个是修改 /etc/sysctl.conf，docker容器中的系统一般都不存在这个文件，这个可以配置宿主机的配置，容器会继承这个属性，第二点是不限制的memlock,就是 * &nbsp;soft memlock unlimited和 * hard memlock&nbsp;unlimited，这个需要在run一个容器的时候加上参数</p><p>-e \"bootstrap.memory_lock=true\" --ulimit memlock=-1:-1</p><p><br></p><p>一切就绪后启动</p><p>elasticsearch目录下bin中运行&nbsp; ./elasticsearch</p><p>启动的时候发现报错，而且可能一次又一次，一次好几个错，错误这里就不说了，主要都是因为账户权限，内存线程什么引起的，网上的解决方法很多，贴几个链接</p><p>https://blog.csdn.net/gongpulin/article/details/78568595</p><p>https://blog.csdn.net/u013083576/article/details/78499884</p><p><br></p><p><br></p><p>&nbsp;</p><p>单个成功访问ip地址加端口后,端口是http.port端口</p><p><br></p><p><img src=\"http://mybuketshaozeming.oss-cn-shenzhen.aliyuncs.com/myblogs/2018-04-21-12-58-43-5adb35834dfec.png\" style=\"max-width:100%;\"><br></p><p><br></p><p>集群健康查看 ip加端口加上/_cluster/health</p><p><br></p><p>&nbsp;<img src=\"http://mybuketshaozeming.oss-cn-shenzhen.aliyuncs.com/myblogs/2018-04-21-12-59-01-5adb35955861e.png\" style=\"max-width: 100%;\">&nbsp;</p><p><br></p><p><br></p><p>&nbsp;<br></p><p>&nbsp;<br></p><p>&nbsp;<br></p><p><br></p><p><br></p><p>&nbsp;<br></p>', '首先要确保有java8的环境,安装方法如下(centos),环境安装完毕，下载elesticsearch,解压elasticsearch-5.5.2.zip,如果没有unzip这个命令的话可以先运行', '2018-04-21 12:59:41', NULL, 5, '服务器', 0, NULL, 0, 25, 0);
INSERT INTO `articles` VALUES (7, '使用docker搭建laravel记叙', '<p>第一步，先从dockerhub上pull一个docker镜</p><p>&nbsp;1&nbsp;docker pull laraedit/laraedit&nbsp;</p><p>&nbsp;这个docker镜像已经安装了 nginx、laravel和mysql,所以不需要自己再去安装，先创建一个文件夹</p><p>&nbsp;1&nbsp;mkdir&nbsp;/usr/local/laravel&nbsp;</p><p>&nbsp;直接运行一个容器&nbsp;&nbsp;</p><div><pre>docker run -it --name laravel -p 8088:80 -p:3306:3306 -v /usr/local/laravel:/var/www/html/app laraedit/laraedit /bin/bash </pre></div><p>&nbsp;--name&nbsp; laravel容器名字，可以随便改</p><p>&nbsp;-v 主机文件夹:docker文件夹 是将主机文件夹挂载到容器中，现在访问/usr/local/laravel就像访问容器中/var/www/html/app一样</p><p>&nbsp;运行这个命令之后直接进入到了容器中</p><p>&nbsp;按Ctrl+P 然后Ctrl+Q 退出容器 ，再次进入docker exec -it laravel /bin/bash 或者 docker exec -it 容器id&nbsp; /bin/bash</p><p>&nbsp;这个laraedit预先已经将&nbsp;80, 443, 3306, 6379端口开放，但如果别的主机想要使用这个端口访问&nbsp;，还需要用-p 主机端口:docker端口 进行端口映射， 我暴露出了两个端口网站的和mysql的</p><p>&nbsp;因为我想要在自己的电脑上用navicat连接docker的数据库，不过现在我连数据库密码都不知道，首先进入数据库</p><p>&nbsp; &nbsp; &nbsp;</p><div><pre>mysql</pre></div><p>这里不需要用户名密码直接进入</p><p>&nbsp;&nbsp;</p><div><pre>1 use mysql;\n2 \n3 select host,user,authentication_string from user;</pre></div><p>可以看到类似以下</p><p>+-----------+-----------+-------------------------------------------+<br>| host | user | authentication_string |<br>+-----------+-----------+-------------------------------------------+<br>| localhost | root | *81F5E21E35407D884A6CD4A731AEBFB6AF209E1B |<br>| localhost | mysql.sys | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE |<br>| 0.0.0.0 | root | *81F5E21E35407D884A6CD4A731AEBFB6AF209E1B |<br>| 0.0.0.0 | homestead | *14E65567ABDB5135D0CFD9A70B3032C179A49EE7 |<br>| % | homestead | *14E65567ABDB5135D0CFD9A70B3032C179A49EE7 |<br>+-----------+-----------+-------------------------------------------+</p><p>有可以远程访问的root账号，所以直接改</p><div><pre>1 update user set authentication_string =password(\'你的密码\') where user=\'root\'</pre></div><div><pre>1  GRANT ALL PRIVILEGES ON *.* TO \'你的用户名\'@\'%\'IDENTIFIED BY \'你的密码\' WITH GRANT OPTION;\n2 FLUSH PRIVILEGES;</pre></div><p>上面就是添加了远程访问的权限</p><p>这时候就可以直接在自己的电脑上用navicat连接docker中的mysql了</p><p>&nbsp;</p><p>接着去配置docker容器中的nginx</p><p>&nbsp;1&nbsp;vim /etc/nginx/nginx.conf&nbsp;</p><p>配置参照官方文档</p><p>https://laravel-china.org/docs/laravel/5.5/deployment</p><p>具体配置还是根据自己实际环境配置</p><p>配置完成之后将自己的网站laravel根目录下的所有文件全部复制到容器中的app目录下，因为已经做了目录挂载，所以直接复制到主机上 /usr/local/laravel下即可</p><p>然后将laravel的数据库地址更改一下，修改为主机外网ip地址</p><p>最后修改容器中/var/www/html/app的属主</p><p>&nbsp;1&nbsp;chown&nbsp;-R www-data:www-data /var/www/html/app&nbsp;</p><p>&nbsp;</p><p>如果使用了Eloquent ORM框架的话</p><p>再在根目录下运行php&nbsp;artisan&nbsp;&nbsp;migrate，查看数据库中表是不是都成生了。</p><p>现在就可以访问php网站了&nbsp;&nbsp;</p>', '第一步，先从dockerhub上pull一个docker镜，这个docker镜像已经安装了 nginx、laravel和mysql,所以不需要自己再去安装，先创建一个文件夹', '2018-04-21 01:17:54', NULL, 3, '工具', 0, NULL, 0, 16, 0);
INSERT INTO `articles` VALUES (8, 'react native android模拟机调试', '<p>&nbsp;模拟机调试首先要确认你的环境变量的path中是不是有adb的路径，adb一般在android的adk目录下的platform-tools下，android目录默认是在c盘user/administrator(用户默认的话)/appdata/中</p><p>&nbsp; &nbsp; &nbsp; 如果使用的是android studio自带的那个模拟器的话，可以这么玩</p><p>&nbsp; &nbsp; &nbsp;运行&nbsp;</p><p>&nbsp;&nbsp;&nbsp;C:\\Users\\Administrator\\AppData\\Local\\Android\\Sdk\\emulator\\emulator.exe -netdelay none -netspeed full -avd Nexus4_API_27&nbsp;</p><p>&nbsp; &nbsp; 这条命令中确保emulator.exe目录正确，一般在android目录中tools中或者在emulator中，像我这情况两个目录下都有，emulator下可以执行，另外一个不行，原因不详。</p><p>&nbsp; &nbsp; &nbsp;-avd 参数后面的Nexus4_API_27是你的虚拟机的名称，不知道的可以去android studio中看一下。</p><p>&nbsp; &nbsp; 然后就是在项目根目录下运行react-native run-android就可以看到项目在虚拟机上跑起来了</p><p>&nbsp; &nbsp;&nbsp;</p><p>&nbsp; &nbsp; &nbsp; 或者可以使用其他的安卓模拟器，我用的是夜神模拟器，</p><p>&nbsp; &nbsp; &nbsp; 先运行一条命令</p><p>&nbsp; &nbsp; &nbsp;&nbsp;adb connect&nbsp;127.0.0.1:62001&nbsp;</p><p>&nbsp; &nbsp; &nbsp; 之后可以通过</p><p>&nbsp; &nbsp; &nbsp; &nbsp;adb devices&nbsp;查看设备是不是添加上了</p><p>&nbsp; &nbsp; &nbsp; 之后</p><p><br></p><p><img src=\"http://mybuketshaozeming.oss-cn-shenzhen.aliyuncs.com/myblogs/2018-04-21-13-21-43-5adb3ae7599e0.png\" style=\"max-width:100%;\"><br></p><p><br></p><p><br></p><p>&nbsp;然后修改ip，ip地址是你电脑上的ipv4地址，这里可以直接使用ipconfig命令查看到的地址，但是每次开机可能会给你分配不同的ip，可以去固定一下你的ip，去电脑上网络设置里面找到适配器</p><p>修改ipv4的网络，这个看个人情况</p><p><br></p><p><img src=\"http://mybuketshaozeming.oss-cn-shenzhen.aliyuncs.com/myblogs/2018-04-21-13-22-13-5adb3b0500e9b.png\" style=\"max-width:100%;\"><br></p><p><br></p><p><br></p><p><img src=\"http://mybuketshaozeming.oss-cn-shenzhen.aliyuncs.com/myblogs/2018-04-21-13-22-29-5adb3b150ca0c.png\" style=\"max-width:100%;\"><br></p><p><br></p><p>之后项目根目录下运行react-native run-android命令</p><p>可能会报一些错误</p><p>比如unable to load script form assets</p><p>解决办法就是先在项目的android/app/src/mian中创建一个assets目录</p><p>然后根目录下运行</p><p>&nbsp;</p><div><pre> react-native bundle --platform android --dev false --entry-file index.android.js --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res</pre></div><p>&nbsp;</p><p>这里需要注意的是，新版本reactnative 用react-native init创建的项目没有index.android.js ,只有index.js，所以需要把index.android.js 改为index.js运行，否则会出现一系列错误，</p><p>例如出现could not connect to development server错误就可能是这个原因造成的。</p><p>成功后再运行react-native run-android，之前最好把夜神模拟器重启一下。</p><p>网上有些博客说运行adb命令是在夜神模拟器的bin目录下运行，不过如果已经把android目录下sdk下platform-tools路径配置在环境变量中的话，就直接在任何除了夜神模拟器或其他模拟器有adb的目录中运行adb connect命令，不然可能会报错。</p><p>如果想要js远程调试的话，就选择debug js remotely</p><p><br></p><p><img src=\"http://mybuketshaozeming.oss-cn-shenzhen.aliyuncs.com/myblogs/2018-04-21-13-23-03-5adb3b3787c30.png\" style=\"max-width:100%;\"><br></p><p><br></p><p><br></p><p>然后再浏览器输入http://localhost:8081/debugger-ui/(一开始我用ip，但是有跨域问题)</p><p>接着再去上图中选择Reload (之前我一直在浏览器上Ctrl+R,但是一直没效果，找了半天结果发现就是这原因，好气）</p>', '模拟机调试首先要确认你的环境变量的path中是不是有adb的路径，adb一般在android的adk目录下的platform-tools下，android目录默认是在c盘user/administrator(用户默认的话)/appdata/中', '2018-04-21 01:23:18', NULL, 6, '疑难', 0, NULL, 0, 37, 0);
INSERT INTO `articles` VALUES (9, 'Docker之centos 简单安装', '<p>&nbsp;centos6因为系统自带的可执行的应用程序与 docker 包名字发生冲突，所以重新命名 docker 的RPM包名字为&nbsp;<code>docker-io。</code></p><p>&nbsp; &nbsp;首先卸载docker包</p><p>&nbsp; &nbsp;&nbsp;1&nbsp;sudo&nbsp;yum&nbsp;-y remove docker&nbsp;</p><p>&nbsp; &nbsp;然后安装包</p><p>&nbsp;&nbsp;&nbsp;1&nbsp;sudo&nbsp;yum&nbsp;install&nbsp;docker-io&nbsp;</p><p>&nbsp; &nbsp;启动服务</p><p>&nbsp; &nbsp;&nbsp;1&nbsp;sudo&nbsp;service docker start&nbsp;</p><p>&nbsp; &nbsp; 查看docker是否启动</p><p>&nbsp; &nbsp;&nbsp;&nbsp;1&nbsp;docker version&nbsp;</p><p><br></p><p><img src=\"http://mybuketshaozeming.oss-cn-shenzhen.aliyuncs.com/myblogs/2018-04-21-13-27-24-5adb3c3c4d270.png\" style=\"max-width:100%;\"><br></p><p><br></p><p><br></p><p>注：这样安装的docker不是最新的</p><p>&nbsp;</p><p>&nbsp;</p><p>再说一说官方的安装方法</p><p>新的docker就不再叫docker-io而是docker ce或docker ee</p><p>首先你要确保没有旧的安装包</p><div><div><br></div><pre>sudo yum remove docker \\\n                  docker-client \\\n                  docker-client-latest \\\n                  docker-common \\\n                  docker-latest \\\n                  docker-latest-logrotate \\\n                  docker-logrotate \\\n                  docker-selinux \\\n                  docker-engine-selinux \\\n                  docker-engine</pre><div><br></div></div><p>先设置镜像仓库</p><div><pre>sudo yum install -y yum-utils \\\n  device-mapper-persistent-data \\\n  lvm2</pre></div><div><pre></pre><pre>sudo yum-config-manager \\ --add-repo \\ https://download.docker.com/linux/centos/docker-ce.repo</pre></div><p>这里镜像地址可以换成阿里云的</p><p>https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo</p><p>安装并启动</p><div><pre>sudo yum install docker-ce</pre></div><div><pre>sudo systemctl start docker</pre></div>', ' centos6因为系统自带的可执行的应用程序与 docker 包名字发生冲突，所以重新命名 docker 的RPM包名字为 docker-io。  首先卸载docker包， 然后安装包，启动服务', '2018-04-21 01:27:48', NULL, 3, '工具', 0, NULL, 0, 9, 0);
INSERT INTO `articles` VALUES (10, 'java集合基础篇 简单总结', '<p>&nbsp; 昨天晚上看了编程思想4的持有对象，所以把学到看到的一些记记背背的方面给总结一下。</p><p>&nbsp; &nbsp; &nbsp; java的容器主要分为两类，一个是实现了接口Collection的一类，还有一个是实现了Map接口的一类。</p><p>&nbsp; &nbsp; &nbsp; 继承Collction接口的主要有List、Set接口还有Queue。Collection继承了Iterator接口，让实现类可以foreach遍历。</p><p>&nbsp; &nbsp; &nbsp; 继承List接口的主要是ArrayList和LinkedList。</p><p>&nbsp; &nbsp; &nbsp; ArrayList的优势在于随机访问，LinkedList的优势则是更好的插入删除，另外LinkedList还实现了Queue接口，这让LinkedList可以当成一个队列的数据结构使用</p><p>&nbsp; &nbsp; &nbsp; List的方法(参数不写)：</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1、contains() 用来确认List中是不是有某个对象&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(还有containsAll() 方法)</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2、 add()&nbsp; &nbsp;添加一个对象&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;(还有addAll() 方法)</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;3、 get()&nbsp; &nbsp; 根据传入的位置获取一个对象&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4、remove()&nbsp; 用来移除List中某个对象&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;(还有removeAll() 方法)</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;5、indexOf()&nbsp; 返回某个对象在List中的位置</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;6、subList()&nbsp; 截取List集合中的一部分并返回</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;7、sort()&nbsp; &nbsp;对List集合进行排序</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;8、retainAll()&nbsp; &nbsp;计算和传入的Collection集合的交集，返回boolean，交集结果保存在List中</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;9 、set()&nbsp; &nbsp;修改List集合中某个位置上的对象</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;10、isEmpty()&nbsp; 判断List集合是不是空</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;11、clear()&nbsp; &nbsp;清空List集合</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;12、 toArray()&nbsp; &nbsp;根据传入参数生成一个指定类型的数组，不传参默认是Object类型数组</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;13、 size()&nbsp; &nbsp;计算List集合的长度</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;注 ：以上需要比较的操作，对于传入的对象，都是使用传入的对象参数的equals方法和集合中的对象比较</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ListIterator</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Iterator遍历一个集合，只能向前遍历( hasNext(), next() )，而ListIterator可以具备双向索引，不过ListIterator只能作用于List&nbsp; &nbsp;&nbsp;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; LinkedList实现了List的接口，同时又实现了Queue接口</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1、getFirst() element()&nbsp; 两者都是返回列表中的第一个元素，如果是空，抛出异常&nbsp;NoSuchElementException</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2、peek()&nbsp;&nbsp;返回列表中的第一个元素，如果是空，返回null</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 3、removeFirst()&nbsp; 删除列表中的第一个元素，如果是空，抛出异常&nbsp;NoSuchElementException&nbsp; （空参的remove()方法同样）</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 4、poll()&nbsp;删除列表中的第一个元素，如果是空，返回null</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 5、add()&nbsp;&nbsp;addFirst() addLast()&nbsp; &nbsp;向列表头(尾)添加元素</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 6、offer()&nbsp; offerFirst()&nbsp; offerLast()&nbsp;向列表头(尾)添加元素&nbsp; &nbsp;&nbsp;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; offer和add的区别在于操作一个有容量限制的队列，前者失败后返回一个false,后者抛出一个异常</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 除了队列之外，LinkedList同样可以作为Stack栈来使用 (这里的Stack指的是数据结构，不是java中的Stack类，LinkedList和Stack没有继承关系)</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 7、push()&nbsp; 向顶部添加一个对象</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 8、pop()&nbsp; 移除一个顶部对象并返回这个对象</p><p>&nbsp; &nbsp; &nbsp; &nbsp;不同于List集合，Set集合不同存放重复的元素，Set的接口和Collection接口字段方法一样，Set集合的实现主要有HashSet、TreeSet、LinkedHashSet。HashSet使用的是散列、TreeSet使用的是红黑树的数据结构，LinkedHashSet也用散列，还用链表保持位置顺序。因此这三种结构的区别就是HashSet拥有最快的查询速度，有时有序，但不保证一直有序。TreeSet始终处于排序的状态。LinkedHashSet保持元素的插入顺序同时也具有快速的访问能力。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;Collection集合系列还有一个Queue,Queue除了LinkedList的实现之外，还具有一个PriorityQueue的实现。PriorityQueue队列中可以根据一个弹出队列优先顺序的规则来弹出元素。这个规则需要自己定义，方法是比如PriorityQueue集合中存的是Student类, 定义Student类的时候去实现一个Compareble接口,在一个int类型返回值Object参数的compareTo方法中去自定义规则，把传入的Object参数(先转型成Student)和当前Student类的某个字段比较，返回-1说明比当前Student后弹出，返回1先弹出(还有一个0自己体会)<br></p><p>&nbsp; &nbsp; &nbsp; &nbsp; Map接口实现和Set相似，三个实现类HashMap、TreeMap、LinkedHashMap,功能特点也和Set相似。Map和Collection是平行关系，也并没有继承Iterator接口，不过Map可以通过keySet()方法将键转化成Set遍历，或者通过EntrySet()转化成Entry的Set对象遍历</p><p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>', '昨天晚上看了编程思想4的持有对象，所以把学到看到的一些记记背背的方面给总结一下。 java的容器主要分为两类，一个是实现了接口Collection的一类，还有一个是实现了Map接口的一类。', '2018-04-21 01:33:35', NULL, 1, '后台', 0, NULL, 0, 15, 0);

-- ----------------------------
-- Table structure for blogroll
-- ----------------------------
DROP TABLE IF EXISTS `blogroll`;
CREATE TABLE `blogroll`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isdelete` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blogroll
-- ----------------------------
INSERT INTO `blogroll` VALUES (1, ' Spring Cloud中文网', 'https://springcloud.cc/', 0);
INSERT INTO `blogroll` VALUES (2, ' 廖雪峰的官方网站', 'https://www.liaoxuefeng.com/', 0);
INSERT INTO `blogroll` VALUES (3, ' 大桥下的蜗牛博客网站', 'https://blog.lab99.org/', NULL);
INSERT INTO `blogroll` VALUES (4, ' 张鑫旭-鑫空间-鑫生活', 'http://www.zhangxinxu.com/', NULL);
INSERT INTO `blogroll` VALUES (5, '阮一峰的网络日志', 'http://www.ruanyifeng.com', NULL);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `isDelete` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, '后台', 0);
INSERT INTO `categories` VALUES (2, '前端', 0);
INSERT INTO `categories` VALUES (3, '工具', 0);
INSERT INTO `categories` VALUES (4, '微信', 0);
INSERT INTO `categories` VALUES (5, '服务器', 0);
INSERT INTO `categories` VALUES (6, '疑难', 0);

-- ----------------------------
-- Table structure for comment_reply
-- ----------------------------
DROP TABLE IF EXISTS `comment_reply`;
CREATE TABLE `comment_reply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `own_id` int(11) NULL DEFAULT NULL,
  `target_id` int(11) NULL DEFAULT NULL,
  `target_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reply_date` datetime(0) NULL DEFAULT NULL,
  `article_id` int(11) NULL DEFAULT NULL,
  `is_read` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment_reply
-- ----------------------------
INSERT INTO `comment_reply` VALUES (1, 1, 1, NULL, '测试2', '2018-04-25 18:37:28', 4, 0);
INSERT INTO `comment_reply` VALUES (2, 1, 1, NULL, '测试2', '2018-04-25 18:42:45', 4, 0);
INSERT INTO `comment_reply` VALUES (3, 2, 1, NULL, '534', '2018-04-25 18:58:45', 4, 1);
INSERT INTO `comment_reply` VALUES (4, 2, 1, NULL, '萨达', '2018-04-25 19:00:55', 4, 1);
INSERT INTO `comment_reply` VALUES (5, 2, 2, NULL, 'qwq', '2018-05-28 18:14:22', 40, 1);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `commentId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `owner_user_id` int(11) NULL DEFAULT NULL,
  `target_user_id` int(11) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `likeCount` int(11) NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `parent_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `isdelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`commentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (1, 1, NULL, '测试1', NULL, '2018-04-25 18:36:59', 4, NULL, 0);
INSERT INTO `comments` VALUES (2, 2, 1, '测试2', NULL, '2018-04-25 18:37:28', 4, NULL, 0);
INSERT INTO `comments` VALUES (3, 2, 1, '测试2', NULL, '2018-04-25 18:42:45', 4, NULL, 0);
INSERT INTO `comments` VALUES (4, 2, NULL, '阿萨德', NULL, '2018-04-25 18:58:26', 4, NULL, 0);
INSERT INTO `comments` VALUES (5, 2, 1, '534', NULL, '2018-04-25 18:58:45', 4, NULL, 0);
INSERT INTO `comments` VALUES (6, 2, NULL, '32423', NULL, '2018-04-25 18:59:15', 4, NULL, 0);
INSERT INTO `comments` VALUES (7, 2, NULL, '安安', NULL, '2018-04-25 19:00:44', 4, NULL, 0);
INSERT INTO `comments` VALUES (8, 2, 1, '萨达', NULL, '2018-04-25 19:00:55', 4, NULL, 0);
INSERT INTO `comments` VALUES (9, 2, NULL, 'aa', NULL, '2018-05-28 18:14:13', 40, NULL, 0);
INSERT INTO `comments` VALUES (10, 2, 2, 'qwq', NULL, '2018-05-28 18:14:22', 40, NULL, 0);
INSERT INTO `comments` VALUES (11, 2, NULL, '爱上帝啊', NULL, '2018-06-08 09:08:40', 5, NULL, 0);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `migration` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2018_03_29_063139_create_articles_table', 1);
INSERT INTO `migrations` VALUES ('2018_03_29_065023_create_user_auths_table', 1);
INSERT INTO `migrations` VALUES ('2018_03_29_090604_create_categories_table', 1);

-- ----------------------------
-- Table structure for user_auths
-- ----------------------------
DROP TABLE IF EXISTS `user_auths`;
CREATE TABLE `user_auths`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `identity_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `identifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `credential` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `create_at` date NULL DEFAULT NULL,
  `isdelete` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;



SET FOREIGN_KEY_CHECKS = 1;
