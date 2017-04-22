$(document).ready(function() {
    $('#form-email').formValidation({
        framework: 'bootstrap',
        button: {
            selector: '#aceptar',
            disabled: 'disabled'
        },
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            email: {
                validators: {
                    emailAddress: {
                      message :' '
                    },
                    regexp: {
                            regexp: '^[^@\\s]+@([^@\\s]+\\.)+[^@\\s]+$',
                            message: 'No es una dirección de correo valida'
                 },
                 notEmpty: {
                        message: 'Es necesario colocar tu correo'
                    },
                }
            },
            nombre: {
                validators: {
                    notEmpty: {
                        message: 'Es necesario colocar tus nombres'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z\s]+$/,
                        message: 'Los nombres no llevan "1231" o "#%$%#"'
                    }
                }
            },
              apellidos: {
                validators: {
                    notEmpty: {
                        message: 'Es necesario colocar tus apellidos'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z\s]+$/,
                        message: 'Los apellidos no llevan "1231" o "#%$%#"'
                    }
                }
           },
             fecha: {
                validators: {
                    notEmpty: {
                        message: 'Es necesario colocar tu fecha de nacimiento'
                    }
                }
           },
            direccion: {
                validators: {
                    notEmpty: {
                        message: 'Es necesario colocar tu dirección'
                    }
                }
           },
              telefono: {
                validators: {
                    notEmpty: {
                        message: 'Es necesario colocar tu telefono'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'Los telefonos no llevan letras"'
                    }
                }
           },

     }
    });
});

$(document).ready(function() {
    $('#form-post').formValidation({
        framework: 'bootstrap',
        button: {
            selector: '#check',
            disabled: 'disabled'
        },
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            email: {
                validators: {
                    emailAddress: {
                      message :' '
                    },
                    regexp: {
                            regexp: '^[^@\\s]+@([^@\\s]+\\.)+[^@\\s]+$',
                            message: 'No es una dirección de correo valida'
                 },
                 notEmpty: {
                        message: 'Es necesario colocar tu correo'
                    },
                }
            },
            program: {
                validators: {
                    notEmpty: {
                        message: 'Es necesario colocar el programa a postear'
                    }
                   
                }
            },
              tema: {
                validators: {
                    notEmpty: {
                        message: 'Es necesario colocar el tema de tu noticia'
                    }
                }
           },
            
             text: {
                validators: {
                    notEmpty: {
                        message: 'Es necesario colocar la descripción de tu noticia'
                    }
                }
           },

     }
    });
});

$.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['es-MX']);
