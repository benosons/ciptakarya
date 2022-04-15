$(function () {

  console.log('You are running jQuery version: ' + $.fn.jquery);
  $('[name="summernote"]').summernote({
    height: 200,   //set editable area's height
    codemirror: { // codemirror options
      theme: 'monokai'
    }
  });

  $('.select2').select2();
  $('.select2bs4').select2({
    theme: 'bootstrap4'
  })

  //Date picker
  $('#reservationdate').datetimepicker({
    format: 'L'
  });

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

  $('#listberita').DataTable();
  
  $('#modal-default').on('show.bs.modal', function(){
  })

  $('.bootstrap-switch-handle-on').html('Ya');
  $('.bootstrap-switch-handle-off').html('Tidak');

  $('#berita > a').attr('class','nav-link active');

  $('#add-berita').on('click', function(){
    $('#modal-default').modal({
      show: true
    });
    $('#id').val('');
    $('#judul').val('');
    // $('#intro').val('');
    $('#tag').val('');
    $('#isi').summernote('reset');
    $('#bagian').val('0').change();
    $('#date').val('');
    $('.modal-title').html('<i class="fas fa-newspaper"></i> Tambah Berita');
    $('#blah_1').attr('src', 'assets/img/no-image.png');
    $('#caption_1').val('');
  });

  $('#save-berita').on('click', function(){
    
    savedata(st);
  });

  loaddata();

  $("[name='image_input']").on('change',function() {
    readURL(this);
  });

});

