ace.require("ace/config").set("basePath", '/assets/ace')
var editor = ace.edit("editor");
editor.setTheme("ace/theme/textmate");
editor.session.setMode("ace/mode/ruby");
editor.getSession().setUseWrapMode(true);

editor.focus();

editor.setOptions({
  minLines: 10,
});

updateLanguage = function() {  
  var newLanguage = document.getElementById('language').value
  editor.session.setMode("ace/mode/" + newLanguage);
}

storeInfo = function() {  
  document.getElementById('input_value').value = editor.getValue()
}