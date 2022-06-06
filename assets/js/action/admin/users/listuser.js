 $( document ).ready(function() {

  console.log('You are running jQuery version: ' + $.fn.jquery);
  $('.select2').select2();
  var st = true;
  window.img = '';
  $("input[data-bootstrap-switch]").each(function(){
    // $(this).bootstrapSwitch('state', $(this).prop('checked'));
    $(this).bootstrapSwitch({
      onSwitchChange: function(e, state) {
        st = state;
      }
    });
  });
  $('.bootstrap-switch-handle-on').html('Aktif');
  $('.bootstrap-switch-handle-off').html('Tidak');

  $('#users > a').attr('class','nav-link active');

  $('#add-users').on('click', function(){
    $('#modal-default').modal({
      show: true
    });
    $('#id').val('');
    $('.modal-title').html('Tambah User');
    $('#username').attr('disabled', false);
    $('#password').attr('disabled', false);
    $("[name='user-input']").val('');
    // $("#kota-kab").select2('data', {}).trigger('change');
    $('#role').val('').trigger('change');
    $('#satker').val('').trigger('change');
    // $('#blah').attr('src', 'assets/img/users/default.jpg');
    // $('label[for="foto-user"]').text('Pilih Foto');
  });

  $('#save-user').on('click', function(){
    if(!$('#name').val()){
      $('#name').attr('class', 'form-control is-invalid');
    }else if(!$('#username').val()){
      $('#username').attr('class', 'form-control is-invalid');
    }else if(!$('#password').val()){
      $('#password').attr('class', 'form-control is-invalid');
    }else{
      saveUser(st);
    }
  });

  $('#name').keyup(function(){$(this).attr('class', 'form-control')});
  $('#username').keyup(function(){$(this).attr('class', 'form-control')});
  $('#password').keyup(function(){$(this).attr('class', 'form-control')});

  loaddatauser();

  $( "#btn-view-pass" ).mousedown(function(e) {
      $('#password').prop('type', 'text');
      $('#btn-view-pass > i').attr('class','far fa-eye-slash');
  });

  $( "#btn-view-pass" ).mouseup(function(e) {
      $('#password').prop('type', 'password');
      $('#btn-view-pass > i').attr('class','far fa-eye');
  });

  $("#foto-user").change(function() {
    readURL(this);
  });

  $('#username').keyup(function(){
    $('#username').attr('class', 'form-control');
    $('#warning').attr('style', 'color: #f9b2b2;display:none;');
    $('#lbl-unm').attr('style', 'display:block;');

    $('#save-user').attr('disabled', false);

    if($(this).val().length >= 4){
      cekusername($(this).val());
    }
  });

  $('#role').on('change', function(){
    if(this.value == 10){
      $('#satker').prop('disabled', true)
      $('#name').prop('disabled', false)
      $('#username').prop('disabled', false)
      $('#password').prop('disabled', false)
      $('#save-user').prop('disabled', false)
    }else if(this.value == ''){
      $('#name').prop('disabled', true)
      $('#username').prop('disabled', true)
      $('#password').prop('disabled', true)
      $('#satker').prop('disabled', true)
      $('#save-user').prop('disabled', true)
    }else{
      $('#satker').prop('disabled', false)
      $('#name').prop('disabled', false)
      $('#username').prop('disabled', false)
      $('#password').prop('disabled', false)
      $('#save-user').prop('disabled', false)
      loadsatker(this.value);
    }
  })

  $('#satker').on('change', function(){
    let kode_satker = this.value
    $('#name').val(kode_satker);
    $('#username').val(kode_satker);
    $('#password').val(kode_satker);
  })

});

