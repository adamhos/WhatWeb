##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "EMC-Documentum-Webtop" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-14
version "0.1"
description "EMC Documentum Webtop is a browser-based interface that provides access to the EMC Documentum repository and content management services. - Homepage: http://www.emc.com/products/detail/software2/webtop.htm"

# 40 for "Login Name" Repository Webtop intitle:login
# 21 for "Login Name" Repository Webtop intitle:login inurl:component

# Dorks #
dorks [
'"Login Name" Repository Webtop intitle:login inurl:component'
]

# Examples #
examples %w|
documentum.kbr.com/webtop/component/main
www.kidzaniaarchive.com/kidzania/component/main
ep-edms-hq.omv.com/edms_admin/component/main
edms.frep-ipmt.com.cn/webtop/component/main
202.57.41.61:8080/webtop/component/
dctm.tsgrp.com/da/component/main
dctm.smoe.com/webtop/component/main
docs.nuvasive.com/webtop/component/main
edm.its.state.nc.us/webtop/component/main
usa22.usa-extra.com/webtop/component/main
products.hkmci.com/connectors-doc/jk2
216.74.29.106/dcm/component/main
unidadamerica.net/webtop/component/main
webtop.deere.com/webtop/dtir:/Website/wt_test3.html
apps.astralconsulting.com.au/webtop/
webtop.cerpzone.org
edm.bayer.de/webtop/
dms.privacycommission.be/docu/component/
www.cerpzone.info/webtop/
subcon.dweng.co.kr/dms/component/login
|

# Matches #
matches [

# body
{ :certainty=>75, :text=>"<body  marginwidth='0' topmargin='40' bottommargin='0' class='contentBackground' leftmargin='0' rightmargin='0' marginheight='40'>" },

# select name='Login_docbase_0'
{ :text=>"<select name='Login_docbase_0' id='DocbaseName' title=\"Repository\" size='0' class=defaultDropdownListStyle onchange='setKeys(event);" },

# Repository span
{ :text=>'<td scope="row" align=\'right\' class="fieldlabel" height="30"><span  class=\'defaultLabelStyle\'>Repository</span></td><td class="defaultcolumnspacer">:&nbsp;</td>' },

# td nowrap class="logintitletext"
{ :text=>'<td nowrap class="logintitletext" height="23" valign="top"><span  class=\'dialogTitle\'>Webtop Login' },

# JavaScript g_virtualRoot
{ :text=>'<script type="text/javascript">var g_virtualRoot = "/webtop";</script>' },

# input name='MyLogin_username_0'
{ :text=>"<td><input type='text' name='MyLogin_username_0' id='LoginUsername' title=\"Login Name\" size='40' onkeypress=\"handleKeyPress(event)\"></td>" },

# Redirect Page # body onload
{ :regexp=>/<script type="text\/javascript" src='\/webtop\/index\.js'><\/script>[\s]+<\/head>[\s]+<body onload='doRedirect\("\/component\/main"\)'>[\s]+<\/body>[\s]+<\/html>/ },

# Version Detection
{ :version=>/<div id="logo"><span  class='defaultLabelStyle'>Webtop<\/span>[\s]?&nbsp;<span  class='dialogTitleVersion'>([^<]+)<\/span>/ },

]

end

