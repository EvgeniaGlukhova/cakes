document.addEventListener("DOMContentLoaded", hiddenCloseclick());
  document.getElementById('section_button').addEventListener("click", hiddenCloseclick);
 function hiddenCloseclick() {
 let x = document.getElementById('block2');
      if (x.style.display == "none"){
   x.style.display = "block";
   } else {
 x.style.display = "none"}
    };


    
 
    