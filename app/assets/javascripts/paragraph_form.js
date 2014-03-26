  /**************************************************
  * Paragraph Form Scripts
  ***************************************************/

  /***************************************************
  * Initializing the Paragraph
  ***************************************************/
  
  paragraphInitialize = function() {
    display = document.getElementById('href-display');
    adder = document.getElementById('href-adder');
    link = document.getElementById('link');
    linkText = document.getElementById('linkText');
    editableDiv = document.getElementById('editable-div');
    if (display){
      hideInputs();
    }
  };


  /***************************************************
  * Needed Variables
  ***************************************************/
  
  display = " ";
  adder = " ";
  link = " ";
  linkText = " ";
  editableDiv = " ";

  /***************************************************
  * Display/Hide Link Mini-Form
  ***************************************************/
  
  hideInputs = function() {
    display.style.display = 'inline-block';
    adder.style.display = 'none';
    link.parentNode.style.display = 'none';
    linkText.parentNode.style.display = 'none';
    link.value = "http://";
  };

  showInputs = function() {
    display.style.display = 'none';
    adder.style.display = 'inline-block';
    link.parentNode.style.display = 'inline-block';
    linkText.parentNode.style.display = 'inline-block';
  };

  /***************************************************
  * Adding <a href=""></a> in paragraph editor mode
  ***************************************************/

  // Creates a span to keep track of where the cursor was:
  storePlaceHolder = function() {
    document.execCommand("InsertHTML", false, "<span class='storageHTMLForAnchorTag'></span>");
  };

  // Adds an anchor tag inside the html code (so it is rendered as 
  // linked text in the editable div)
  
  addAnchorTag = function() {
    if (document.getElementsByClassName("storageHTMLForAnchorTag").length > 0){
      var span = document.getElementsByClassName("storageHTMLForAnchorTag")[0];
      span.innerHTML="<a href='" + link.value + "' target='_blank'>" + linkText.value +"</a>";

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
      editableDiv.innerHTML += ("<a href='" + link.value + " target='_blank'>" + linkText.value + "</a>");
    }
    hideInputs();
  };

  // Checks if selected text is inside of a container
  containerNodeCheck = function(node, container) {
    while (node) {
      if (node.id === container) {
        return true;
      }
      node = node.parentNode;
    }
    return false;
  };

  /***************************************************
  * Transferring editableDiv to Hidden Input
  ***************************************************/

  grabInput = function() {
     document.getElementById('paragraph_body').value
     document.getElementById('paragraph_body').value = editableDiv.innerHTML;
   };

  /***************************************************
  * Initializing the Form and Div Upon Load
  ***************************************************/
  
  paragraphInitialize();


