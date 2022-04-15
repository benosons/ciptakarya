$(function () {

  console.log('You are running jQuery version: ' + $.fn.jquery);
  $('#summernote').summernote({
    height: 200,   //set editable area's height
    codemirror: { // codemirror options
      theme: 'monokai'
    }
  });
  $('.select2').select2();
  $('#pilih_kategori').select2({
    theme: 'bootstrap4'
  })
  $('#tahun').select2({
    theme: 'bootstrap4'
  })

  //Date picker
  $('#reservationdate').datetimepicker({
    format: 'L'
  });

  var st = true;
  window.img = '';
  // window.kategori = getkat();
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

  $('#info > a').attr('class','nav-link active');
  $('#info').attr('class','nav-item menu-is-opening menu-open');
  $('#produklaporan > a').attr('class','nav-link active');
  $('#produklaporan > a > i').addClass('text-info');

  $('#add-berita').on('click', function(){
    $('#modal-default').modal({
      show: true
    });
    loadkategori();
    loadkat();
    $('#id').val('');
    $('.modal-title').html('<i class="fas fa-newspaper"></i> Tambah Produk Laporan');
    $('#blah').attr('src', 'assets/img/no-image.png');
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
  });(

  $('#save-buku').click(function(){
    savedata(st);
  }))

  $('#save-kategori').click(function(){
    savekategori();
  })

});