function loaddata(){
  
  var tabel = $('#listberita').DataTable({
    "destroy": true,
    "searching": false,
    "processing": true,
    "responsive":true,
    "serverSide": true,
    "ordering": true, // Set true agar bisa di sorting
    "order": [[ 0, 'asc' ]], // Default sortingnya berdasarkan kolom / field ke 0 (paling pertama)
    "paging"      : true,
    "pageLength"  : 10,
    "ajax":
      {
        "url": "getdata", // URL file untuk proses select datanya
        "type": "POST",
        "data" : {
                      "param"       : 'data_berita',
                      "type"        : 'berita',
               },
      },
    "deferRender": true,
    "lengthMenu"  : [[5, 10, 50,100, -1], [5, 10, 50, 100,"All"]],
    "columns": [
        { "data": "id" },
        { "data": "id", render: function (data, type, row, meta) {
          var $rowData = '<div class="row">';
                            var col = 12;
                            if(typeof row.files != 'undefined'){
                              if (row.files.length == 2) {
                                col = 6;
                              }else if (row.files.length > 2){
                                col = 4;
                              }
                              for( var key in row.files ) {
                                $rowData += `
                                <div class="col-sm-`+col+`">
                                  <div class="card">
                                    <img id="" name="" class="img-fluid" src="`+row.files[key].path+'/'+row.files[key].filename+`" alt="">
                                  </div>
                                </div>
                                  `;
                              }
                            }else{
                              if(row.image != null){
                                let text = row.image;
                                var myArray = text.split(",");
                                row.files = myArray

                                
                             
                                for( var key in row.files ) {
                                  var img = $('<img src="'+row.files[key]+'" />');

                                    img.on('load', function(e){

                                    }).on('error', function(e) {
                                        console.log(row.files[key]);
                                    });
                                    
                                  $rowData += `
                                  <div class="col-sm-`+col+`">
                                    <div class="card">
                                      <img id="" name="" class="img-fluid" src="`+row.files[key]+`" alt="">
                                    </div>
                                  </div>
                                    `;
                                }
                              }
                            }
                              
                            
                            $rowData += '</div>';
                            
                            return $rowData;
          }  
        },
        { "data": "judul" },
        { "data": "date" , render: function(data, type, row, meta){
          var mydate = new Date(row.create_date);
                          var date = ("0" + mydate.getDate()).slice(-2);
                          var month = ("0" + (mydate.getMonth() + 1)).slice(-2);
                          var year = mydate.getFullYear();
                          var str = date+'/'+month+'/'+year;

                          var stat = row.status;
                          if(stat == 1){
                            var st = 'Publish'
                            var tex = 'text-success';
                          }else{
                            var st = 'No Publish'
                            var tex = 'text-danger';
                          }
                          var $rowData = '';
                                $rowData += `<div class="card">
                                <div class="card-body">
                                  <div class="d-flex justify-content-between">
                                    <p class="text-success text-sm">
                                      <i class="far fa-user"></i>
                                    </p>
                                    <p class="d-flex flex-column">
                                      <span class="text-muted"> `+row.username+`</span>
                                    </p>
                                  </div>
                                  <div class="d-flex justify-content-between">
                                    <p class="text-primary text-sm">
                                      <i class="far fa-calendar-alt"></i>
                                    </p>
                                    <p class="d-flex flex-column">
                                      <span class="text-muted"> `+str+`</span>
                                    </p>
                                  </div>
                                  <div class="d-flex justify-content-between">
                                    <p class="`+tex+` text-sm">
                                      <i class="fas fa-sign-in-alt"></i>
                                    </p>
                                    <p class="d-flex flex-column ">
                                      <span class="text-muted">`+st+`</span>
                                    </p>
                                  </div>
                                </div>
                              </div>`;

                            return $rowData;
        }},
        { "data": "bagian", render: function(data, type, row, meta){
          var bag = ['0','SETDITJEN','TIDUR','BPB','PKP','PPLP','PSPAM','PSP-POP'];
                              var $rowData = '';
                                  $rowData += bag[row.bagian];

                              return $rowData;
        } },
        { "data": "id",
            "render": 
            function( data, type, row, meta ) {
              
              if(typeof row.files != 'undefined'){
                 var id_file = row.files[0].id;
                 var path = row.files[0].path+'/'+row.files[0].filename;
                 
                   var stat = row.status;
                   var file = ''
                   for( var key in row.files ) {
                     file = row.files[key].path+'/'+row.files[key].filename;
                     idfile = row.files[key].id;
                     caption = row.files[key].caption;
                   }
                 }else{
                   if(row.image != null){
                     let text = row.image;
                     var myArray = text.split(",");
                     row.files = myArray

                     file = myArray[0];
                     idfile = 0;
                     caption = '';
                   
                   }else{
                     file = '';
                     idfile = 0;
                     caption = '';
                   }
                 }

                 var st = ''
                 if($('#role-user').val() == 10){
                   if(stat == 1){
                     st = `<div class="dropdown-divider"></div><a class="dropdown-item" href="#" onclick="updatepublish(`+row.id+`,0)"><i class="fas fa-sign-out-alt"></i> No Publish</a>`
                   }else{
                     st = `<div class="dropdown-divider"></div><a class="dropdown-item" href="#" onclick="updatepublish(`+row.id+`,1)"><i class="fas fa-sign-out-alt"></i> Publish</a>`;
                   }
                 }
              
                 var $rowData = '';
                     $rowData += `
                     <div class="btn-group">
                     <button type="button" class="btn btn-info">Action</button>
                     <button type="button" class="btn btn-info dropdown-toggle dropdown-icon" data-toggle="dropdown">
                       <span class="sr-only">Toggle Dropdown</span>
                     </button>
                     <div class="dropdown-menu" role="menu">
                       <a class="dropdown-item" href="javascript:void(0)" onclick="editdong('`+row.id+`','`+row.judul+`','`+row.tag+`','`+row.isi+`','`+file+`','`+idfile+`','`+row.bagian+`','`+row.date+`','`+caption+`')"><i class="far fa-edit"></i> Edit</a>
                       <a class="dropdown-item" href="#" onclick="deleteData(`+row.id+`, `+id_file+`, '`+path+`')
                       "><i class="far fa-trash-alt"></i> Hapus</a>
                       
                       `+st+`
                     </div>
                   </div>`;
              
                 return $rowData;
            }
        },
    ],
    "fnRowCallback": function(nRow, aData, iDisplayIndex, iDisplayIndexFull){
                          var index = iDisplayIndexFull + 1;
                          $('td:eq(0)', nRow).html(' '+index);
                          return  ;
                      },
});
}

    function savedata(st){
      var img = window.img;
      var id = $('#id').val();

      var judul = $('#judul').val();
      // var intro = $('#intro').val();
      var tag = $('#tag').val();
      var isi = $('#isi').val();
      var bagian = $('#bagian').val();
      var date = $('#date').val();
      var stat = $('#stat').val();

      var formData = new FormData();
      formData.append('id', id);
      formData.append('judul', judul);
      // formData.append('intro', intro);
      formData.append('tag', tag);
      formData.append('isi', isi);
      formData.append('bagian', bagian);
      formData.append('date', date);

      var iscapt = [];
      for (let index = 0; index < $("[name='image_input']").length; index++) {
        
        var src = $("[name='image_input']")[index].files[0];
        var cap = $("[name='caption']")[index].value;
        
        formData.append('files[]', src);
        formData.append('caption[]', cap);
        formData.append('idfile', $('#idfile').val());
      }
      
      var stat;
        switch (st) {
          case false:
              stat = '0';
            break;
          default:
              stat = '1'
        }
        formData.append('status', 0);

        if(id){
          var baseurl = 'updatedataberita';
          var msg = 'Update Berita';

        }else{
          var baseurl = 'savedataberita';
          var msg = 'Tambah Berita';
        }

        $.ajax({
          type: 'post',
          url: baseurl,
          dataType: 'json',
          cache: false,
          contentType: false,
          processData: false,
          data: formData,
          async:false,
            success: function(result){
              Swal.fire({
                title: 'Sukses!',
                text: msg,
                icon: 'success',
                showConfirmButton: false,
                timer: 1500
              });

              $('#modal-default').modal('hide');
              loaddata();
            }
          });
    };

