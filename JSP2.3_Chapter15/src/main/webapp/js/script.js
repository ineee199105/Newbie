var re = /^[a-zA-Z0-9]{4,12}$/; 
var re2 = /^[0-9a-zA-Z]{1,}@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
function allCheck(){
  return (idCheck()&&pwCheck()&&checkMail()&&nameCheck()&&checkAddr()&&ymdCheck()&&checkInterest()&&introCheck());
}


function idCheck(){
  var id = document.getElementById("_id");
 
  
  if(id.value == ""){
    window.alert("ID를 입력하세요");
    id.focus();
    id.value = "";
    return false;
  }
  else if(!re.test(id.value)){
    window.alert("아이디는 4~12자와 영어 숫자로만 입력");
    id.focus();
    id.value = "";
    return false;
  }
  else return true;
}

function checkAddr(){
  var sangaddr = document.getElementById("tbox3").value;
  var numaddr = document.getElementById("tbox1").value;
  if(numaddr == ""){
    alert("주소를 입력해 주세요.");
    document.getElementById("tbox1").focus;
    return false;
  }
  if(sangaddr == ""){ 
    alert("상세주소를 입력해 주세요.");
    document.getElementById("tbox3").focus();
    return false;
  }
  else return true;
}


function pwCheck(){
      var pw1 = document.getElementById("_pw");
      var pw2 = document.getElementById("_pw2");

     
      if (pw1.value == document.getElementById("_id").value)
      {
        alert("아이디랑 비밀번호가 같으면 안됩니다.")
        pw1.focus;
        pw1.value = "";
        pw2.value = "";
        return false;
      }
     
      else if (!re.test(pw1.value))
      {
        alert("비밀번호는 4~12자 또는 영문 대소문자만 입력하세요.");
        pw1.focus;
        pw1.value = "";
        pw2.value = "";
        return false;
      }
      
      else if (pw1.value != pw2.value)
      {
        alert("비밀번호를 확인해주세요")
        pw1.focus;
        pw1.value = "";
        pw2.value = "";
        return false;
      }
      else return true;
}


function checkMail(){
  var mail = document.getElementById("_mail");
  if(mail.value == ""){
    alert("이메일 내용을 입력해주세요.");
    mail.focus;
    mail.value = "";
    return false;
  }
  else if(!re2.test(mail.value)){
    alert("이메일 형식을 확인바랍니다.");
    mail.focus;
    mail.value = "";
    return false;
  }
  else return true;  
}


function nameCheck(){
  var name = document.getElementById("_name");
  var reKor = /^[가-힣]{1,}$/;
  if (name.value == null){
    alert("이름을 입력해주세요");
    name.focus;
    name.value = "";
    return false;
  }
  else if(!reKor.test(name.value)){
    alert("한글을 입력해 주세요.")
    name.focus;
    name.value = "";
    return false;
  }
  else return true;
}



function addrFind() {
  new daum.Postcode({
    oncomplete: function(data) {
    
    var addr = '';
    var extraAddr = ''; 

    
    if (data.userSelectedType === 'R') {
      addr = data.roadAddress;
    } else { 
      addr = data.jibunAddress;
    }
   
    if(data.userSelectedType === 'R'){
    
    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
      extraAddr += data.bname;
    }
    
    if(data.buildingName !== '' && data.apartment === 'Y'){
      extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
    }
  
    if(extraAddr !== ''){
      extraAddr = ' (' + extraAddr + ')';
    }
   
    document.getElementById("tbox4").value = extraAddr;
    } else {
      document.getElementById("tbox4").value = '';
    }
   
    document.getElementById('tbox1').value = data.zonecode;
    document.getElementById("tbox2").value = addr;
   
    document.getElementById("tbox3").focus();
    }
  }).open();

}


function ymdCheck(){
  var today = new Date();
  var yearcheck = today.getFullYear()
  var ssn = document.getElementById("_ju").value;
  var birth = ssn.substr(0,6);
  var reymd = /^[0-9]{1,}$/;
 
  if(!reymd.test(ssn)){
    alert("숫자만 입력하세요.");
    document.getElementById("_ju").focus;
    document.getElementById("_ju").value = "";
    return false;
  }else{
    if(parseInt("20"+birth.substr(0,2)) > yearcheck){
      document.getElementById("birth").value = "19"+ birth.substr(0,2);
    }
    else {
      document.getElementById("birth").value = "20"+ birth.substr(0,2);
    }
   
    month[parseInt(birth.substr(2,2))-1].selected = true;
    day[parseInt(birth.substr(4,2))-1].selected = true;
    
    if(parseInt(ssn[6]) > 4)
    {
      alert("성별 확인");
    }
    else if(
      ssn[12] != (11-((2*parseInt(ssn[0])+ 3*parseInt(ssn[1])+ 4*parseInt(ssn[2])+
      5*parseInt(ssn[3])+ 6*parseInt(ssn[4])+ 7*parseInt(ssn[5])+
      8*parseInt(ssn[6])+ 9*parseInt(ssn[7])+ 2*parseInt(ssn[8])+
      3*parseInt(ssn[9])+ 4*parseInt(ssn[10])+5*parseInt(ssn[11]))%11))) 
      {
        alert("주민번호 확인");
    }
    return true;
  }
}

function checkInterest(){
    var interest = document.getElementsByName("hobby")
    var cnt = 0;
    for(var i =0; i<interest.length; i ++){
      if(interest[i].checked){cnt++};
    }
    if (cnt == 0)
    {
      alert("관심분야를 체크해 주세요.")
    return false;
    }
    else return true;
}

function introCheck(){
  var intro = document.getElementById("my_intro");

  if(intro.value == ""){
    alert("자기소개란에 내용을 입력해주세요.");
    intro.focus;
    return false;
  }
  else return true;
}