function searchStore(){
    // Declare variables 
    var input, filter, table, tr, td, i;
    input = document.getElementById("searchbar");
    filter = input.value.toLowerCase();
    table = document.getElementById("table_id");
    tr = table.getElementsByTagName("tr");

    // Loop through all table rows, and hide those who don't match the search query
    for (i = 0; i < tr.length; i++) {
      td = tr[i].getElementsByTagName("td") ; 
      for(j=0 ; j<td.length ; j++)
      {
        let tdata = td[j] ;
        if (tdata) {
          if (tdata.innerHTML.toLowerCase().indexOf(filter) > -1) {
            tr[i].style.display = "";
            break ; 
          } else {
            tr[i].style.display = "none";
          }
        } 
      }
    }
  }
  function TestsFunction() {
    var T = document.getElementById("TestsDiv"),
        displayValue = "";
    if (T.style.display == "")
        displayValue = "none";

    T.style.display = displayValue;
}
function TestFunction() {
  var M = document.getElementById("TestDiv"),
      displayValue = "";
  if (M.style.display == "")
      displayValue = "none";

  M.style.display = displayValue;
}
//  document.querySelector('.dropbtn').on('click', function(e) {
//   e.stopPropagation();
// });
function dropdown()
{
  var D=document.getElementById("report")
  D.on('click', function(e) {
    e.stopPropagation();})
}

