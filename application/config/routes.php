<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] = 'views';+
$route['404_override'] = 'views/login';
$route['translate_uri_dashes'] = FALSE;

$route['^(login)(/:any)?$'] = "views/$0";
$route['^(dashboard)(/:any)?$'] = "views/$0";
$route['^(berita)(/:any)?$'] = "views/$0";
$route['^(poster|foto|video)(/:any)?$'] = "views/$0";
$route['^(profile|infobalai|kontak|banner|runningtext|bukuprofile|infografis|agenda|produklaporan)(/:any)?$'] = "views/$0";
$route['users'] = 'views/listusers';

$route['^(logout)(/:any)?$'] = "auth/$0";
$route['^(register)(/:any)?$'] = "auth/$0";
$route['^(cekusername)(/:any)?$'] = "auth/$0";

$route['getdata'] = 'jsondata/getdata';
$route['getkategoriprofil'] = 'jsondata/getkategoriprofil';
$route['getkategoriprofils'] = 'jsondata/getkategoriprofils';
$route['getkategorilaporan'] = 'jsondata/getkategorilaporan';
$route['getkategorilaporans'] = 'jsondata/getkategorilaporans';
$route['getdatausers'] = 'jsondata/getdatausers';
$route['^(savedataberita|savedataprofile|savedataposter|savedatafoto|savedatabalai|savedatabanner|savedatagrafis|savedataagenda|savedatatext|savedatabuku|savedatalaporan)(/:any)?$'] = "jsondata/$0";
$route['^(saveglobal|updateglobal)(/:any)?$'] = "jsondata/$0";
$route['^(deleteberita)(/:any)?$'] = 'jsondata/$0';
$route['^(updateberita|updatebanner|updategrafis|updateagenda|updatetext|updatebuku|updatelaporan|updatevideo)(/:any)?$'] = 'jsondata/$0';
$route['^(updatedataberita|updatedatabanner|updatedatagrafis|updatedataagenda|updatedatatext|updatedatabuku|updatedatalaporan)(/:any)?$'] = 'jsondata/$0';
$route['^(updatedataposter)(/:any)?$'] = 'jsondata/$0';
$route['^(updateposter)(/:any)?$'] = 'jsondata/$0';
$route['^(deletefoto|deleteposter|deletebanner|deletetext|deletebuku|deletekategori|deletelaporan|deletekategorilaporan|deletevideo|deleteagenda)(/:any)?$'] = 'jsondata/$0';

$route['^(saveUser)(/:any)?$'] = 'sys/$0';
$route['^(updateUser)(/:any)?$'] = 'sys/$0';
$route['^(deleteuser)(/:any)?$'] = 'sys/$0';
$route['^(loadsatker)(/:any)?$'] = 'sys/$0';