function loadsatker(role){
    $.ajax({
        type: 'post',
        dataType: 'json',
        url: 'loadsatker',
        data : {
                role      : role,
         },
        success: function(result){
          console.log(result.length);
          if(result.length != 0){
            $('#satker').empty();
            var option ='<option value="">-pilih-</option>';
            for (var i = 0; i < result.length; i++) {
              option += '<option value="'+result[i].kode_satker+'">'+result[i].nama_satker+'</option>';
            }
            $('#satker').append(option);
          }else{
            $('#satker').prop('disabled', true)
            $('#name').prop('disabled', true)
            $('#username').prop('disabled', true)
            $('#password').prop('disabled', true)
          }
        }
      });
    };

    function loaddatauser(){

        $.ajax({
            type: 'post',
            dataType: 'json',
            url: 'getdatausers',
            data : {
                    param      : 'muser',
             },
            success: function(result){
              
              if(result.code == 1){
                    var dt = $('#listuser').DataTable({
                      destroy: true,
                      paging: true,
                      lengthChange: false,
                      searching: true,
                      ordering: true,
                      info: true,
                      autoWidth: false,
                      responsive: false,
                      pageLength: 10,
                      dom: 'lrtip',
                      aaData: result.data,
                        aoColumns: [
                            { 'mDataProp': 'id'},
                            // { 'mDataProp': 'img'},
                            { 'mDataProp': 'username'},
                            { 'mDataProp': 'role_desc'},
                            { 'mDataProp': 'status'},
                            { 'mDataProp': 'islogin'},
                            { 'mDataProp': 'id'},
                            // { 'mDataProp': 'role'},
                        ],
                        // order: [[0, 'ASC']],
                        aoColumnDefs:[
                          // {
                          //   targets: [7],
                          //   visible: false
                          // },
                            {
                                mRender: function (data, type, row){
                                    var $rowData = '';
                                        $rowData += `
                                                  <div class="row">
                                                    <div class="col-md-4">
                                                      <button onclick="modaldetail('`+row.id+`','`+row.username+`','`+row.role_desc+`','`+row.status+`','`+row.name+`','`+row.img+`')" type="button" class="btn btn-block btn-success btn-xs"><i class="far fa-eye"></i></button>
                                                    </div>
                                                    <!--div class="col-md-4">
                                                      <button onclick="edituser('`+row.id+`','`+row.username+`','`+row.password+`','`+row.status+`','`+row.role+`','`+row.name+`','`+row.satker+`')" type="button" class="btn btn-block btn-warning btn-xs"><i class="far fa-edit"></i></button>
                                                    </div-->
                                                    <div class="col-md-4">
                                                      <button onclick="deleteData(`+row.id+`)" type="button" class="btn btn-block btn-danger btn-xs"><i class="fas fa-trash-alt"></i></button>
                                                    </div>
                                                  </div>
                                                    `;

                                    return $rowData;
                                },
                                aTargets: [5]
                            },
                            {
                                mRender: function (data, type, row){
                                  var $rowData = '';
                                  if(row.islogin == 1){
                                        $rowData +=`<span class="badge badge-success right">Online</span>`;
                                      }else{
                                        $rowData +=`<span class="badge badge-default right">Offline</span>`;
                                      }

                                    return $rowData;
                                },
                                aTargets: [4]
                            },
                            {
                                mRender: function (data, type, row){
                                  var $rowData = '';
                                  if(row.status == 1){
                                        $rowData +=`<span class="badge badge-primary right">Aktif</span>`;
                                      }else{
                                        $rowData +=`<span class="badge badge-warning right">Non Aktif</span>`;
                                      }

                                    return $rowData;
                                },
                                aTargets: [3]
                            },
                            // {
                            //     mRender: function (data, type, row){
                            //       var $rowData = '<img src="'+row.img+'" style="width: 35px;"></img>';
                            //         return $rowData;
                            //     },
                            //     aTargets: [1]
                            // }
                        ],

                        fnRowCallback: function(nRow, aData, iDisplayIndex, iDisplayIndexFull){
                            var index = iDisplayIndexFull + 1;
                            $('td:eq(0)', nRow).html(' '+index);
                            return  ;
                        },

                        fnInitComplete: function () {
                          
                            this.api().columns().every( function () {
                              
                                var column = this;
                                var select = $('<select><option value=""></option></select>')
                                    .appendTo( $(column.footer()).empty() )
                                    .on( 'change', function () {
                                        var val = $.fn.dataTable.util.escapeRegex(
                                            $(this).val()
                                        );
                 
                                        column
                                            .search( val ? '^'+val+'$' : '', true, false )
                                            .draw();
                                    } );
                 
                                column.data().unique().sort().each( function ( d, j ) {
                                    select.append( '<option value="'+d+'">'+d+'</option>' )
                                } );
                            } );

                        }
                    });

                    $('#table-filter').on('change', function(){
                      dt.search(this.value).draw();   
                    });
                  }

            }
        });
    }

    function saveUser(st){
      var img = window.img;
      var stat;
        switch (st) {
          case false:
              stat = '0';
            break;
          default:
              stat = '1'
        }

        if($('#id').val()){
          var baseurl = 'updateUser';
          var msg = 'Update User';

        }else{
          var baseurl = 'saveUser';
          var msg = 'Tambah User';
        }

        $.ajax({
            type: 'post',
            dataType: 'json',
            url: baseurl,
            data : {
                    id            : $('#id').val(),
                    name          : $('#name').val(),
                    username      : $('#username').val(),
                    password      : $('#password').val(),
                    status        : stat,
                    role          : $("#role").val(),
                    satker        : $("#role").val() == 10 ? '' : $("#satker").val(),
                    // img           : img,
             },
            success: function(result){
              Swal.fire({
                title: 'Sukses!',
                text: msg,
                icon: 'success',
                showConfirmButton: false,
                timer: 1500
              });

              $('#modal-default').modal('hide');
              loaddatauser();
            }
          });
        };