function edituser(id, username, password, status, role, name, foto){
  $('#add-users').trigger('click');
  $('.modal-title').html('Edit User');
  $('#id').val(id);
  $('#name').val(name);
  $('#username').val(username);
  $('#username').attr('disabled', true);
  $('#password').val(password);
  $('#password').attr('disabled', true);
  let fot = foto.split("/");
  $('label[for="foto-user"]').text(fot[fot.length - 1]);
  $('#blah').attr('src', foto);
  $("#stat").bootstrapSwitch('state', status == '1' ? true : false);

  if(role == '10'){
    $("#super-admin").attr('checked', true).trigger('click');
  }else{
    $("#admin").attr('checked', true).trigger('click');
  }
}

function deleteData(id, id_file, path)
{
  const swalWithBootstrapButtons = Swal.mixin({
    customClass: {
      confirmButton: 'btn btn-success btn-sm swal2-styled-custom',
      cancelButton: 'btn btn-danger btn-sm swal2-styled-custom'
    },
    buttonsStyling: false
  });

  swalWithBootstrapButtons.fire({
    title: 'Anda yakin, hapus berita ini?',
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
      url: 'deleteberita',
      data : {
              id    : id,
              id_file    : id_file,
              path    : path,
            },
      success: function(data)
      {
        Swal.fire({
          title: 'Sukses!',
          text: 'Hapus Berita',
          icon: 'success',
          showConfirmButton: false,
          timer: 1500
        });
        loaddata();
      }
    });
  }
})

}

function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    var blah = input.id.replace("image", "blah");
    reader.onload = function(e) {
      $('#'+blah).attr('src', e.target.result);
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


    function addgambar(){
      var count = $("#gambar-container").children().length + 1;

      var elemen = `<div class="col-md-4">
      <div class="card card-light card-outline">
        <div class="card-tools">
          <a onclick="$(this).parent().parent().parent().remove()" class="btn btn-tool">
            <i class="fas fa-times"></i>
          </a>
        </div>
        <div class="card-body">
          <div class="form-group">
            <label></label>
            <div class="text-center">
                <img id="blah_`+count+`" name="images" class="img-fluid" src="assets/img/no-image.png" alt="picture">
                <canvas hidden id="myCanvas_`+count+`"/>
            </div>
            <div class="custom-file" style="margin-bottom: 10px;margin-top: 10px;">
              <input type="file" class="custom-file-input" id="image_`+count+`" name="image_input" onChange="pilihgambar(this)">
              <label class="custom-file-label" for="image_`+count+`">Pilih foto</label>
            </div>
          <input id="caption_`+count+`" name="caption" type="text" class="form-control" placeholder="Caption">
          </div>
        </div>
      </div>
    </div>`;
    $("#gambar-container").append(elemen);
      
    }

    function pilihgambar(ini){
      readURL(ini);
    }

    function editdong(id, judul, tag, isi, path, idfile, bagian, date, caption){
      $('#add-berita').trigger('click');
      $('.modal-title').html('<i class="fas fa-newspaper"></i> Edit Berita');
      $('#id').val(id);
      $('#idfile').val(idfile);
      $('#judul').val(judul);
      // $('#intro').val(intro);
      $("#tag").val(tag);
      $("#bagian").val(bagian).change();
      $("#date").val(date);
      $('#isi').summernote('code', isi);
      $('#blah_1').attr('src', path);
      $('#caption_1').val(caption);
    
    }

    function updatepublish(id,stat){
      var formData = new FormData();
      formData.append('id', id);
      formData.append('status', stat);
      
      $.ajax({
        type: 'post',
        url: 'updateberita',
        dataType: 'json',
        cache: false,
        contentType: false,
        processData: false,
        data: formData,
        async:false,
          success: function(result){
            Swal.fire({
              title: 'Sukses!',
              text: 'Berita telah di publish',
              icon: 'success',
              showConfirmButton: false,
              timer: 1500
            });

            $('#modal-default').modal('hide');
            loaddata();
          }
        });
    }