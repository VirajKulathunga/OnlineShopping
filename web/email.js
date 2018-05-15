   function dayList() {
   var cdl="<select name='Day'>"
   cdl+="<option selected value='null'>Day</option>";
   for(day=1;day<32;day++)
   cdl+="<option value='"+day+"'>"+day+"</option>";
   cdl+="</select>";
   return (cdl);
   }
   function yearList() {
   var cyl="<select name='Year'>";
   cyl+="<option selected value='null'>Year</option>";  
   for(year=1900;year<2005;year++)
   cyl+="<option value='"+year+"'>"+year+"</option>";
   cyl+="</select>";
   return (cyl);
   }
 function ValidateForm(frm1) {
 var user=frm1.login
 var pwd=frm1.password
 var cpwd=frm1.retype
 var hqo=frm1.distributor
 var occp=frm1.Address
 var dobd=frm1.country
 var dobm=frm1.region
 var hqa=frm1.city;
 var relg=frm1.state;
  var email=frm1.email
 var coun=frm1.phone;
 var stt=frm1.fax;
 if(check(user) && check(pwd) && check(cpwd) && isPasswordMatch(frm1)  && check(hqo) && check(occp) && check(hqa) && check(relg)  && MenuSelected(dobd) && MenuSelected(dobm)    && isValidSymbol(frm1) && isValidDomain(frm1)&& check(email)  && check(coun) && check(stt) ) return true;
 return false;
 }

 function check(cmd) {
 if(cmd.value=="") {
 alert(cmd.name+" "+"Field Missed");
 cmd.focus();
 return false;}
 return true;
 }
 
 function MenuSelected(cmd) {
 if(cmd.selectedIndex=='0') {
 alert("Select "+cmd.name+" "+"Field");
 cmd.focus();
 return false;
            }
 return true;
        }
 function  isPasswordMatch(frm) {
 if(frm.password.value!=frm.retype.value) {
 alert("Confirm Password Not Matched with Above Password");
 frm.retype.focus();
 return false;
           }
 return true;
         }
 function isValidDomain(frm1) {
 var domains=new Array("com","edu","org","net","mil")
 var amail=frm1.email;
 var cond=amail.value.substring(amail.value.lastIndexOf(".")+1);
 for(i=0;i<domains.length;i++) {
 if(domains[i]==cond)  return true }
 alert("Invalid Domain Name");
 amail.focus();
 return false;
          }

 function isValidSymbol(frm1) {      
 var amail=frm1.email;
 if(amail.value.indexOf("@")==-1||amail.value.indexOf(".")==-1) {
 alert("Invalid Email-Id");
 amail.focus();
 return false;
 }
 return true;
 }

