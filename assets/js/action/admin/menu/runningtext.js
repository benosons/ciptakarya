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
  $('#reservation').daterangepicker()

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

  $('#listfoto').DataTable();
  
  $('#modal-default').on('show.bs.modal', function(){
  })
  $('#form-hal').hide();
  $('#link').click(function(){
    $('#link').addClass('active');
    $('#hal').removeClass('active');
    $('#form-hal').hide();
    $('#form-link').show();
    $('#tipe').val('link');
  })
  $('#hal').click(function(){
    $('#hal').addClass('active');
    $('#link').removeClass('active');
    $('#form-link').hide();
    $('#form-hal').show();
    $('#tipe').val('halaman');
  })

  $('.bootstrap-switch-handle-on').html('Ya');
  $('.bootstrap-switch-handle-off').html('Tidak');

  $('#info > a').attr('class','nav-link active');
  $('#info').attr('class','nav-item menu-is-opening menu-open');
  $('#runningtext > a').attr('class','nav-link active');
  $('#runningtext > a > i').addClass('text-info');

  $('#add-foto').on('click', function(){
    $('#modal-default').modal({
      show: true
    });
    $('#id').val('');
    $('#label-file').html('Pilih File');
    $('#link-teks').val('');
    $('#blah').attr('src', 'assets/img/no-image.png');
    $('.modal-title').html('<i class="fas fa-info-circle"></i> Tambah Running Text');

  });

  $('#save-text').on('click', function(){
    
      savetext(st);

  });

  $('#name').keyup(function(){$(this).attr('class', 'form-control')});
  $('#username').keyup(function(){$(this).attr('class', 'form-control')});
  $('#password').keyup(function(){$(this).attr('class', 'form-control')});

  loaddata();

  $( "#btn-view-pass" ).mousedown(function(e) {
      $('#password').prop('type', 'text');
      $('#btn-view-pass > i').attr('class','far fa-eye-slash');
  });

  $( "#btn-view-pass" ).mouseup(function(e) {
      $('#password').prop('type', 'password');
      $('#btn-view-pass > i').attr('class','far fa-eye');
  });

  $("[name='image_input']").on('change',function() {
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

});