function loadkategori()
{
  $.ajax({
    type:"post",
    dataType:"json",
    url:'getkategorilaporan',
    success:function(result){
      var html= '';
      var tab='';
      for(var i=0; i<result.length; i++){
        html += '<option value="'+result[i].nama+'">'+result[i].nama+'</option>';
      }
      $('#pilih_kategori').html(html);
    }
  })
}

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

    function loadkat(){

      $.ajax({
          type: 'post',
          dataType: 'json',
          url: 'getdata',
          data : {
                  param      : 'kategori_laporan',
                  type       : 'laporan'
           },
          success: function(result){
            
            if(result.code == 1){
                  var dt = $('#listkategori').DataTable({
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
                          { 'mDataProp': 'nama'},
                          { 'mDataProp': 'id'},
                          // { 'mDataProp': 'role'},
                      ],
                      order: [[0, 'ASC']],
                      aoColumnDefs:[
                        {
                          mRender: function (data, type, row){

                              var $rowData = '';
                              $rowData += `
                              <div class="btn-group">
                              <button type="button" class="btn btn-info">Action</button>
                              <button type="button" class="btn btn-info dropdown-toggle dropdown-icon" data-toggle="dropdown">
                                <span class="sr-only">Toggle Dropdown</span>
                              </button>
                              <div class="dropdown-menu" role="menu">
                                  <a class="dropdown-item" href="javascript:void(0)" onclick="editkat('`+row.id+`','`+row.nama+`')"><i class="far fa-edit"></i> Edit</a>
                                  <a class="dropdown-item" href="#" onclick="deletekat(`+row.id+`)"><i class="far fa-trash-alt"></i> Hapus</a>
                                </div>
                              </div>`;

                              return $rowData;
                          },
                          aTargets: [2]
                      },
                        //   {
                        //     mRender: function (data, type, row){
                        //         var $rowData = '';
                        //         var col = 12;
                                
                        //         // if (row.files.length == 2) {
                        //         //   col = 6;
                        //         // }else if (row.files.length > 2){
                        //         //   col = 4;
                        //         // }
                                
                        //         for( var key in row.files ) {
                        //           $rowData += `
                        //           <img id="" name="" class="img-fluid" src="`+row.files[key].path+'/'+row.files[key].filename+`" alt="">
                        //             `;
                        //         }
  
                        //         $rowData += '</div>';
                                
                        //         return $rowData;
                        //     },
                        //     aTargets: [1]
                        // },
                        //   {
                        //     mRender: function (data, type, row){
                        //         var $rowData = '';
                        //         if (row.tipe == 'link') {
                        //           $rowData += '<p>Link Eksternal</p>';
                        //           $rowData += '<p><i class="fa fa-globe"></i> <a target="_blank" href="'+row.keterangan+'" class="link-primary">klik disini</a></p>';
                        //         }else{
                        //           $rowData = row.keterangan;
                        //         }
                                
                        //         return $rowData;
                        //     },
                        //     aTargets: [3]
                        // },
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
    function loaddata(){

      $.ajax({
          type: 'post',
          dataType: 'json',
          url: 'getdata',
          data : {
                  param      : 'data_laporan',
                  type       : 'laporan'
           },
          success: function(result){
            
            if(result.code == 1){
                  var dt = $('#listbuku').DataTable({
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
                          { 'mDataProp': 'intro'},
                          { 'mDataProp': 'kategori'},
                          { 'mDataProp': 'kategori'},
                          { 'mDataProp': 'id'},
                          { 'mDataProp': 'id'},
                          // { 'mDataProp': 'role'},
                      ],
                      order: [[0, 'ASC']],
                      aoColumnDefs:[
                        // {
                        //   targets: [7],
                        //   visible: false
                        // },
                          {
                              mRender: function (data, type, row){
                                var $rowData = '';
                                
                                $rowData += `<p class="d-flex flex-column">
                                <span class="text-muted">`+row.kategori+`</span>
                                </p>`;

                                  return $rowData;
                              },
                              aTargets: [3]
                          },
                          {
                              mRender: function (data, type, row){
                                var id_file = row.files[0].id;
                                var path = row.files[0].path+'/'+row.files[0].filename;
                                
                                var stat = row.status;
                                var file = '';
                                var $rowData = '<div class="card"><div class="card-body">';
                                for( var key in row.files ) {
                                  file = row.files[key].path+'/'+row.files[key].filename;
                                  idfile = row.files[key].id;
                                  caption = row.files[key].caption;
                                  if (key == 0) {
                                    
                                    $rowData += `<div class="d-flex justify-content-start">
                                    <p class="text-dark text-sm mr-2">
                                    <i class="fa fa-book"></i>
                                    </p>
                                    <p class="d-flex flex-column">
                                    <a href="`+file+`" class="link-secondary">Baca Online</a>
                                    </p>
                                    </div>`;
                                  }else if(key == 1){
                                    $rowData += `<div class="d-flex justify-content-start">
                                    <p class="text-dark text-sm mr-2">
                                    <i class="fa fa-file-pdf"></i>
                                    </p>
                                    <p class="d-flex flex-column">
                                    <a href="`+file+`" class="link-primary">Download</a>
                                    </p>
                                    </div>`;

                                  }
                                }
                                // if(stat == 1){
                                //   var st = 'Publish'
                                //   var tex = 'text-success';
                                // }else{
                                //   var st = 'No Publish'
                                //   var tex = 'text-danger';
                                // }
                                $rowData += `<div class="d-flex justify-content-start">
                                <p class="text-dark text-sm mr-2">
                                <i class="far fa-calendar-alt"></i>
                                </p>
                                <p class="d-flex flex-column">
                                <span class="text-muted">`+row.tahun+`</span>
                                </p>
                                </div>`;;

                                  return $rowData;
                              },
                              aTargets: [4]
                          },
                          {
                            mRender: function (data, type, row){
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
                            },
                            aTargets: [5]
                        },
                        {
                          mRender: function (data, type, row){
                            var id_file = row.files[0].id;
                            var path = row.files[0].path+'/'+row.files[0].filename;
                            
                              var stat = row.status;
                              if(stat == 1){
                                var st = `<a class="dropdown-item" href="#" onclick="updatepublish(`+row.id+`,0)"><i class="fas fa-sign-out-alt"></i> No Publish</a>`
                              }else{
                                var st = `<a class="dropdown-item" href="#" onclick="updatepublish(`+row.id+`,1)"><i class="fas fa-sign-out-alt"></i> Publish</a>`;
                              }
                              var file = ''
                              for( var key in row.files ) {
                                if (key == 0) {
                                  file1 = row.files[key].path+'/'+row.files[key].filename;
                                  idfile1 = row.files[key].id;
                                  filename1 = row.files[key].filename;
                                }else if(key == 1){
                                  file2 = row.files[key].path+'/'+row.files[key].filename;
                                  idfile2 = row.files[key].id;
                                  filename2 = row.files[key].filename;
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
                                  <a class="dropdown-item" href="javascript:void(0)" onclick="editdong('`+row.id+`','`+row.judul+`','`+row.intro+`','`+row.tahun+`','`+row.kategori+`','`+row.stat+`','`+file1+`','`+file2+`','`+idfile1+`','`+idfile2+`', '`+filename1+`', '`+filename2+`')"><i class="far fa-edit"></i> Edit</a>
                                  <a class="dropdown-item" href="#" onclick="deleteData(`+row.id+`, `+idfile1+`, '`+file1+`',`+idfile2+`, '`+file2+`')"><i class="far fa-trash-alt"></i> Hapus</a>
                                  <div class="dropdown-divider"></div>
                                  `+st+`
                                </div>
                              </div>`;

                              return $rowData;
                          },
                          aTargets: [6]
                      },
                        //   {
                        //     mRender: function (data, type, row){
                        //         var $rowData = '';
                        //         var col = 12;
                                
                        //         // if (row.files.length == 2) {
                        //         //   col = 6;
                        //         // }else if (row.files.length > 2){
                        //         //   col = 4;
                        //         // }
                                
                        //         for( var key in row.files ) {
                        //           $rowData += `
                        //           <img id="" name="" class="img-fluid" src="`+row.files[key].path+'/'+row.files[key].filename+`" alt="">
                        //             `;
                        //         }
  
                        //         $rowData += '</div>';
                                
                        //         return $rowData;
                        //     },
                        //     aTargets: [1]
                        // },
                        //   {
                        //     mRender: function (data, type, row){
                        //         var $rowData = '';
                        //         if (row.tipe == 'link') {
                        //           $rowData += '<p>Link Eksternal</p>';
                        //           $rowData += '<p><i class="fa fa-globe"></i> <a target="_blank" href="'+row.keterangan+'" class="link-primary">klik disini</a></p>';
                        //         }else{
                        //           $rowData = row.keterangan;
                        //         }
                                
                        //         return $rowData;
                        //     },
                        //     aTargets: [3]
                        // },
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
                var table = $('#listbuku').DataTable();
    
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
      var intro = $('#intro').val();
      var tahun = $('#tahun').val();
      var kategori = $('#pilih_kategori').val();
      var status = $('#stat').val();

      var formData = new FormData();
      formData.append('id', id);
      formData.append('judul', judul);
      formData.append('intro', intro);
      formData.append('tahun',tahun);
      formData.append('kategori',kategori);
      
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

        formData.append('stat', stat);

        if(id){
          formData.append('idfile1', $('#idfile1').val());
          formData.append('idfile2', $('#idfile2').val());

          var baseurl = 'updatedatalaporan';
          var msg = 'Update Produk Laporan';

        }else{
          var baseurl = 'savedatalaporan';
          var msg = 'Tambah Produk Laporan';
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
                    kotaKab       : $("#kota-kab option:selected").val(),
                    role          : $("input[name='role']:checked").val(),
                    img           : img,
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

function deleteData(id, id_file1, path1, id_file2, path2){
  const swalWithBootstrapButtons = Swal.mixin({
    customClass: {
      confirmButton: 'btn btn-success btn-sm swal2-styled-custom',
      cancelButton: 'btn btn-danger btn-sm swal2-styled-custom'
    },
    buttonsStyling: false
  });

  swalWithBootstrapButtons.fire({
    title: 'Anda yakin, hapus Produk Laporan ini?',
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
      url: 'deletelaporan',
      data : {
              id    : id,
              id_file1    : id_file1,
              path1    : path1,
              id_file2    : id_file2,
              path2    : path2,
            },
      success: function(data)
      {
        Swal.fire({
          title: 'Sukses!',
          text: 'Hapus Produk Laporan',
          icon: 'success',
          showConfirmButton: false,
          timer: 1500
        }).then((results)=>{
          loaddata();
        });
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

    function editdong(id, judul, intro, tahun, kategori,status, path1, path2, idfile1, idfile2, filename1, filename2){
      $('#add-berita').trigger('click'),
      $('.modal-title').html('<i class="fas fa-images"></i> Edit Produk Laporan');
      $('#id').val(id);
      $('#idfile1').val(idfile1);
      $('#idfile2').val(idfile2);
      $('#lbl1').html(filename1);
      $('#lbl2').html(filename2);
      $('#judul').val(judul);
      $('#intro').val(intro);
      $('#tahun').val(tahun).trigger('change');
      $('#pilih_kategori').val(kategori).trigger('change');
      $("#stat").bootstrapSwitch('state', status == '1' ? true : false);
      $('#blah_1').attr('src', path1);
      $('#blah_2').attr('src', path2);
    
    }

    function updatepublish(id,stat){
      var formData = new FormData();
      formData.append('id', id);
      formData.append('stat', stat);
      
      $.ajax({
        type: 'post',
        url: 'updatelaporan',
        dataType: 'json',
        cache: false,
        contentType: false,
        processData: false,
        data: formData,
        async:false,
          success: function(result){
            Swal.fire({
              title: 'Sukses!',
              text: 'Status telah di ganti',
              icon: 'success',
              showConfirmButton: false,
              timer: 1500
            });

            $('#modal-default').modal('hide');
            loaddata();
          }
        });
    }
    
    function editkat(id,nama){
      Swal.fire({
        title: 'Edit Kategori',
        html:
          '<input id="swal-input1" class="swal2-input" value="'+id+'" hidden >' +
          '<input id="swal-input2" class="swal2-input" value="'+nama+'">',
        focusConfirm: false,
        showCancelButton: true,
        confirmButtonText: 'Edit',
        preConfirm: function() {
          return new Promise((resolve, reject)=>{
            resolve({
              id: $('#swal-input1').val(),
              nama: $('#swal-input2').val()
            });
          })
        }
      }).then((data)=>{
        var fdata = new FormData();
        fdata.append('id',data.value.id);
        fdata.append('nama',data.value.nama);
        fdata.append('table','kategori_laporan');
        updatekat(fdata);
      })
    }

    function updatekat(fd)
    {
      $.ajax({
        type:'post',
        dataType:'json',
        data:fd,
        processData:false,
        contentType:false,
        url:'updateglobal',
        success:function(result){
          loadkat();
          Swal.fire({
            title: 'Sukses!',
            text: 'Update kategori',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
          }).then((results)=>{
            loadkategori();
          });
        }
      })
    }

    function savekategori()
    {
      var fd = new FormData();
      fd.append('nama',$('#nama_kategori').val());
      fd.append('table','kategori_laporan');

      $.ajax({
        type:'post',
        dataType:'json',
        data:fd,
        processData:false,
        contentType:false,
        url:'saveglobal',
        success:function(result){
          loadkat();
          Swal.fire({
            title: 'Sukses!',
            text: 'Kategori berhasil ditambah',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
          }).then((results)=>{
            loadkategori();
          });;
        }
      })
    }

    
function deletekat(id){
  const swalWithBootstrapButtons = Swal.mixin({
    customClass: {
      confirmButton: 'btn btn-success btn-sm swal2-styled-custom',
      cancelButton: 'btn btn-danger btn-sm swal2-styled-custom'
    },
    buttonsStyling: false
  });

  swalWithBootstrapButtons.fire({
    title: 'Anda yakin, hapus Kategori ini?',
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
      url: 'deletekategori',
      data : {
              id    : id
            },
      success: function(data)
      {
        loadkat();
        Swal.fire({
          title: 'Sukses!',
          text: 'Hapus kategori',
          icon: 'success',
          showConfirmButton: false,
          timer: 1500
        }).then((results)=>{
          loadkategori();
        });;
      }
    });
  }
  })
}