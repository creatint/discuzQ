(window.webpackJsonp=window.webpackJsonp||[]).push([[51],{"1PNB":function(t,a,e){"use strict";e.r(a);var n=e("Id16"),c=e.n(n);for(var s in n)["default"].indexOf(s)<0&&function(t){e.d(a,t,(function(){return n[t]}))}(s);a.default=c.a},Id16:function(t,a,e){"use strict";Object.defineProperty(a,"__esModule",{value:!0});var n=s(e("QbLZ")),c=s(e("WUP+"));function s(t){return t&&t.__esModule?t:{default:t}}e("lpfh"),a.default=(0,n.default)({name:"tencent-cloud-set-view"},c.default)},KVfl:function(t,a,e){"use strict";e.r(a);var n=e("zYKR"),c=e("1PNB");for(var s in c)["default"].indexOf(s)<0&&function(t){e.d(a,t,(function(){return c[t]}))}(s);var o=e("KHd+"),u=Object(o.a)(c.default,n.a,n.b,!1,null,null,null);a.default=u.exports},"WUP+":function(t,a,e){"use strict";Object.defineProperty(a,"__esModule",{value:!0});var n=s(e("4gYi")),c=s(e("pNQN"));function s(t){return t&&t.__esModule?t:{default:t}}a.default={data:function(){return{tableData:[{name:"云API",type:"qcloud_close",description:'配置云API的密钥后，才可使用腾讯云的各项服务和能力，<a href="https://discuz.chat/manual-admin/2.html#_2-7-1-%E4%BA%91api" target="_blank">查看文档</a>',status:"",icon:"iconAPI",setFlag:!0},{name:"图片内容安全",type:"qcloud_cms_image",description:'请先配置云API，开通腾讯云图片内容安全服务，并确保有对应套餐包，<a href="https://discuz.chat/manual-admin/2.html#_2-7-2-%E5%9B%BE%E7%89%87%E5%86%85%E5%AE%B9%E5%AE%89%E5%85%A8" target="_blank">查看文档</a>',status:"",icon:"icontupian",setFlag:!1},{name:"文本内容安全",type:"qcloud_cms_text",description:'请先配置云API，开通腾讯云文本内容安全服务，并确保有对应套餐包，<a href="https://discuz.chat/manual-admin/2.html#_2-7-3-%E6%96%87%E6%9C%AC%E5%86%85%E5%AE%B9%E5%AE%89%E5%85%A8" target="_blank">查看文档</a>',status:"",icon:"iconwenben",setFlag:!1},{name:"短信",type:"qcloud_sms",description:'请先配置云API，开通腾讯云短信服务，并确保腾讯云账户的短信额度充足，<a href="https://discuz.chat/manual-admin/2.html#_2-7-4-%E7%9F%AD%E4%BF%A1" target="_blank">查看文档</a>',status:"",icon:"iconduanxin",setFlag:!0},{name:"实名认证",type:"qcloud_faceid",description:'请先配置云API，开通腾讯云的人脸核身服务，并确保有对应资源包，<a href="https://discuz.chat/manual-admin/2.html#_2-7-5-%E5%AE%9E%E5%90%8D%E8%AE%A4%E8%AF%81" target="_blank">查看文档</a>',status:"",icon:"iconshimingrenzheng",setFlag:!1},{name:"对象存储",type:"qcloud_cos",description:'请先配置云API，开通腾讯云的对象存储服务，并确保有对应资源包，<a href="https://discuz.chat/manual-admin/2.html#_2-7-6-%E5%AF%B9%E8%B1%A1%E5%AD%98%E5%82%A8" target="_blank">查看文档</a>',status:"",icon:"iconduixiangcunchu",setFlag:!0},{name:"云点播",type:"qcloud_vod",description:'请先配置云API，开通腾讯云的云点播VOD服务，并确保有对应资源包，<a href="https://discuz.chat/manual-admin/2.html#_2-7-7-%E8%A7%86%E9%A2%91" target="_blank">查看文档</a>',status:"",icon:"iconshipin",setFlag:!0},{name:"验证码",type:"qcloud_captcha",description:'请先配置云API，开通腾讯云的验证码服务，并确保有对应的资源包，<a href="https://discuz.chat/manual-admin/2.html#_2-7-8-%E9%AA%8C%E8%AF%81%E7%A0%81" target="_blank">查看文档</a>',status:"",icon:"iconyanzhengma",setFlag:!0}]}},created:function(){this.tencentCloudStatus()},methods:{configClick:function(t){switch(t){case"qcloud_close":this.$router.push({path:"/admin/tencent-cloud-config/cloud",query:{type:t}});break;case"qcloud_sms":this.$router.push({path:"/admin/tencent-cloud-config/sms",query:{type:t}});break;case"qcloud_cos":this.$router.push({path:"/admin/tencent-cloud-config/cos",query:{type:t}});break;case"qcloud_vod":this.$router.push({path:"/admin/tencent-cloud-config/vod",query:{type:t}});break;case"qcloud_captcha":this.$router.push({path:"/admin/tencent-cloud-config/code",query:{type:t}});default:this.loginStatus="default"}},tencentCloudStatus:function(){var t=this;this.appFetch({url:"forum",method:"get",data:{}}).then((function(a){a.errors?t.$message.error(a.errors[0].code):(a.readdata._data.qcloud.qcloud_close?t.tableData[0].status=!0:t.tableData[0].status=!1,a.readdata._data.qcloud.qcloud_cms_image?t.tableData[1].status=!0:t.tableData[1].status=!1,a.readdata._data.qcloud.qcloud_cms_text?t.tableData[2].status=!0:t.tableData[2].status=!1,a.readdata._data.qcloud.qcloud_sms?t.tableData[3].status=!0:t.tableData[3].status=!1,a.readdata._data.qcloud.qcloud_faceid?t.tableData[4].status=!0:t.tableData[4].status=!1,a.readdata._data.qcloud.qcloud_cos?t.tableData[5].status=!0:t.tableData[5].status=!1,a.readdata._data.qcloud.qcloud_vod?t.tableData[6].status=!0:t.tableData[6].status=!1,a.readdata._data.qcloud.qcloud_captcha?t.tableData[7].status=!0:t.tableData[7].status=!1)}))},loginSetting:function(t,a,e){var n=this;"qcloud_close"==a?this.changeSettings("qcloud_close",e):"qcloud_cms_image"==a?this.changeSettings("qcloud_cms_image",e):"qcloud_cms_text"==a?this.changeSettings("qcloud_cms_text",e):"qcloud_sms"==a?0==e?this.$confirm("若您在用户角色中设置了发布内容需先绑定手机，关闭短信服务将同时清空该设置。若当前注册模式为手机号模式，将更改为用户名模式。",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then((function(){n.changeSettings("qcloud_sms",e)})):this.changeSettings("qcloud_sms",e):"qcloud_faceid"==a?0==e?this.$confirm("若您在用户角色中设置了发布内容需先实名认证，关闭实名认证服务将同时清空该设置",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then((function(){n.changeSettings("qcloud_faceid",e)})):this.changeSettings("qcloud_faceid",e):"qcloud_cos"==a?this.changeSettings("qcloud_cos",e):"qcloud_vod"==a?this.changeSettings("qcloud_vod",e):"qcloud_captcha"==a&&this.changeSettings("qcloud_captcha",e)},changeSettings:function(t,a){var e=this;this.appFetch({url:"settings",method:"post",data:{data:[{attributes:{key:t,value:a,tag:"qcloud"}}]}}).then((function(t){t.errors?e.$message.error(t.errors[0].code):(e.$message({message:"修改成功",type:"success"}),e.tencentCloudStatus())})).catch((function(t){}))}},components:{Card:n.default,CardRow:c.default}}},zYKR:function(t,a,e){"use strict";e.d(a,"a",(function(){return n})),e.d(a,"b",(function(){return c}));var n=function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("div",[e("div",{staticStyle:{"padding-top":"15PX"}},[e("el-table",{staticStyle:{width:"100%"},attrs:{data:t.tableData}},[e("el-table-column",{attrs:{prop:"date",label:"腾讯云设置"},scopedSlots:t._u([{key:"default",fn:function(a){return[e("div",{staticClass:"pay-set-type-box"},[e("i",{staticClass:"iconfont table-icon",class:a.row.icon}),t._v(" "),e("div",{staticClass:"table-con-box"},[e("p",[t._v(t._s(a.row.name))]),t._v(" "),e("p",[e("span",{domProps:{innerHTML:t._s(a.row.description)}})])])])]}}])}),t._v(" "),e("el-table-column",{attrs:{prop:"name",label:"状态",width:"100",align:"center"},scopedSlots:t._u([{key:"default",fn:function(t){return[t.row.status?e("span",{staticClass:"iconfont iconicon_select"}):e("span",{staticClass:"iconfont iconicon_"})]}}])}),t._v(" "),e("el-table-column",{attrs:{prop:"address",label:"操作",width:"180"},scopedSlots:t._u([{key:"default",fn:function(a){return[a.row.setFlag&&"img"!==a.row.type&&"text"!==a.row.type&&"name"!==a.row.type?e("el-button",{attrs:{size:"mini"},on:{click:function(e){return t.configClick(a.row.type)}}},[t._v("配置")]):t._e(),t._v(" "),a.row.status?e("el-button",{attrs:{size:"mini"},nativeOn:{click:function(e){return e.preventDefault(),t.loginSetting(a.$index,a.row.type,"0")}}},[t._v("关闭")]):e("el-button",{attrs:{size:"mini"},nativeOn:{click:function(e){return e.preventDefault(),t.loginSetting(a.$index,a.row.type,"1")}}},[t._v("开启")])]}}])})],1)],1)])},c=[]}}]);