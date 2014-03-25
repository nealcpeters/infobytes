define("ace/mode/json",["require","exports","module","pilot/oop","ace/mode/text","ace/tokenizer","ace/mode/json_highlight_rules","ace/mode/matching_brace_outdent","ace/range","ace/mode/behaviour/cstyle"],function(e,t){var n=e("pilot/oop"),o=e("ace/mode/text").Mode,i=e("ace/tokenizer").Tokenizer,r=e("ace/mode/json_highlight_rules").JsonHighlightRules,u=e("ace/mode/matching_brace_outdent").MatchingBraceOutdent,a=(e("ace/range").Range,e("ace/mode/behaviour/cstyle").CstyleBehaviour),c=function(){this.$tokenizer=new i((new r).getRules()),this.$outdent=new u,this.$behaviour=new a};n.inherits(c,o),function(){this.getNextLineIndent=function(e,t,n){{var o=this.$getIndent(t),i=this.$tokenizer.getLineTokens(t,e);i.tokens,i.state}if("start"==e){var r=t.match(/^.*[\{\(\[]\s*$/);r&&(o+=n)}return o},this.checkOutdent=function(e,t,n){return this.$outdent.checkOutdent(t,n)},this.autoOutdent=function(e,t,n){this.$outdent.autoOutdent(t,n)}}.call(c.prototype),t.Mode=c}),define("ace/mode/json_highlight_rules",["require","exports","module","pilot/oop","pilot/lang","ace/mode/text_highlight_rules"],function(e,t){var n=e("pilot/oop"),o=(e("pilot/lang"),e("ace/mode/text_highlight_rules").TextHighlightRules),i=function(){this.$rules={start:[{token:"string",regex:'["](?:(?:\\\\.)|(?:[^"\\\\]))*?["]'},{token:"constant.numeric",regex:"0[xX][0-9a-fA-F]+\\b"},{token:"constant.numeric",regex:"[+-]?\\d+(?:(?:\\.\\d*)?(?:[eE][+-]?\\d+)?)?\\b"},{token:"constant.language.boolean",regex:"(?:true|false)\\b"},{token:"invalid.illegal",regex:"['](?:(?:\\\\.)|(?:[^'\\\\]))*?[']"},{token:"invalid.illegal",regex:"\\/\\/.*$"},{token:"lparen",regex:"[[({]"},{token:"rparen",regex:"[\\])}]"},{token:"text",regex:"\\s+"}]}};n.inherits(i,o),t.JsonHighlightRules=i}),define("ace/mode/matching_brace_outdent",["require","exports","module","ace/range"],function(e,t){var n=e("ace/range").Range,o=function(){};(function(){this.checkOutdent=function(e,t){return/^\s+$/.test(e)?/^\s*\}/.test(t):!1},this.autoOutdent=function(e,t){var o=e.getLine(t),i=o.match(/^(\s*\})/);if(!i)return 0;var r=i[1].length,u=e.findMatchingBracket({row:t,column:r});if(!u||u.row==t)return 0;var a=this.$getIndent(e.getLine(u.row));e.replace(new n(t,0,t,r-1),a)},this.$getIndent=function(e){var t=e.match(/^(\s+)/);return t?t[1]:""}}).call(o.prototype),t.MatchingBraceOutdent=o}),define("ace/mode/behaviour/cstyle",["require","exports","module","pilot/oop","ace/mode/behaviour"],function(e,t){var n=e("pilot/oop"),o=e("ace/mode/behaviour").Behaviour,i=function(){this.add("braces","insertion",function(e,t,n,o,i){if("{"==i){var r=n.getSelectionRange(),u=o.doc.getTextRange(r);return""!==u?{text:"{"+u+"}",selection:!1}:{text:"{}",selection:[1,1]}}if("}"==i){var a=n.getCursorPosition(),c=o.doc.getLine(a.row),s=c.substring(a.column,a.column+1);if("}"==s){var l=o.$findOpeningBracket("}",{column:a.column+1,row:a.row});if(null!==l)return{text:"",selection:[1,1]}}}else if("\n"==i){var a=n.getCursorPosition(),c=o.doc.getLine(a.row),s=c.substring(a.column,a.column+1);if("}"==s){var g=o.findMatchingBracket({row:a.row,column:a.column+1});if(!g)return!1;var d=this.getNextLineIndent(e,c.substring(0,c.length-1),o.getTabString()),h=this.$getIndent(o.doc.getLine(g.row));return{text:"\n"+d+"\n"+h,selection:[1,d.length,1,d.length]}}}return!1}),this.add("braces","deletion",function(e,t,n,o,i){var r=o.doc.getTextRange(i);if(!i.isMultiLine()&&"{"==r){var u=o.doc.getLine(i.start.row),a=u.substring(i.end.column,i.end.column+1);if("}"==a)return i.end.column++,i}return!1}),this.add("parens","insertion",function(e,t,n,o,i){if("("==i){var r=n.getSelectionRange(),u=o.doc.getTextRange(r);return""!==u?{text:"("+u+")",selection:!1}:{text:"()",selection:[1,1]}}if(")"==i){var a=n.getCursorPosition(),c=o.doc.getLine(a.row),s=c.substring(a.column,a.column+1);if(")"==s){var l=o.$findOpeningBracket(")",{column:a.column+1,row:a.row});if(null!==l)return{text:"",selection:[1,1]}}}return!1}),this.add("parens","deletion",function(e,t,n,o,i){var r=o.doc.getTextRange(i);if(!i.isMultiLine()&&"("==r){var u=o.doc.getLine(i.start.row),a=u.substring(i.start.column+1,i.start.column+2);if(")"==a)return i.end.column++,i}return!1}),this.add("string_dquotes","insertion",function(e,t,n,o,i){if('"'==i){var r=n.getSelectionRange(),u=o.doc.getTextRange(r);if(""!==u)return{text:'"'+u+'"',selection:!1};var a=n.getCursorPosition(),c=o.doc.getLine(a.row),s=c.substring(a.column-1,a.column);if("\\"==s)return!1;for(var l,g=o.getTokens(r.start.row,r.start.row)[0].tokens,d=0,h=-1,f=0;f<g.length&&(l=g[f],"string"==l.type?h=-1:0>h&&(h=l.value.indexOf('"')),!(l.value.length+d>r.start.column));f++)d+=g[f].value.length;if(!l||0>h&&"comment"!==l.type&&("string"!==l.type||r.start.column!==l.value.length+d-1&&l.value.lastIndexOf('"')===l.value.length-1))return{text:'""',selection:[1,1]};if(l&&"string"===l.type){var m=c.substring(a.column,a.column+1);if('"'==m)return{text:"",selection:[1,1]}}}return!1}),this.add("string_dquotes","deletion",function(e,t,n,o,i){var r=o.doc.getTextRange(i);if(!i.isMultiLine()&&'"'==r){var u=o.doc.getLine(i.start.row),a=u.substring(i.start.column+1,i.start.column+2);if('"'==a)return i.end.column++,i}return!1})};n.inherits(i,o),t.CstyleBehaviour=i});