function edituser(id, username, password, status, role, name, satker){
  $('#add-users').trigger('click');
  $('.modal-title').html('Edit User');
  $('#id').val(id);
  $('#name').val(name);
  $('#username').val(username);
  $('#username').attr('disabled', false);
  $('#password').val(password);
  $('#password').attr('disabled', false);
  // let fot = foto.split("/");
  // $('label[for="foto-user"]').text(fot[fot.length - 1]);
  // $('#blah').attr('src', foto);
  $("#stat").bootstrapSwitch('state', status == '1' ? true : false);

  $('#role').val(role).trigger('change')
  $('#satker').val(satker).trigger('change')
}

function deleteData(id)
{
  const swalWithBootstrapButtons = Swal.mixin({
    customClass: {
      confirmButton: 'btn btn-success btn-sm swal2-styled-custom',
      cancelButton: 'btn btn-danger btn-sm swal2-styled-custom'
    },
    buttonsStyling: false
  });

  swalWithBootstrapButtons.fire({
    title: 'Anda Yakin, hapus user ini?',
    text: "",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonText: '<i class="fas fa-check"></i> Ya',
    cancelButtonText: '<i class="fas fa-times"></i> Tidak',
    reverseButtons: true
  }).then((result) => {
  if (result.isConfirmed) {
    $.ajax({
      type: 'post',
      dataType: 'json',
      url: 'deleteuser',
      data : {
              id    : id,
            },
      success: function(data)
      {
        Swal.fire({
          title: 'Sukses!',
          text: 'Hapus User',
          icon: 'success',
          showConfirmButton: false,
          timer: 1500
        });
        loaddatauser();
      }
    });
  }
})

}

function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function(e) {
      $('#blah').attr('src', e.target.result);
      window.img = e.target.result;
    }
    reader.readAsDataURL(input.files[0]); // convert to base64 string
  }
}

function modaldetail(id,username,role,status,name,foto){
    $('#modal-detail').modal({
      show: true
    });

    $('.modal-title').html('Detail');

    var stt = '';
    if(status == 1){
      stt +=`<span class="badge badge-primary right">Aktif</span>`;
    }else{
      stt +=`<span class="badge badge-warning right">Non Aktif</span>`;
    }

    $('#detail-foto').attr('src', foto);
    $('#detail-name').text(name);
    $('#detail-username').html('username: <i>'+username+'</i>');
    $('#detail-status').html(stt);
    $('#detail-role').text(role);
}

function cekusername(uname){
    $.ajax({
        type: 'post',
        dataType: 'json',
        url: 'cekusername',
        data : {
                username      : uname,
         },
        success: function(result){
            console.log(result);
            if(result){
              $('#username').attr('class', 'form-control is-invalid');
              $('#warning').attr('style', 'color: #f9b2b2;display:block;');
              $('#lbl-unm').attr('style', 'display:none;');
              $('#save-user').attr('disabled', true);

            }
        }
      });
    };
