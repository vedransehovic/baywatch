document.addEventListener("DOMContentLoaded", ()=>{
var counter = 1;
var limit = 10;
function addInput(){
     if (counter == limit)  {
          alert("You have reached the limit of adding " + counter + " inputs");
     }
     else {
          var newdiv = document.createElement('div');
          newdiv.innerHTML = "Client " + (counter + 1) + 
          
         " <br><label for='production_clients_attributes_"+ (counter + 1) +"_first_name'>First name</label> <input type='text' name='production[clients_attributes]["+ (counter + 1) +"][first_name]' id='production_clients_attributes_"+(counter + 1)+"_first_name' /> <label for='production_clients_attributes_"+(counter + 1)+"_last_name'>Last name</label> <input type='text' name='production[clients_attributes]["+(counter + 1)+"][last_name]' id='production_clients_attributes_"+(counter + 1)+"_last_name' />"
          

          //" <br><input type='text' name='myInputs[]'>";


          document.getElementById("dynamicInput").appendChild(newdiv);
          counter++;
     }
}
document.getElementById("line").addEventListener("click", addInput)
})