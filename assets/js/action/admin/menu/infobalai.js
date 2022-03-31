$(function () {

  console.log('You are running jQuery version: ' + $.fn.jquery);
  $('.summernote').summernote({
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

  $('#listfoto').DataTable();
  
  $('#modal-default').on('show.bs.modal', function(){
  })

  $('.bootstrap-switch-handle-on').html('Ya');
  $('.bootstrap-switch-handle-off').html('Tidak');

  $('#info > a').attr('class','nav-link active');
  $('#info').attr('class','nav-item menu-is-opening menu-open');
  $('#infobalai > a').attr('class','nav-link active');
  $('#infobalai > a > i').addClass('text-info');

  $('#add-foto').on('click', function(){
    $('#modal-default').modal({
      show: true
    });
    $('#id').val('');
    $('.modal-title').html('<i class="fas fa-photo-video"></i> Tambah Foto');
    $('#username').attr('disabled', false);
    $('#password').attr('disabled', false);
    $("[name='user-input']").val('');
    // $("#kota-kab").select2('data', {}).trigger('change');
    $('#kota-kab').val(0).trigger('change');
    $('#blah').attr('src', 'assets/img/no-image.png');
    $('label[for="foto-user"]').text('Pilih Foto');
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

  $('#save-balai').click(function(){
    savedata();
  })

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
                    param      : 'data_balai',
             },
            success: function(result){
              
              if(result.code == 1){
                var count = result.data.length;
                var index = count - 1;
                $('#idnya').val(result['data'][index].id);
                $('#kategori').val(result['data'][index].kategori).trigger('change');
                $('#linkgeo').val(result['data'][index].linkgeo);
                $('#jml_pns').val(result['data'][index].jml_pns);
                $('#jml_nonpns').val(result['data'][index].jml_nonpns);
                $('#aset_terimakan').val(result['data'][index].aset_terimakan);
                $('#aset_proses').val(result['data'][index].aset_proses);
                $('#hu').val(result['data'][index].hu);
                $('#mta').val(result['data'][index].mta);
                $('#toilet').val(result['data'][index].toilet);
                $('#jml_orang').val(result['data'][index].jml_orang);
              }else{
                $('#jml_pns').val('0');
                $('#jml_nonpns').val('0');
                $('#aset_terimakan').val('0');
                $('#aset_proses').val('0');
                $('#hu').val('0');
                $('#mta').val('0');
                $('#toilet').val('0');
                $('#jml_orang').val('0');
              }

            }
        });
    }

    function savedata(st){
      var kategori = $('#kategori').val();
      var linkgeo = $('#linkgeo').val();
      var jml_pns = $('#jml_pns').val();
      var jml_nonpns = $('#jml_nonpns').val();
      var aset_terimakan = $('#aset_terimakan').val();
      var aset_proses = $('#aset_proses').val();
      var hu = $('#hu').val();
      var mta = $('#mta').val();
      var toilet = $('#toilet').val();
      var jml_orang = $('#jml_orang').val();
    
      var formData = new FormData();
      formData.append('kategori', kategori);
      formData.append('linkgeo', linkgeo);
      formData.append('jml_pns', jml_pns);
      formData.append('jml_nonpns', jml_nonpns);
      formData.append('aset_terimakan', aset_terimakan);
      formData.append('aset_proses', aset_proses);
      formData.append('hu', hu);
      formData.append('mta', mta);
      formData.append('toilet', toilet);
      formData.append('jml_orang', jml_orang);
      var baseurl = 'savedatabalai';
      var msg = 'Tambah Info Balai';
    
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
              loaddata();
              // loaddatauser();
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