function loadkota(){
    $.ajax({
        type: 'post',
        dataType: 'json',
        url: 'loadkota',
        data : {
                param      : '',
         },
        success: function(result){
          $('#kota-kab').empty();
          var option ='<option value="0">-Pilih-</option>';
          for (var i = 0; i < result.length; i++) {
            option += '<option value="'+result[i].id+'">'+result[i].nama+'</option>';
          }
          $('#kota-kab').append(option);
        }
      });
    };

    function loaddata(){

        $.ajax({
            type: 'post',
            dataType: 'json',
            url: 'getdata',
            data : {
                    param      : 'data_text',
                    type      : 'text',
             },
            success: function(result){
              
              if(result.code == 1){
                    var dt = $('#listtext').DataTable({
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
                            { 'mDataProp': 'judul'},
                            { 'mDataProp': 'isi'},
                            { 'mDataProp': 'isi', 'width':'15%'},
                            { 'mDataProp': 'id'},
                            // { 'mDataProp': 'role'},
                        ],
                        order: [[0, 'ASC']],
                        aoColumnDefs:[
                          {
                            mRender: function (data, type, row){
                                var linkurl = '';
                                if (row.files) {
                                  var id_file = row.files[0].id;
                                  var path = row.files[0].path+'/'+row.files[0].filename;
                                  
                                  var stat = row.status;
                                  var file = ''
                                  for( var key in row.files ) {
                                    file = row.files[key].path+'/'+row.files[key].filename;
                                    idfile = row.files[key].id;
                                    caption = row.files[key].caption;
                                  }
                                  linkurl += row.files[key].path+'/'+row.files[key].filename;
                                }else{
                                  linkurl = row.isi;
                                }
                                var $rowData = '';
                                    $rowData += `
                                      <span> <i class="fa fa-globe"> </i>
                                      <a href='`+linkurl+`' target="_blank" class="link-primary">Klik disini</a> </span>
                                    `;
  
                                return $rowData;
                            },
                            aTargets: [2]
                        },
                          {
                            mRender: function (data, type, row){
                              var stat = row.status;
                                  if(stat == 1){
                                    var st = 'Publish'
                                    var tex = 'text-success';
                                  }else{
                                    var st = 'No Publish'
                                    var tex = 'text-danger';
                                  }

                              var split_date = row.date.split(" - ");
                              
                              var mydate_1 = new Date(split_date[0]);
                              var mydate_2 = new Date(split_date[1]);

                              var date_1 = ("0" + mydate_1.getDate()).slice(-2);
                              var month_1 = ("0" + (mydate_1.getMonth() + 1)).slice(-2);
                              var year_1 = mydate_1.getFullYear();
                              var str_1 = date_1+'/'+month_1+'/'+year_1;

                              var date_2 = ("0" + mydate_2.getDate()).slice(-2);
                              var month_2 = ("0" + (mydate_2.getMonth() + 1)).slice(-2);
                              var year_2 = mydate_2.getFullYear();
                              var str_2 = date_2+'/'+month_2+'/'+year_2;
  
                              var $rowData = '';
                                    $rowData += `<div class="card">
                                    <div class="card-body">
                                    
                                      
                                      <div class="d-flex justify-content-between">
                                        <p class="text-primary text-sm">
                                          <i class="far fa-calendar-alt"></i>
                                        </p>
                                        <p class="d-flex flex-column">
                                          <span class="text-muted"> Dari `+str_1+`</span>
                                        </p>
                                      </div>
                                      <div class="d-flex justify-content-between">
                                        <p class="text-primary text-sm">
                                          <i class="far fa-calendar-alt"></i>
                                        </p>
                                        <p class="d-flex flex-column">
                                          <span class="text-muted"> Hingga `+str_2+`</span>
                                        </p>
                                      </div>
                                      <!-- /.d-flex ->
                                      <div class="d-flex justify-content-between">
                                        <p class="text-inf text-sm">
                                          <i class="far fa-calendar-alt"></i>
                                        </p>
                                        <p class="d-flex flex-column">
                                          <span class="text-muted">Tahun </span>
                                        </p>
                                      </div>
                                      <!- /.d-flex -->
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
                            var stat = row.status;
                            var linkurl = '';
                            if(stat == 1){
                              var st = `<a class="dropdown-item" href="#" onclick="updatepublish(`+row.id+`,0)"><i class="fas fa-sign-out-alt"></i> No Publish</a>`
                            }else{
                              var st = `<a class="dropdown-item" href="#" onclick="updatepublish(`+row.id+`,1)"><i class="fas fa-sign-out-alt"></i> Publish</a>`;
                            }
                                if (row.files) {
                                  var id_file = row.files[0].id;
                                  var path = row.files[0].path+'/'+row.files[0].filename;
                                  
                                  var stat = row.status;
                                  var file = ''
                                  for( var key in row.files ) {
                                    file = row.files[key].path+'/'+row.files[key].filename;
                                    idfile = row.files[key].id;
                                    caption = row.files[key].caption;
                                  }
                                  var $rowData = '';
                                  $rowData += `
                                  <div class="btn-group">
                                    <button type="button" class="btn btn-info">Action</button>
                                    <button type="button" class="btn btn-info dropdown-toggle dropdown-icon" data-toggle="dropdown">
                                      <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    <div class="dropdown-menu" role="menu">
                                      <a class="dropdown-item" href="javascript:void(0)" onclick="editdong('`+row.id+`','`+row.judul+`','`+row.tipe+`','`+row.isi+`','`+row.date+`','`+row.status+`','`+file+`','`+idfile+`','`+row.files[0].filename+`')"><i class="far fa-edit"></i> Edit</a>
                                      <a class="dropdown-item" href="#" onclick="deleteData(`+row.id+`, `+id_file+`, '`+path+`')
                                      "><i class="far fa-trash-alt"></i> Hapus</a>
                                      <div class="dropdown-divider"></div>
                                      `+st+`
                                    </div>
                                  </div>`;
                                  linkurl += row.files[key].path+'/'+row.files[key].filename;
                                }else{
                                  linkurl = row.isi;
                                  var $rowData = '';
                                  $rowData += `
                                  <div class="btn-group">
                                    <button type="button" class="btn btn-info">Action</button>
                                    <button type="button" class="btn btn-info dropdown-toggle dropdown-icon" data-toggle="dropdown">
                                      <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    <div class="dropdown-menu" role="menu">
                                      <a class="dropdown-item" href="javascript:void(0)" onclick="editdong('`+row.id+`','`+row.judul+`','`+row.tipe+`','`+row.isi+`','`+row.date+`','`+row.status+`')"><i class="far fa-edit"></i> Edit</a>
                                      <a class="dropdown-item" href="#" onclick="deleteData(`+row.id+`)
                                      "><i class="far fa-trash-alt"></i> Hapus</a>
                                      <div class="dropdown-divider"></div>
                                      `+st+`
                                    </div>
                                  </div>`;
                                }
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
                }

            }
        });
    }

    function savetext(st){
      var stat;
      var img = window.img;
      var id = $('#id').val();
      var judul = $('#judul').val();
      var tipe = $('#tipe').val();
      var formData = new FormData();
      if (tipe == "link") {
        var isi = $('#link-teks').val();
      }else if(tipe == "halaman"){
        var isi = '-';
        var iscapt = [];
        for (let index = 0; index < $("[name='image_input']").length; index++) {
          var src = $("[name='image_input']")[index].files[0];
          
          formData.append('files[]', src);
        }

      }
      var reservation = $('#reservation').val();

      
        switch (st) {
          case false:
              stat = '0';
            break;
          default:
              stat = '1'
        }

        if($('#id').val()){
          formData.append('idfile', $('#idfile').val());
          var baseurl = 'updatedatatext';
          var msg = 'Update Running Text';

        }else{
          var baseurl = 'savedatatext';
          var msg = 'Tambah Running Text';
        }

        formData.append('id', id);
        formData.append('judul', judul);
        formData.append('tipe', tipe);
        formData.append('isi', isi);
        formData.append('date', reservation);
        formData.append('status',stat);
        // formData.append('table', 'data_text');

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
              location.reload();
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


function deleteData(id, id_file, path){
  const swalWithBootstrapButtons = Swal.mixin({
    customClass: {
      confirmButton: 'btn btn-success btn-sm swal2-styled-custom',
      cancelButton: 'btn btn-danger btn-sm swal2-styled-custom'
    },
    buttonsStyling: false
  });

  swalWithBootstrapButtons.fire({
    title: 'Anda yakin, hapus running text ini?',
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
      url: 'deletetext',
      data : {
              id    : id,
              id_file    : id_file,
              path    : path,
            },
      success: function(data)
      {
        Swal.fire({
          title: 'Sukses!',
          text: 'Hapus Running Text',
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

    function editdong(id, judul, tipe, isi, tanggal, status, path, idfile,filename){
      $('#add-foto').trigger('click');
      $('.modal-title').html('<i class="fas fa-images"></i> Edit Running Text');
      $('#id').val(id);
      $('#idfile').val(idfile);
      $('#judul').val(judul);
      $('#tipe').val(tipe);
      $('#reservation').val(tanggal);
      if (tipe =='link') {
        $('#label-file').html('Pilih File');
      }else{
        $('#label-file').html(filename);
      }
      if (tipe == 'link') {
        $('#link').trigger('click');
        $('#link-teks').val(isi);
      }else if(tipe == "halaman"){
        $('#hal').trigger('click');
        $('#blah_1').attr('src', path);
      }
      $("#stat").bootstrapSwitch('state', status == '1' ? true : false);
    
    }

    function updatepublish(id,stat){
      var formData = new FormData();
      formData.append('id', id);
      formData.append('status', stat);
      
      $.ajax({
        type: 'post',
        url: 'updatetext',
        dataType: 'json',
        cache: false,
        contentType: false,
        processData: false,
        data: formData,
        async:false,
          success: function(result){
            Swal.fire({
              title: 'Sukses!',
              text: 'Banner telah di publish',
              icon: 'success',
              showConfirmButton: false,
              timer: 1500
            });

            $('#modal-default').modal('hide');
            loaddata();
          }
        });
    }