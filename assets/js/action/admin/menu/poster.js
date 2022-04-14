$(function () {

  console.log('You are running jQuery version: ' + $.fn.jquery);
  $('#summernote').summernote({
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

  $('#listposter').DataTable();
  
  $('#modal-default').on('show.bs.modal', function(){
  })

  $('.bootstrap-switch-handle-on').html('Ya');
  $('.bootstrap-switch-handle-off').html('Tidak');

  $('#galeri > a').attr('class','nav-link active');
  $('#galeri').attr('class','nav-item menu-is-opening menu-open');
  $('#poster > a').attr('class','nav-link active');
  $('#poster > a > i').addClass('text-info');

  $('#add-poster').on('click', function(){
    $('#modal-default').modal({
      show: true
    });
    $('#id').val('');
    $('#judul').val('');
    $('#bulan').val(0).change();
    $('#tahun').val(0).change();
    $('.modal-title').html('<i class="fas fa-photo-video"></i> Tambah Poster');
    $('#blah_1').attr('src', 'assets/img/no-image.png');
    $('label[for="foto-user"]').text('Pilih Foto');
  });

  $('#save-poster').on('click', function(){
      savedata(st);
  });

  loaddata();


  $("[name='image_input']").on('change',function() {
    readURL(this);
  });

});


    function loaddata(){

        $.ajax({
            type: 'post',
            dataType: 'json',
            url: 'getdata',
            data : {
                    param       : 'data_poster',
                    type        : 'poster',
             },
            success: function(result){
              
              if(result.code == 1){
                    var dt = $('#listposter').DataTable({
                      destroy: true,
                      paging: true,
                      lengthChange: false,
                      searching: true,
                      ordering: true,
                      info: true,
                      autoWidth: false,
                      responsive: false,
                      pageLength: 10,
                      aaData: result.data,
                        aoColumns: [
                            { 'mDataProp': 'id'},
                            { 'mDataProp': 'id'},
                            { 'mDataProp': 'judul'},
                            { 'mDataProp': 'bulan'},
                            { 'mDataProp': 'id'},
                        ],
                        order: [[0, 'ASC']],
                        aoColumnDefs:[
                            {
                                mRender: function (data, type, row){
                                    var $rowData = '';
                                    for( var key in row.files ) {
                                      $rowData += `
                                        <div class="card" style="width:50%">
                                          <img id="" name="" class="img-fluid" src="`+row.files[key].path+'/'+row.files[key].filename+`" alt="">
                                        </div>
                                        `;
                                    }
                                    
                                    return $rowData;
                                },
                                aTargets: [1]
                            },
                            {
                                mRender: function (data, type, row){
                                  var month = ['bulan','Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September','Oktober', 'November', 'Desember'];

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
                                            <p class="text-primary text-sm">
                                              <i class="far fa-calendar-alt"></i>
                                            </p>
                                            <p class="d-flex flex-column">
                                              <span class="text-muted">Bulan `+month[row.bulan]+`</span>
                                            </p>
                                          </div>
                                          <!-- /.d-flex -->
                                          <div class="d-flex justify-content-between">
                                            <p class="text-inf text-sm">
                                              <i class="far fa-calendar-alt"></i>
                                            </p>
                                            <p class="d-flex flex-column">
                                              <span class="text-muted">Tahun `+row.tahun+`</span>
                                            </p>
                                          </div>
                                          <!-- /.d-flex -->
                                          <div class="d-flex justify-content-between">
                                            <p class="`+tex+` text-sm">
                                              <i class="fas fa-sign-in-alt"></i>
                                            </p>
                                            <p class="d-flex flex-column ">
                                              <span class="text-muted">`+st+`</span>
                                            </p>
                                          </div>
                                          <!-- /.d-flex -->
                                        </div>
                                      </div>`;

                                    return $rowData;
                                },
                                aTargets: [3]
                            },
                            {
                                mRender: function (data, type, row){
                                  var id_file = row.files[0].id;
                                  var path = row.files[0].path+'/'+row.files[0].filename;
                                  
                                    var stat = row.status;
                                    var file = ''
                                    for( var key in row.files ) {
                                      file = row.files[key].path+'/'+row.files[key].filename;
                                      idfile = row.files[key].id;
                                    }

                                    var st = ''
                                    // if($('#role-user').val() == 10){
                                      if(stat == 1){
                                        st = `<div class="dropdown-divider"></div><a class="dropdown-item" href="#" onclick="updatepublish(`+row.id+`,0)"><i class="fas fa-sign-out-alt"></i> No Publish</a>`
                                      }else{
                                        st = `<div class="dropdown-divider"></div><a class="dropdown-item" href="#" onclick="updatepublish(`+row.id+`,1)"><i class="fas fa-sign-out-alt"></i> Publish</a>`;
                                      }
                                    // }

                                    var $rowData = '';
                                        $rowData += `
                                        <div class="btn-group">
                                        <button type="button" class="btn btn-info">Action</button>
                                        <button type="button" class="btn btn-info dropdown-toggle dropdown-icon" data-toggle="dropdown">
                                          <span class="sr-only">Toggle Dropdown</span>
                                        </button>
                                        <div class="dropdown-menu" role="menu">
                                          <a class="dropdown-item" href="#" onclick="editdong('`+row.id+`', '`+row.judul+`', '`+row.bulan+`', '`+row.tahun+`', '`+file+`','`+idfile+`','`+stat+`')"><i class="far fa-edit"></i> Edit</a>
                                          <a class="dropdown-item" href="#" onclick="deleteData(`+row.id+`, `+id_file+`, '`+path+`')"><i class="far fa-trash-alt"></i> Hapus</a>
                                          
                                          `+st+`
                                        </div>
                                      </div>`;

                                    return $rowData;
                                },
                                aTargets: [4]
                            }
                        ],

                        fnRowCallback: function(nRow, aData, iDisplayIndex, iDisplayIndexFull){
                            var index = iDisplayIndexFull + 1;
                            $('td:eq(0)', nRow).html(' '+index);
                            return  ;
                        },

                        fnInitComplete: function () {
                            var that = this;
                            var td ;
                            var tr ;

                            this.$('td').click( function () {
                                td = this;
                            });
                            this.$('tr').click( function () {
                                tr = this;
                            });


                            $('#listproj_filter input').bind('keyup', function (e) {
                                return this.value;
                            });

                        }
                    });
                }else{
                  var table = $('#listposter').DataTable();
      
                        //clear datatable
                        table.clear().draw();
                }

            }
        });
    }

    function savedata(st){
      var img = window.img;
      var id = $('#id').val();
      var judul = $('#judul').val();
      var bulan = $('#bulan').val();
      var tahun = $('#tahun').val();
      var status = $('#stat').val();

      var formData = new FormData();
      formData.append('id', id);
      formData.append('judul', judul);
      formData.append('bulan', bulan);
      formData.append('tahun', tahun);
      
      var iscapt = [];
      for (let index = 0; index < $("[name='image_input']").length; index++) {
        var src = $("[name='image_input']")[index].files[0];
        
        formData.append('files[]', src);
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
          formData.append('idfile', $('#idfile').val());

          var baseurl = 'updatedataposter';
          var msg = 'Update Poster';

        }else{
          var baseurl = 'savedataposter';
          var msg = 'Tambah Poster';
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
    title: 'Anda yakin, hapus poster ini?',
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
      url: 'deleteposter',
      data : {
              id    : id,
              id_file    : id_file,
              path    : path,
            },
      success: function(data)
      {
        Swal.fire({
          title: 'Sukses!',
          text: 'Hapus Poster',
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
                <img id="blah_`+count+`" name="images_poster" class="img-fluid" src="assets/img/no-image.png" alt="picture">
                <canvas hidden id="myCanvas_`+count+`"/>
            </div>
            <div class="custom-file" style="margin-bottom: 10px;margin-top: 10px;">
              <input type="file" class="custom-file-input" id="image_`+count+`" name="image_input" onChange="pilihgambar(this)">
              <label class="custom-file-label" for="image_`+count+`">Pilih foto</label>
            </div>
          </div>
        </div>
      </div>
    </div>`;
    $("#gambar-container").append(elemen);
      
    }

    function pilihgambar(ini){
      readURL(ini);
    }

    function editdong(id, judul, bulan, tahun, path, idfile,stat){
      $('#add-poster').trigger('click');
      $('.modal-title').html('<i class="fas fa-photo-video"></i> Edit Poster');
      $('#id').val(id);
      $('#idfile').val(idfile);
      $('#judul').val(judul);
      $("#stat").bootstrapSwitch('state', stat == '1' ? true : false);
      $('#bulan').val(bulan).change();
      $('#tahun').val(tahun).change();
      $('#blah_1').attr('src', path);
    
    }

    function updatepublish(id,stat){
      var formData = new FormData();
      formData.append('id', id);
      formData.append('stat', stat);
      
      $.ajax({
        type: 'post',
        url: 'updateposter',
        dataType: 'json',
        cache: false,
        contentType: false,
        processData: false,
        data: formData,
        async:false,
          success: function(result){
            Swal.fire({
              title: 'Sukses!',
              text: 'Poster telah di publish',
              icon: 'success',
              showConfirmButton: false,
              timer: 1500
            });

            $('#modal-default').modal('hide');
            loaddata();
          }
        });
    }