(window.webpackJsonp=window.webpackJsonp||[]).push([[28],{CD7n:function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var i=r(a("QbLZ"));a("lL+3");var s=r(a("LhYQ"));function r(e){return e&&e.__esModule?e:{default:e}}t.default=(0,i.default)({name:"cont-review-view"},s.default)},CKnL:function(e,t,a){"use strict";a.r(t);var i=a("i7/w"),s=a.n(i);const r=s.a.prototype.$isServer,n=(r||Number(document.documentMode),!r&&document.addEventListener?function(e,t,a){e&&t&&a&&e.addEventListener(t,a,!1)}:function(e,t,a){e&&t&&a&&e.attachEvent("on"+t,a)}),o=!r&&document.removeEventListener?function(e,t,a){e&&t&&e.removeEventListener(t,a,!1)}:function(e,t,a){e&&t&&e.detachEvent("on"+t,a)};Object.prototype.hasOwnProperty;function l(e){let t=!1;return function(...a){t||(t=!0,window.requestAnimationFrame(i=>{e.apply(this,a),t=!1}))}}const c={CONTAIN:{name:"contain",icon:"el-icon-full-screen"},ORIGINAL:{name:"original",icon:"el-icon-c-scale-to-original"}},u=!s.a.prototype.$isServer&&window.navigator.userAgent.match(/firefox/i)?"DOMMouseScroll":"mousewheel";var d={name:"elImageViewer",props:{urlList:{type:Array,default:()=>[]},zIndex:{type:Number,default:2e3},onSwitch:{type:Function,default:()=>{}},onClose:{type:Function,default:()=>{}},initialIndex:{type:Number,default:0}},data(){return{index:this.initialIndex,isShow:!1,infinite:!0,loading:!1,mode:c.CONTAIN,transform:{scale:1,deg:0,offsetX:0,offsetY:0,enableTransition:!1}}},computed:{isSingle(){return this.urlList.length<=1},isFirst(){return 0===this.index},isLast(){return this.index===this.urlList.length-1},currentImg(){return this.urlList[this.index]},imgStyle(){const{scale:e,deg:t,offsetX:a,offsetY:i,enableTransition:s}=this.transform,r={transform:`scale(${e}) rotate(${t}deg)`,transition:s?"transform .3s":"","margin-left":a+"px","margin-top":i+"px"};return this.mode===c.CONTAIN&&(r.maxWidth=r.maxHeight="100%"),r}},watch:{index:{handler:function(e){this.reset(),this.onSwitch(e)}},currentImg(e){this.$nextTick(e=>{this.$refs.img[0].complete||(this.loading=!0)})}},methods:{hide(){this.deviceSupportUninstall(),this.onClose()},deviceSupportInstall(){this._keyDownHandler=l(e=>{switch(e.keyCode){case 27:this.hide();break;case 32:this.toggleMode();break;case 37:this.prev();break;case 38:this.handleActions("zoomIn");break;case 39:this.next();break;case 40:this.handleActions("zoomOut")}}),this._mouseWheelHandler=l(e=>{(e.wheelDelta?e.wheelDelta:-e.detail)>0?this.handleActions("zoomIn",{zoomRate:.015,enableTransition:!1}):this.handleActions("zoomOut",{zoomRate:.015,enableTransition:!1})}),n(document,"keydown",this._keyDownHandler),n(document,u,this._mouseWheelHandler)},deviceSupportUninstall(){o(document,"keydown",this._keyDownHandler),o(document,u,this._mouseWheelHandler),this._keyDownHandler=null,this._mouseWheelHandler=null},handleImgLoad(e){this.loading=!1},handleImgError(e){this.loading=!1,e.target.alt="加载失败"},handleMouseDown(e){if(this.loading||0!==e.button)return;const{offsetX:t,offsetY:a}=this.transform,i=e.pageX,s=e.pageY;this._dragHandler=l(e=>{this.transform.offsetX=t+e.pageX-i,this.transform.offsetY=a+e.pageY-s}),n(document,"mousemove",this._dragHandler),n(document,"mouseup",e=>{o(document,"mousemove",this._dragHandler)}),e.preventDefault()},reset(){this.transform={scale:1,deg:0,offsetX:0,offsetY:0,enableTransition:!1}},toggleMode(){if(this.loading)return;const e=Object.keys(c),t=(Object.values(c).indexOf(this.mode)+1)%e.length;this.mode=c[e[t]],this.reset()},prev(){if(this.isFirst&&!this.infinite)return;const e=this.urlList.length;this.index=(this.index-1+e)%e},next(){if(this.isLast&&!this.infinite)return;const e=this.urlList.length;this.index=(this.index+1)%e},handleActions(e,t={}){if(this.loading)return;const{zoomRate:a,rotateDeg:i,enableTransition:s}={zoomRate:.2,rotateDeg:90,enableTransition:!0,...t},{transform:r}=this;switch(e){case"zoomOut":r.scale>.2&&(r.scale=parseFloat((r.scale-a).toFixed(3)));break;case"zoomIn":r.scale=parseFloat((r.scale+a).toFixed(3));break;case"clocelise":r.deg+=i;break;case"anticlocelise":r.deg-=i}r.enableTransition=s}},mounted(){this.deviceSupportInstall(),this.$refs["el-image-viewer__wrapper"].focus()}},h=a("KHd+"),m=Object(h.a)(d,(function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("transition",{attrs:{name:"viewer-fade"}},[a("div",{ref:"el-image-viewer__wrapper",staticClass:"el-image-viewer__wrapper",style:{"z-index":e.zIndex},attrs:{tabindex:"-1"}},[a("div",{staticClass:"el-image-viewer__mask"}),e._v(" "),a("span",{staticClass:"el-image-viewer__btn el-image-viewer__close",on:{click:e.hide}},[a("i",{staticClass:"el-icon-circle-close"})]),e._v(" "),e.isSingle?e._e():[a("span",{staticClass:"el-image-viewer__btn el-image-viewer__prev",class:{"is-disabled":!e.infinite&&e.isFirst},on:{click:e.prev}},[a("i",{staticClass:"el-icon-arrow-left"})]),e._v(" "),a("span",{staticClass:"el-image-viewer__btn el-image-viewer__next",class:{"is-disabled":!e.infinite&&e.isLast},on:{click:e.next}},[a("i",{staticClass:"el-icon-arrow-right"})])],e._v(" "),a("div",{staticClass:"el-image-viewer__btn el-image-viewer__actions"},[a("div",{staticClass:"el-image-viewer__actions__inner"},[a("i",{staticClass:"el-icon-zoom-out",on:{click:function(t){return e.handleActions("zoomOut")}}}),e._v(" "),a("i",{staticClass:"el-icon-zoom-in",on:{click:function(t){return e.handleActions("zoomIn")}}}),e._v(" "),a("i",{staticClass:"el-image-viewer__actions__divider"}),e._v(" "),a("i",{class:e.mode.icon,on:{click:e.toggleMode}}),e._v(" "),a("i",{staticClass:"el-image-viewer__actions__divider"}),e._v(" "),a("i",{staticClass:"el-icon-refresh-left",on:{click:function(t){return e.handleActions("anticlocelise")}}}),e._v(" "),a("i",{staticClass:"el-icon-refresh-right",on:{click:function(t){return e.handleActions("clocelise")}}})])]),e._v(" "),a("div",{staticClass:"el-image-viewer__canvas"},e._l(e.urlList,(function(t,i){return i===e.index?a("img",{key:t,ref:"img",refInFor:!0,staticClass:"el-image-viewer__img",style:e.imgStyle,attrs:{src:e.currentImg},on:{load:e.handleImgLoad,error:e.handleImgError,mousedown:e.handleMouseDown}}):e._e()})),0)],2)])}),[],!1,null,null,null);t.default=m.exports},FMY7:function(e,t,a){"use strict";a.d(t,"a",(function(){return i})),a.d(t,"b",(function(){return s}));var i=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{staticClass:"cont-review-box"},[a("div",{staticClass:"cont-review-header"},[a("div",{staticClass:"cont-review-header__lf"},[a("div",[a("span",{staticClass:"cont-review-header__lf-title"},[e._v("用户名：")]),e._v(" "),a("el-input",{attrs:{size:"medium",placeholder:"搜索用户名",clearable:""},model:{value:e.searchUserName,callback:function(t){e.searchUserName=t},expression:"searchUserName"}})],1),e._v(" "),a("div",[a("span",{staticClass:"cont-review-header__lf-title"},[e._v("每页显示：")]),e._v(" "),a("el-select",{attrs:{size:"medium",placeholder:"选择每页显示"},model:{value:e.pageSelect,callback:function(t){e.pageSelect=t},expression:"pageSelect"}},e._l(e.pageOptions,(function(e){return a("el-option",{key:e.value,attrs:{label:e.label,value:e.value}})})),1)],1)]),e._v(" "),a("div",{staticClass:"cont-review-header__rt"},[a("div",[a("span",{staticClass:"cont-review-header__lf-title"},[e._v("内容包含：")]),e._v(" "),a("el-input",{staticClass:"content-contains-input",attrs:{size:"medium",clearable:"",placeholder:"搜索关键词"},model:{value:e.keyWords,callback:function(t){e.keyWords=t},expression:"keyWords"}}),e._v(" "),a("el-checkbox",{model:{value:e.showSensitiveWords,callback:function(t){e.showSensitiveWords=t},expression:"showSensitiveWords"}},[e._v("显示敏感词")])],1),e._v(" "),a("div",{staticClass:"cont-review-header__rt-search"},[a("span",{staticClass:"cont-review-header__lf-title"},[e._v("搜索范围：")]),e._v(" "),a("el-select",{attrs:{size:"medium",placeholder:"选择审核状态"},model:{value:e.searchReviewSelect,callback:function(t){e.searchReviewSelect=t},expression:"searchReviewSelect"}},e._l(e.searchReview,(function(e){return a("el-option",{key:e.value,attrs:{label:e.label,value:e.value}})})),1),e._v(" "),a("el-select",{attrs:{size:"medium",clearable:"",placeholder:"选择搜索分类"},model:{value:e.categoriesListSelect,callback:function(t){e.categoriesListSelect=t},expression:"categoriesListSelect"}},e._l(e.categoriesList,(function(e){return a("el-option",{key:e.id,attrs:{label:e.name,value:e.id}})})),1),e._v(" "),a("el-select",{attrs:{size:"medium",placeholder:"选择搜索时间"},on:{change:e.searchTimeChange},model:{value:e.searchTimeSelect,callback:function(t){e.searchTimeSelect=t},expression:"searchTimeSelect"}},e._l(e.searchTime,(function(e){return a("el-option",{key:e.value,attrs:{label:e.label,value:e.value}})})),1),e._v(" "),a("el-button",{attrs:{size:"small",type:"primary"},on:{click:e.themeSearch}},[e._v("搜索")])],1)])]),e._v(" "),a("div",{staticClass:"cont-review-table"},[e._l(e.themeList,(function(t,i){return a("ContArrange",{key:t._data.id,attrs:{author:t.user?t.user._data.username:"该用户被删除",theme:t.category._data.name,prply:t._data.postCount-1,browse:t._data.viewCount,last:t.lastPostedUser?t.lastPostedUser._data.username:"该用户被删除",finalPost:e.formatDate(t._data.updatedAt),userId:t.user?t.user._data.id:"该用户被删除"}},[a("div",{staticClass:"cont-review-table__side",attrs:{slot:"side"},slot:"side"},[a("el-radio-group",{on:{change:function(t){return e.radioChange(t,i)}},model:{value:e.submitForm[i].radio,callback:function(t){e.$set(e.submitForm[i],"radio",t)},expression:"submitForm[index].radio"}},[a("el-radio",{attrs:{label:0,disabled:t.threadVideo&&0==t.threadVideo._data.status||t.threadVideo&&2==t.threadVideo._data.status}},[e._v("通过")]),e._v(" "),a("el-radio",{attrs:{label:1}},[e._v("删除")]),e._v(" "),2!==t._data.isApproved?a("el-radio",{attrs:{label:2,disabled:2===t._data.isApproved}},[e._v("忽略")]):e._e()],1)],1),e._v(" "),1===t._data.type?a("a",{staticClass:"cont-review-table__long-text",attrs:{slot:"longText",href:"/topic/index?id="+t._data.id},slot:"longText"},[e._v("\n        "+e._s(t._data.title)+"\n        "),a("span",{staticClass:"iconfont",class:parseInt(t._data.price)>0?"iconmoney":"iconchangwen"})]):e._e(),e._v(" "),a("div",{staticClass:"cont-review-table__main",attrs:{slot:"main"},slot:"main"},[a("a",{staticClass:"cont-review-table__main__cont-text",style:{display:t.threadVideo?"inline":"block"},attrs:{href:"/topic/index?id="+t._data.id,target:"_blank"},domProps:{innerHTML:e._s(t.firstPost&&t.firstPost._data.contentHtml)}}),e._v(" "),t.threadVideo?a("span",{staticClass:"iconfont iconvideo"}):e._e(),e._v(" "),a("div",{staticClass:"cont-review-table__main__cont-imgs"},e._l(t.firstPost&&t.firstPost.images,(function(i,s){return a("p",{key:s,staticClass:"cont-review-table__main__cont-imgs-p"},[a("img",{directives:[{name:"lazy",rawName:"v-lazy",value:i._data.thumbUrl,expression:"item._data.thumbUrl"}],attrs:{alt:i._data.fileName},on:{click:function(a){return e.imgShowClick(t.firstPost&&t.firstPost.images,s)}}})])})),0),e._v(" "),a("div",{directives:[{name:"show",rawName:"v-show",value:t.firstPost&&t.firstPost.attachments.length>0,expression:"items.firstPost && items.firstPost.attachments.length > 0"}],staticClass:"cont-review-table__main__cont-annex"},[a("span",[e._v("附件：")]),e._v(" "),e._l(t.firstPost&&t.firstPost.attachments,(function(t,i){return a("p",{key:i},[a("a",{attrs:{href:t._data.url,target:"_blank"}},[e._v(e._s(t._data.fileName))])])}))],2)]),e._v(" "),a("div",{staticClass:"cont-review-table__footer",attrs:{slot:"footer"},slot:"footer"},[t.threadVideo?a("div",{staticClass:"cont-review-table__footer__lf"},[0==t.threadVideo._data.status||2==t.threadVideo._data.status?a("el-button",{class:{graybtn:0==t.threadVideo._data.status||2==t.threadVideo._data.status},attrs:{type:"text"}},[e._v("通过")]):a("el-button",{attrs:{type:"text"},on:{click:function(a){return e.singleOperationSubmit(1,t.category._data.id,t._data.id,i)}}},[e._v("通过")]),e._v(" "),a("i"),e._v(" "),a("el-popover",{ref:"popover-"+i,refInFor:!0,attrs:{width:"100",placement:"top"}},[a("p",[e._v("确定删除该项吗？")]),e._v(" "),a("div",{staticStyle:{"text-align":"right",margin:"10PX 0 0 0"}},[a("el-button",{attrs:{type:"danger",size:"mini"},on:{click:function(t){return e.closeDelet("popover-"+i)}}},[e._v("\n                取消\n              ")]),e._v(" "),a("el-button",{attrs:{type:"primary",size:"mini"},on:{click:function(a){e.singleOperationSubmit(2,t.category._data.id,t._data.id,i),e.closeDelet("popover-"+i)}}},[e._v("确定")])],1),e._v(" "),a("el-button",{attrs:{slot:"reference",type:"text"},slot:"reference"},[e._v("删除")])],1),e._v(" "),a("i"),e._v(" "),2!==t._data.isApproved?a("el-button",{attrs:{type:"text"},on:{click:function(a){return e.singleOperationSubmit(3,t.category._data.id,t._data.id,i)}}},[e._v("忽略")]):e._e()],1):a("div",{staticClass:"cont-review-table__footer__lf"},[a("el-button",{attrs:{type:"text"},on:{click:function(a){return e.singleOperationSubmit(1,t.category._data.id,t._data.id,i)}}},[e._v("通过")]),e._v(" "),a("i"),e._v(" "),a("el-popover",{ref:"popover-"+i,refInFor:!0,attrs:{width:"100",placement:"top"}},[a("p",[e._v("确定删除该项吗？")]),e._v(" "),a("div",{staticStyle:{"text-align":"right",margin:"10PX 0 0 0"}},[a("el-button",{attrs:{type:"danger",size:"mini"},on:{click:function(t){return e.closeDelet("popover-"+i)}}},[e._v("\n                取消\n              ")]),e._v(" "),a("el-button",{attrs:{type:"primary",size:"mini"},on:{click:function(a){e.singleOperationSubmit(2,t.category._data.id,t._data.id,i),e.closeDelet("popover-"+i)}}},[e._v("确定")])],1),e._v(" "),a("el-button",{attrs:{slot:"reference",type:"text"},slot:"reference"},[e._v("删除")])],1),e._v(" "),a("i"),e._v(" "),2!==t._data.isApproved?a("el-button",{attrs:{type:"text"},on:{click:function(a){return e.singleOperationSubmit(3,t.category._data.id,t._data.id,i)}}},[e._v("忽略")]):e._e()],1),e._v(" "),a("div",{staticClass:"cont-review-table__footer__rt"},[a("span",[e._v("操作理由：")]),e._v(" "),a("el-input",{attrs:{size:"medium",clearable:""},model:{value:e.submitForm[i].attributes.message,callback:function(t){e.$set(e.submitForm[i].attributes,"message",t)},expression:"submitForm[index].attributes.message"}}),e._v(" "),a("el-select",{attrs:{size:"medium",placeholder:"选择操作理由"},on:{change:function(t){return e.reasonForOperationChange(t,i)}},model:{value:e.submitForm[i].Select,callback:function(t){e.$set(e.submitForm[i],"Select",t)},expression:"submitForm[index].Select"}},e._l(e.reasonForOperation,(function(e){return a("el-option",{key:e.value,attrs:{label:e.label,value:e.value}})})),1)],1),e._v(" "),a("div",{staticClass:"cont-review-table__footer__bottom"},[t.threadVideo&&0==t.threadVideo._data.status?a("el-button",{staticClass:"transcoding_status",attrs:{type:"text"}},[e._v("转码中")]):e._e(),e._v(" "),t.threadVideo&&2==t.threadVideo._data.status?a("el-button",{staticClass:"transcoding_status",attrs:{type:"text"}},[e._v("转码失败")]):e._e(),e._v(" "),a("el-button",{attrs:{type:"text"},on:{click:function(a){return e.viewClick(t._data.id)}}},[e._v("查看")]),e._v(" "),a("el-button",{attrs:{type:"text"},on:{click:function(a){return e.editClick(t._data.id,t._data.type)}}},[e._v("编辑")])],1)])])})),e._v(" "),e.showViewer?a("el-image-viewer",{attrs:{"on-close":e.closeViewer,"url-list":e.url}}):e._e(),e._v(" "),a("tableNoList",{directives:[{name:"show",rawName:"v-show",value:e.themeList.length<1,expression:"themeList.length < 1"}]}),e._v(" "),e.pageCount>1?a("Page",{attrs:{"current-page":e.currentPaga,"page-size":10,total:e.total},on:{"current-change":e.handleCurrentChange}}):e._e()],2),e._v(" "),a("div",{staticClass:"cont-review-footer footer-btn"},[a("el-button",{attrs:{size:"small",type:"primary",loading:e.subLoading},on:{click:e.submitClick}},[e._v("提交")]),e._v(" "),a("el-button",{attrs:{type:"text",loading:1===e.btnLoading},on:{click:function(t){return e.allOperationsSubmit(1)}}},[e._v("全部通过")]),e._v(" "),a("el-popover",{attrs:{width:"100",placement:"top"},model:{value:e.visible,callback:function(t){e.visible=t},expression:"visible"}},[a("p",[e._v("确定删除该项吗？")]),e._v(" "),a("div",{staticStyle:{"text-align":"right",margin:"10PX 0 0 0"}},[a("el-button",{attrs:{type:"danger",size:"mini"},on:{click:function(t){e.visible=!1}}},[e._v("\n                取消\n              ")]),e._v(" "),a("el-button",{attrs:{type:"primary",size:"mini"},on:{click:function(t){e.allOperationsSubmit(2),e.visible=!1}}},[e._v("确定")])],1),e._v(" "),a("el-button",{attrs:{slot:"reference",type:"text",loading:2===e.btnLoading},slot:"reference"},[e._v("全部删除")])],1),e._v(" "),a("el-button",{directives:[{name:"show",rawName:"v-show",value:e.ignoreStatus,expression:"ignoreStatus"}],attrs:{type:"text",loading:3===e.btnLoading},on:{click:function(t){return e.allOperationsSubmit(3)}}},[e._v("全部忽略")])],1)])},s=[]},LhYQ:function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var i=c(a("4gYi")),s=c(a("Dt3C")),r=c(a("rWG0")),n=c(a("7qpD")),o=c(a("VVfg")),l=c(a("CKnL"));function c(e){return e&&e.__esModule?e:{default:e}}t.default={data:function(){return{searchUserName:"",keyWords:"",showSensitiveWords:!1,pageOptions:[{value:10,label:"每页显示10条"},{value:20,label:"每页显示20条"},{value:30,label:"每页显示30条"}],pageSelect:10,searchReview:[{value:0,label:"未审核"},{value:2,label:"已忽略"}],searchReviewSelect:0,categoriesList:[],categoriesListSelect:"",searchTime:[{value:1,label:"全部"},{value:2,label:"最近一周"},{value:3,label:"最近一个月"},{value:4,label:"最近三个月"}],searchTimeSelect:1,relativeTime:["",""],submitForm:[],reasonForOperation:[{value:"无",label:"无"},{value:"广告/SPAM",label:"广告/SPAM"},{value:"恶意灌水",label:"恶意灌水"},{value:"违规内容",label:"违规内容"},{value:"文不对题",label:"文不对题"},{value:"重复发帖",label:"重复发帖"},{value:"我很赞同",label:"我很赞同"},{value:"精品文章",label:"精品文章"},{value:"原创内容",label:"原创内容"},{value:"其他",label:"其他"}],reasonForOperationSelect:1,appleAll:!1,themeList:[],currentPaga:1,total:0,pageCount:1,ignoreStatus:!0,showViewer:!1,url:[],subLoading:!1,btnLoading:0,visible:!1}},methods:{closeDelet:function(e){this.$refs[e][0].doClose()},imgShowClick:function(e,t){var a=this;this.url=[];var i=[];e.forEach((function(e){i.push(e._data.url)})),this.url.push(i[t]),i.forEach((function(e,i){i>t&&a.url.push(e)})),i.forEach((function(e,i){i<t&&a.url.push(e)})),this.showViewer=!0},closeViewer:function(){this.showViewer=!1},reasonForOperationChange:function(e,t){this.submitForm[t].attributes.message=e},handleCurrentChange:function(e){document.getElementsByClassName("index-main-con__main")[0].scrollTop=0,this.isIndeterminate=!1,this.checkAll=!1,this.currentPaga=e,this.getThemeList(e)},themeSearch:function(){this.ignoreStatus=2!==this.searchReviewSelect,this.currentPaga=1,this.getThemeList()},searchTimeChange:function(e){var t=new Date,a=new Date;switch(this.relativeTime=[],e){case 1:this.relativeTime.push("","");break;case 2:a.setTime(a.getTime()-6048e5),this.relativeTime.push(this.formatDate(t),this.formatDate(a));break;case 3:a.setTime(a.getTime()-2592e6),this.relativeTime.push(this.formatDate(t),this.formatDate(a));break;case 4:a.setTime(a.getTime()-7776e6),this.relativeTime.push(this.formatDate(t),this.formatDate(a));break;default:this.$message.error("搜索日期选择错误，请重新选择！或 刷新页面（F5）")}},submitClick:function(){this.subLoading=!0,this.patchThreadsBatch(this.submitForm)},radioChange:function(e,t){switch(e){case 0:this.submitForm[t].attributes.isApproved=1;break;case 1:this.submitForm[t].attributes.isDeleted=!0;break;case 2:this.submitForm[t].attributes.isApproved=2}},allOperationsSubmit:function(e){var t=this;switch(this.btnLoading=e,e){case 1:this.submitForm.forEach((function(e,a){t.submitForm[a].attributes.isApproved=1}));break;case 2:this.submitForm.forEach((function(e,a){t.submitForm[a].attributes.isDeleted=!0}));break;case 3:this.submitForm.forEach((function(e,a){t.submitForm[a].attributes.isApproved=2}))}this.patchThreadsBatch(this.submitForm)},singleOperationSubmit:function(e,t,a,i){var s={type:"threads",attributes:{},relationships:{category:{data:{type:"categories",id:t}}}};switch(e){case 1:s.attributes.isApproved=1,s.attributes.message=this.submitForm[i].attributes.message,this.patchThreads(s,a);break;case 2:s.attributes.isDeleted=!0,s.attributes.message=this.submitForm[i].attributes.message,this.patchThreads(s,a);break;case 3:s.attributes.isApproved=2,s.attributes.message=this.submitForm[i].attributes.message,this.patchThreads(s,a)}},viewClick:function(e){var t=this.$router.resolve({path:"/topic/index?id="+e});window.open(t.href,"_blank")},editClick:function(e,t){var a=this.$router.resolve({path:"/thread/post?type="+t+"&operating=edit&threadId="+e});window.open(a.href,"_blank")},formatDate:function(e){return this.$dayjs(e).format("YYYY-MM-DD HH:mm")},getThemeList:function(e){var t=this;this.appFetch({url:"threads",method:"get",data:{include:["user","firstPost","lastPostedUser","category","firstPost.images","firstPost.attachments","threadVideo"],"filter[isDeleted]":"no","filter[username]":this.searchUserName,"page[number]":e,"page[size]":this.pageSelect,"filter[q]":this.keyWords,"filter[isApproved]":this.searchReviewSelect,"filter[createdAtBegin]":this.relativeTime[1],"filter[createdAtEnd]":this.relativeTime[0],"filter[categoryId]":this.categoriesListSelect,"filter[highlight]":this.showSensitiveWords?"yes":"no",sort:"-updatedAt"}}).then((function(e){e.errors?t.$message.error(e.errors[0].code):(t.themeList=[],t.submitForm=[],t.themeList=e.readdata,t.total=e.meta.threadCount,t.pageCount=e.meta.pageCount,t.themeList.forEach((function(e,a){t.submitForm.push({Select:"无",radio:"",type:"threads",id:e._data.id,attributes:{isApproved:0,isDeleted:!1,message:""},relationships:{category:{data:{type:"categories",id:e.category._data.id}}}})})))})).catch((function(e){}))},getCategories:function(){var e=this;this.appFetch({url:"categories",method:"get",data:{}}).then((function(t){t.errors?e.$message.error(t.errors[0].code):(e.categoriesList=[],t.data.forEach((function(t,a){e.categoriesList.push({name:t.attributes.name,id:t.id})})))})).catch((function(e){}))},patchThreadsBatch:function(e){var t=this;this.appFetch({url:"threadsBatch",method:"patch",data:{data:e}}).then((function(e){t.subLoading=!1,t.btnLoading=0,e.errors?t.$message.error(e.errors[0].code):e.meta&&e.data?t.$message.error("操作失败！"):(t.getThemeList(Number(o.default.getLItem("currentPag"))||1),t.$message({message:"操作成功",type:"success"}))})).catch((function(e){}))},patchThreads:function(e,t){var a=this;this.appFetch({url:"threads",method:"patch",splice:"/"+t,data:{data:e}}).then((function(e){a.subLoading=!1,a.btnLoading=0,e.errors?a.$message.error(e.errors[0].code):e.meta&&e.data?(a.checkedTheme=[],a.$message.error("操作失败！")):(a.getThemeList(Number(o.default.getLItem("currentPag"))||1),a.$message({message:"操作成功",type:"success"}))})).catch((function(e){}))},getCreated:function(e){e?this.getThemeList(1):this.getThemeList(Number(o.default.getLItem("currentPag"))||1)}},created:function(){this.getCategories()},beforeRouteEnter:function(e,t,a){a((function(a){e.name!==t.name&&null!==t.name?a.getCreated(!0):a.getCreated(!1)}))},components:{Card:i.default,ContArrange:s.default,Page:r.default,tableNoList:n.default,ElImageViewer:l.default}}},Oi5V:function(e,t,a){"use strict";a.r(t);var i=a("FMY7"),s=a("fHKr");for(var r in s)["default"].indexOf(r)<0&&function(e){a.d(t,e,(function(){return s[e]}))}(r);var n=a("KHd+"),o=Object(n.a)(s.default,i.a,i.b,!1,null,null,null);t.default=o.exports},fHKr:function(e,t,a){"use strict";a.r(t);var i=a("CD7n"),s=a.n(i);for(var r in i)["default"].indexOf(r)<0&&function(e){a.d(t,e,(function(){return i[e]}))}(r);t.default=s.a}}]);