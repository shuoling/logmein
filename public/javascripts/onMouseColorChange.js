

var backColor = new Array(); 

backColor[0] = '#FF0000';
backColor[1] = '#00FF00';
backColor[2] = '#0000FF';
backColor[3] = '#FFFFFF';

function changeBG(whichColor){
document.getElementById("selected").style.backgroundColor = backColor[whichColor];
}
