
function queryParams() {
    return {
        type: 'owner',
        sort: 'updated',
        direction: 'desc',
        per_page: 100,
        page: 1
    };
}

function commonFormatter(value) {
	return '<div data-field="' + this.field + '">' + value + '</div>';
}

window.commonEvents = {
	'click div': function (e) {
        alert('You click field: ' + $(e.target).attr('data-field', nombre));
    }
}

function htmlSorter(a, b) {
	var a = $(a).text();
  var b = $(b).text();
  if (a < b) return -1;
  if (a > b) return 1;
  return 0;
}

function monthSorter(a, b) {
    if (a.month < b.month) return -1;
    if (a.month > b.month) return 1;
    return 0;
}//2
function starsSorter(a, b) {
    if (a < b) return 1;
    if (a > b) return -1;//ordena por tamaño
    return 0;
}//1
var data = [
    {
        "nombre": "Juana Delgado",
        "edad": "45",
        "programa": "Posnatal",
        "descripcion": "pilatates 2 00 pm ,todos los dias",
        "btn" : " "
        
    },
   
     {
        "nombre": "Juana Delgado",
        "edad": "45",
        "programa": "Posnatal",
        "descripcion": "pilatates 2 00 pm ,todos los dias",
        "btn" : " "
        
    },
     {
        "nombre": "Juana Delgado",
        "edad": "45",
        "programa": "Posnatal",
        "descripcion": "pilatates 2 00 pm ,todos los dias",
        "btn" : " "
        
    },
     {
        "nombre": "Juana Delgado",
        "edad": "45",
        "programa": "Posnatal",
        "descripcion": "pilatates 2 00 pm ,todos los dias",
        "btn" : " "
        
    },
     {
        "nombre": "Juana Delgado",
        "edad": "45",
        "programa": "Posnatal",
        "descripcion": "pilatates 2 00 pm ,todos los dias",
        "btn" : " "
        
    },
     
];


function nameFormatter(value) {
    return '<a href="https://github.com/wenzhixin/' + value + '">' + value + '</a>';
}

function starsFormatter(value) {
    return '<i class="glyphicon glyphicon-star"></i> ' + value;
}

function forksFormatter(value) {
    return '<i class="glyphicon glyphicon-cutlery"></i> ' + value;
}
$(function () {
    $('#table').bootstrapTable({
        data: data
    });
});
