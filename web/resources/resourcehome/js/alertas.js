	
			

           
            
		
		
			$().ready(function(){
				$('#salir').click(function(){
					swal({
						title: "Está seguro?",
						text: "Que desea salir!",
						type: "warning",
						showCancelButton: true,
                        allowOutsideClick: true,
						confirmButtonColor: "#DD6B55",
						confirmButtonText: "Si, Salir!",
						cancelButtonText: "No, cancelar!",
						closeOnConfirm: false,
						closeOnCancel: false
					},
					function(isConfirm){
						if (isConfirm) {
                           swal({
                        title: "Hasta proto",
						text: "vuelve pronto",
						showCancelButton: false,
						showConfirmButton: false,
                               timer: 1000
                               

        

                               
                           });
                           window.location.href = "../home/index.html";
						} else {
                             swal({   title: "Ok",   text: "Sigamos divirtiendonos",  timer: 1000,   showConfirmButton: false,
                                 allowOutsideClick: true,});
						}
					});
				});
			});/*Salir de la pagina*/
		
            $().ready(function(){
				$('#editar_perfil').click(function(){
					swal({
						title: "Está seguro?",
						text: "No recuperará su archivo!",
						type: "warning",
						showCancelButton: true,
						confirmButtonColor: "#DD6B55",
						confirmButtonText: "Si, eliminar!",
						cancelButtonText: "No, cancelar!",
						closeOnConfirm: false,
						closeOnCancel: false
					},
					function(isConfirm){
						if (isConfirm) {
							swal("Eliminado!", "Su imagen se ha eliminado :(.", "success");
						} else {
							swal("Cancelado", "su imagen se ha salvado :)", "error");
						}
					});
				});
			});


			$().ready(function(){
				$('#btn_Organizar').click(function(){
					swal({
						title: "Organizado!",
						text: "XDXDXD.",
						imageUrl: "imgs/thumbs-up.jpg"
					});
				});
			});
		
			$().ready(function(){
				$('#btn_Cerrar').click(function(){
					swal({
						title: "Se cerrará automaticamente!",
						text: "Se cerrará en 5 segundos...",
						timer: 5000,
						showConfirmButton: false
					});
				});
			});

			/*
    Uno
        swal("Here's a message!")
    Dos
        swal("Here's a message!", "It's pretty, isn't it?")
    tres
        swal("Good job!", "You clicked the button!", "success")
    cuatro
        swal({   title: "Are you sure?",   text: "You will not be able to recover this imaginary file!",   type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",   confirmButtonText: "Yes, delete it!",   closeOnConfirm: false }, function(){   swal("Deleted!", "Your imaginary file has been deleted.", "success"); });
    cinco
        swal({   title: "Are you sure?",   text: "You will not be able to recover this imaginary file!",   type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",   confirmButtonText: "Yes, delete it!",   cancelButtonText: "No, cancel plx!",   closeOnConfirm: false,   closeOnCancel: false }, function(isConfirm){   if (isConfirm) {     swal("Deleted!", "Your imaginary file has been deleted.", "success");   } else {     swal("Cancelled", "Your imaginary file is safe :)", "error");   } });
    seis
        swal({   title: "Sweet!",   text: "Here's a custom image.",   imageUrl: "images/thumbs-up.jpg" });
    siete
        swal({   title: "HTML <small>Title</small>!",   text: "A custom <span style="color:#F8BB86">html<span> message.",   html: true });
    ocho
        swal({   title: "Auto close alert!",   text: "I will close in 2 seconds.",   timer: 2000,   showConfirmButton: false });
    nueve
        swal({   title: "An input!",   text: "Write something interesting:",   type: "input",   showCancelButton: true,   closeOnConfirm: false,   animation: "slide-from-top",   inputPlaceholder: "Write something" }, function(inputValue){   if (inputValue === false) return false;      if (inputValue === "") {     swal.showInputError("You need to write something!");     return false   }      swal("Nice!", "You wrote: " + inputValue, "success"); });
    
    dies
        swal({   title: "Ajax request example",   text: "Submit to run ajax request",   type: "info",   showCancelButton: true,   closeOnConfirm: false,   showLoaderOnConfirm: true, }, function(){   setTimeout(function(){     swal("Ajax request finished!");   }, 2000); });
        
        */

    
    
$(document).ready(function() {
    $('#securePasswordForm')
        .formValidation({
            framework: 'bootstrap',
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                pwd: {
                    validators: {
                        notEmpty: {
                            message: 'The password is required and cannot be empty'
                        },
                        callback: {
                            callback: function(value, validator, $field) {
                                var score = 0;

                                if (value === '') {
                                    return {
                                        valid: true,
                                        score: null
                                    };
                                }

                                // Check the password strength
                                score += ((value.length >= 8) ? 1 : -1);

                                // The password contains uppercase character
                                if (/[A-Z]/.test(value)) {
                                    score += 1;
                                }

                                // The password contains uppercase character
                                if (/[a-z]/.test(value)) {
                                    score += 1;
                                }

                                // The password contains number
                                if (/[0-9]/.test(value)) {
                                    score += 1;
                                }

                                // The password contains special characters
                                if (/[!#$%&^~*_]/.test(value)) {
                                    score += 1;
                                }

                                return {
                                    valid: true,
                                    score: score    // We will get the score later
                                };
                            }
                        }
                    }
                }
            }
        })
        .on('success.validator.fv', function(e, data) {
            // The password passes the callback validator
            if (data.field === 'pwd' && data.validator === 'callback') {
                // Get the score
                var score = data.result.score,
                    $bar  = $('#passwordMeter').find('.progress-bar');

                switch (true) {
                    case (score === null):
                        $bar.html('').css('width', '0%').removeClass().addClass('progress-bar');
                        break;

                    case (score <= 0):
                        $bar.html('Very weak').css('width', '25%').removeClass().addClass('progress-bar progress-bar-danger');
                        break;

                    case (score > 0 && score <= 2):
                        $bar.html('Weak').css('width', '50%').removeClass().addClass('progress-bar progress-bar-warning');
                        break;

                    case (score > 2 && score <= 4):
                        $bar.html('Medium').css('width', '75%').removeClass().addClass('progress-bar progress-bar-info');
                        break;

                    case (score > 4):
                        $bar.html('Strong').css('width', '100%').removeClass().addClass('progress-bar progress-bar-success');
                        break;

                    default:
                        break;
                }
            }
        });
});

    

		