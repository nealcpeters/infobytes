  display = " "  
  adder = " " 
  link = " " 
  linkText = " " 
  editableDiv = " " 

  hideInputs = function() {
    display.style.display = 'inline-block'
    adder.style.display = 'none'
    link.parentNode.style.display = 'none'
    linkText.parentNode.style.display = 'none'
    link.value = "http://"
  }

  showInputs = function() {
    display.style.display = 'none'
    adder.style.display = 'inline-block'
    link.parentNode.style.display = 'inline-block'
    linkText.parentNode.style.display = 'inline-block'
  }

  // Adds an anchor tag inside the html code (so it is rendered as 
  // linked text in the editable div)
  // If there is a span (created by below storePlaceHolder) it finds it, fills it with the anchor tag, then
  // deletes the span.
  addAnchorTag = function() {
    if (document.getElementsByClassName("storageHTMLForAnchorTag").length > 0){
      var span = document.getElementsByClassName("storageHTMLForAnchorTag")[0]
      span.innerHTML="<a href='" + link.value + "'>" + linkText.value +"</a>"
      span.class = "filled"
      
      var spans = document.getElementsByClassName("storageHTMLForAnchorTag");
      while(spans.length) {
        var parent = spans[ 0 ].parentNode;
        while( spans[ 0 ].firstChild ) {
            parent.insertBefore(  spans[ 0 ].firstChild, spans[ 0 ] );
        }
         parent.removeChild( spans[ 0 ] );
      } 
    }
    else{
      // If user cursor was not previously in the editable div, it simply appends at the end
      editableDiv.innerHTML += ("<a href='" + link.value + "'>" + linkText.value +"</a>")
    }
    hideInputs()
  }

  // Checks if selected text is inside of a container
  containerNodeCheck = function(node, container) {
    while (node) {
      if (node.id === container) {
        return true;
      }
      node = node.parentNode;
    }
    return false;
  }

  // Transfers the contents of the div to the hidden input upon hitting submit so that
  // the form will pass the editable div content as a param
  grabInput = function() {
     document.getElementById('paragraph_body').value = editableDiv.innerHTML
   }

  // Creates a span to keep track of where the cursor was:
  storePlaceHolder = function() {
    document.execCommand("InsertHTML", false, "<span class='storageHTMLForAnchorTag'></span>")
  }

  paragraphInitialize = function() {
    display = document.getElementById('href-display')
    adder = document.getElementById('href-adder')
    link = document.getElementById('link')
    linkText = document.getElementById('linkText')
    editableDiv = document.getElementById('editable-div')
    // Sets href input and insert button to hidden at the start
    hideInputs()  
  }
