ace.require("ace/config").set("basePath", '/assets/ace')
var editor = ace.edit("editor");
editor.setTheme("ace/theme/textmate");
editor.session.setMode("ace/mode/ruby");
editor.getSession().setUseWrapMode(true);
editor.setReadOnly(true);

editor.setOptions({
  maxLines: 20,
  minLines: 1,
});