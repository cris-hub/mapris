 function myFunction() {
            var myVar;
            myVar = setTimeout(showPage, 100);
        }

        function showPage() {

            document.getElementById("loader").style.display = "none";
            document.getElementById("myDiv").style.display = "block";
        }