<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  
  

  
	  <!-- New body template to add a custom footer block : ajp, Fri 10 Jun 2011 13:48:56 BST -->


  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
    <link rel="stylesheet" type="text/css" media="screen" href="/ome/chrome/agilo/stylesheet/agilo_theme.css" />
    <link rel="stylesheet" type="text/css" media="print" href="/ome/chrome/agilo/stylesheet/print.css" />
    <title>
      ubuntu-root-install.sh on FLIM – Attachment
     – OME
    </title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="search" href="/ome/search" />
        <link rel="help" href="/ome/wiki/TracGuide" />
        <link rel="alternate" href="/ome/raw-attachment/wiki/FLIM/ubuntu-root-install.sh" type="application/x-sh; charset=iso-8859-15" title="Original Format" />
        <link rel="up" href="/ome/wiki/FLIM" title="FLIM" />
        <link rel="start" href="/ome/wiki" />
        <link rel="stylesheet" href="/ome/chrome/common/css/code.css" type="text/css" /><link rel="stylesheet" href="/ome/chrome/agilo_common/css/licenseNotifier.css" type="text/css" /><link rel="stylesheet" href="/ome/chrome/agilo_pro/css/agilo_pro.css" type="text/css" /><link rel="stylesheet" href="/ome/chrome/agilo/stylesheet/agilo.css" type="text/css" />
        <link rel="shortcut icon" href="/ome/chrome/site/favicon.ico" type="image/x-icon" />
        <link rel="icon" href="/ome/chrome/site/favicon.ico" type="image/x-icon" />
      <link type="application/opensearchdescription+xml" rel="search" href="/ome/search/opensearch" title="Search OME" />
    <script type="text/javascript" src="/ome/chrome/common/js/jquery.js"></script><script type="text/javascript" src="/ome/chrome/common/js/babel.js"></script><script type="text/javascript" src="/ome/chrome/common/js/trac.js"></script><script type="text/javascript" src="/ome/chrome/common/js/search.js"></script><script type="text/javascript" src="/ome/chrome/agilo_common/js/licenseNotifier.js"></script><script type="text/javascript" src="/ome/chrome/agilo/js/sidebar.js"></script><script type="text/javascript" src="/ome/chrome/agilo/js/cookies.js"></script><script type="text/javascript" src="/ome/chrome/agilo/js/settings.js"></script><script type="text/javascript" src="/ome/chrome/agilo/js/collapse.js"></script><script type="text/javascript" src="/ome/chrome/agilo/js/ie-patches.js"></script>
    <!--[if lt IE 7]>
    <script type="text/javascript" src="/ome/chrome/common/js/ie_pre7_hacks.js"></script>
    <![endif]-->
    <script type="text/javascript" src="/ome/chrome/common/js/folding.js"></script><script type="text/javascript">
        jQuery(document).ready(function($) {
          $('#preview table.code').enableCollapsibleColumns($('#preview table.code thead th.content'));
        });
      </script>
	<script type="text/javascript" src="/ome/chrome/agilo/js/lib/jquery.form.js"></script>
    <script type="text/javascript" src="/ome/chrome/agilo/js/lib/jquery.cookie.js"></script>
	<script type="text/javascript" src="/ome/chrome/agilo/js/third_parties_hacks.js"></script>
	<script type="text/javascript" src="/ome/chrome/agilo/js/utilities.js"></script>
	<script type="text/javascript">
	//<![CDATA[
		// Initialize the variables right at the start, so other js can use it in document.ready handlers
		BASE_URL = "/ome";
		CHROME_URL = "/ome/chrome";
		// Normalise base url pattern so it also works with mod_python which can hickup on double slashes...
		if ((/\/$/).test(BASE_URL))
			BASE_URL = BASE_URL.slice(0, -1);
		// No caching of ajax. Ever. Especially in IE 7!
		$.ajaxSetup({cache: false});
		// If we use metadata we want to put json into the data attribute
		if ($.metadata)
			$.metadata.setType('attr', 'data');
		// Disable selection on the navigation
		$(document).ready(function() {
			setTimeout('if ($.fn.disableSelection) $(".menu").disableSelection()',500);
		});
	//]]>
	</script>
	    <link rel="stylesheet" type="text/css" href="/ome/chrome/site/style.css" />
	  </head>
	<body>
	<div class="menu">
	<form class="search" id="search_form" action="/ome/search" method="get">
	<label>Search</label>
	<input type="text" id="proj-search" name="q" size="18" value="" />
	</form>
        <div id="project_logo_container">
            <a id="logo" href="http://trac.openmicroscopy.org.uk/ome">
                <img src="/ome/chrome/site/my_logo.png" alt="OME" />
            </a>
        </div>
        <ul class="button group mainnav">
		                <li class="active"><a href="/ome/wiki" class="iconWiki">Wiki</a></li>
		                <li><a href="/ome/timeline" class="iconTimeline">Timeline</a></li>
		                <li><a href="/ome/roadmap" class="iconRoadmap">Roadmap</a></li>
		                <li><a href="/ome/browser" class="iconBrowser">Browse Source</a></li>
		                <li><a href="/ome/report" class="iconTickets">View Tickets</a></li>
		                <li><a href="/ome/search" class="iconSearch">Search</a></li>
		</ul>
        <ul class="button group metanav">
		                <li><a href="/ome/login" class="iconLogin">Login</a></li>
		                <li><a href="/ome/agilo-help">Help/Guide</a></li>
		                <li><a href="/ome/about" class="iconAbout">About Trac</a></li>
		                <li><a href="/ome/prefs" class="iconPrefs">Preferences</a></li>
			<li><a href="http://www.agile42.com/">agile42</a></li>
		</ul>
	</div>
	<div class="sidebar"><!-- TODO: make this a harmonica, or add an all toggle -->
	<!-- TODO: fix the empty space at the bottom. -->
		<label>Tickets</label>
		<ul class="tickets tree">
		</ul>
    <label>Wiki</label>
	<ul class="wiki tree">
	</ul>
	</div>
	<div class="main"><!-- Main Content -->
	<div id="ctxtnav" class="nav">
	<h2>Context Navigation</h2>
	<ul>
		<li class="first last"><a href="/ome/wiki/FLIM">Back to FLIM</a></li>
	</ul>
	<hr />
	</div>
    <div id="content" class="attachment">
        <h1><a href="/ome/wiki/FLIM">FLIM</a>: ubuntu-root-install.sh</h1>
        <table id="info" summary="Description">
          <tbody>
            <tr>
              <th scope="col">File ubuntu-root-install.sh,
                <span title="2229 bytes">2.2 KB</span>
                (added by dzmacdonald, <a class="timeline" href="/ome/timeline?from=2011-03-16T15%3A51%3A32Z&amp;precision=second" title="2011-03-16T15:51:32Z in Timeline">19 months</a> ago)</th>
            </tr>
            <tr>
              <td class="message searchable">
                <p>
ubuntu-root-install.sh
</p>

              </td>
            </tr>
          </tbody>
        </table>
        <div id="preview" class="searchable">
          
  <table class="code"><thead><tr><th class="lineno" title="Line numbers">Line</th><th class="content"> </th></tr></thead><tbody><tr><th id="L1"><a href="#L1">1</a></th><td>#!/bin/bash</td></tr><tr><th id="L2"><a href="#L2">2</a></th><td></td></tr><tr><th id="L3"><a href="#L3">3</a></th><td>OMERODIR=${OMERODIR:-"$1"}</td></tr><tr><th id="L4"><a href="#L4">4</a></th><td>OMERODIR=${OMERODIR:-"/"}</td></tr><tr><th id="L5"><a href="#L5">5</a></th><td></td></tr><tr><th id="L6"><a href="#L6">6</a></th><td>OMERODATADIR=${OMERODATADIR:-"$2"}</td></tr><tr><th id="L7"><a href="#L7">7</a></th><td>OMERODATADIR=${OMERODATADIR:-"/OMERO"}</td></tr><tr><th id="L8"><a href="#L8">8</a></th><td></td></tr><tr><th id="L9"><a href="#L9">9</a></th><td>set -e</td></tr><tr><th id="L10"><a href="#L10">10</a></th><td>set -u</td></tr><tr><th id="L11"><a href="#L11">11</a></th><td>set -x</td></tr><tr><th id="L12"><a href="#L12">12</a></th><td></td></tr><tr><th id="L13"><a href="#L13">13</a></th><td>##</td></tr><tr><th id="L14"><a href="#L14">14</a></th><td># Setup Java sources in Ubuntu</td></tr><tr><th id="L15"><a href="#L15">15</a></th><td>#</td></tr><tr><th id="L16"><a href="#L16">16</a></th><td>add_sources(){</td></tr><tr><th id="L17"><a href="#L17">17</a></th><td>    echo "$1" | sudo tee -a /etc/apt/sources.list</td></tr><tr><th id="L18"><a href="#L18">18</a></th><td>}</td></tr><tr><th id="L19"><a href="#L19">19</a></th><td>add_sources "deb http://archive.canonical.com/ubuntu lucid partner"</td></tr><tr><th id="L20"><a href="#L20">20</a></th><td>add_sources "deb-src http://archive.canonical.com/ubuntu lucid partner"</td></tr><tr><th id="L21"><a href="#L21">21</a></th><td></td></tr><tr><th id="L22"><a href="#L22">22</a></th><td>##</td></tr><tr><th id="L23"><a href="#L23">23</a></th><td># Update core system and apt-cache</td></tr><tr><th id="L24"><a href="#L24">24</a></th><td>#</td></tr><tr><th id="L25"><a href="#L25">25</a></th><td>aptitude --assume-yes update</td></tr><tr><th id="L26"><a href="#L26">26</a></th><td>aptitude --assume-yes dist-upgrade</td></tr><tr><th id="L27"><a href="#L27">27</a></th><td></td></tr><tr><th id="L28"><a href="#L28">28</a></th><td>##</td></tr><tr><th id="L29"><a href="#L29">29</a></th><td># Install Core applications</td></tr><tr><th id="L30"><a href="#L30">30</a></th><td>#</td></tr><tr><th id="L31"><a href="#L31">31</a></th><td>aptitude --assume-yes install build-essential</td></tr><tr><th id="L32"><a href="#L32">32</a></th><td>aptitude --assume-yes install subversion</td></tr><tr><th id="L33"><a href="#L33">33</a></th><td></td></tr><tr><th id="L34"><a href="#L34">34</a></th><td>##</td></tr><tr><th id="L35"><a href="#L35">35</a></th><td># Intall Java</td></tr><tr><th id="L36"><a href="#L36">36</a></th><td>#</td></tr><tr><th id="L37"><a href="#L37">37</a></th><td>echo sun-java6-jdk shared/accepted-sun-dlj-v1-1 select true | /usr/bin/debconf-set-selections</td></tr><tr><th id="L38"><a href="#L38">38</a></th><td>echo sun-java6-jre shared/accepted-sun-dlj-v1-1 select true | /usr/bin/debconf-set-selections</td></tr><tr><th id="L39"><a href="#L39">39</a></th><td>aptitude --assume-yes install java-package sun-java6-bin sun-java6-demo sun-java6-fonts sun-java6-jdk sun-java6-plugin sun-java6-jre sun-java6-source</td></tr><tr><th id="L40"><a href="#L40">40</a></th><td>echo 'JAVA_HOME="/usr/lib/jvm/java-6-sun"' | sudo tee -a /etc/environment</td></tr><tr><th id="L41"><a href="#L41">41</a></th><td>echo 'LD_LIBRARY_PATH="/usr/lib/jvm/java-6-sun/jre/lib/amd64/server"' | sudo tee -a /etc/bash.bashrc</td></tr><tr><th id="L42"><a href="#L42">42</a></th><td>echo "export LD_LIBRARY_PATH" | sudo tee -a /etc/bash.bashrc</td></tr><tr><th id="L43"><a href="#L43">43</a></th><td></td></tr><tr><th id="L44"><a href="#L44">44</a></th><td></td></tr><tr><th id="L45"><a href="#L45">45</a></th><td>##</td></tr><tr><th id="L46"><a href="#L46">46</a></th><td># Install Python</td></tr><tr><th id="L47"><a href="#L47">47</a></th><td>#</td></tr><tr><th id="L48"><a href="#L48">48</a></th><td>aptitude --assume-yes install cython python-numpy python-scipy python-setuptools python-numeric python-matplotlib python-wxgtk2.8 python-decorator python-mysqldb python-nose python-dev</td></tr><tr><th id="L49"><a href="#L49">49</a></th><td>apt-get --assume-yes install python-distutils-extra</td></tr><tr><th id="L50"><a href="#L50">50</a></th><td>apt-get --assume-yes install python-tables</td></tr><tr><th id="L51"><a href="#L51">51</a></th><td>apt-get --assume-yes install python-imaging</td></tr><tr><th id="L52"><a href="#L52">52</a></th><td></td></tr><tr><th id="L53"><a href="#L53">53</a></th><td>##</td></tr><tr><th id="L54"><a href="#L54">54</a></th><td># Install Ice</td></tr><tr><th id="L55"><a href="#L55">55</a></th><td>#</td></tr><tr><th id="L56"><a href="#L56">56</a></th><td>apt-get --assume-yes install zeroc-ice33</td></tr><tr><th id="L57"><a href="#L57">57</a></th><td></td></tr><tr><th id="L58"><a href="#L58">58</a></th><td>##</td></tr><tr><th id="L59"><a href="#L59">59</a></th><td># Install Postgres</td></tr><tr><th id="L60"><a href="#L60">60</a></th><td>#</td></tr><tr><th id="L61"><a href="#L61">61</a></th><td>apt-get --assume-yes install postgresql</td></tr><tr><th id="L62"><a href="#L62">62</a></th><td></td></tr><tr><th id="L63"><a href="#L63">63</a></th><td>##</td></tr><tr><th id="L64"><a href="#L64">64</a></th><td># Install X and Gnome</td></tr><tr><th id="L65"><a href="#L65">65</a></th><td>#</td></tr><tr><th id="L66"><a href="#L66">66</a></th><td>apt-get --assume-yes install gdm</td></tr><tr><th id="L67"><a href="#L67">67</a></th><td>apt-get --assume-yes install xinit</td></tr><tr><th id="L68"><a href="#L68">68</a></th><td></td></tr><tr><th id="L69"><a href="#L69">69</a></th><td>##</td></tr><tr><th id="L70"><a href="#L70">70</a></th><td># Install Apache, Django and webclient apps</td></tr><tr><th id="L71"><a href="#L71">71</a></th><td>#</td></tr><tr><th id="L72"><a href="#L72">72</a></th><td>apt-get --assume-yes install apache2</td></tr><tr><th id="L73"><a href="#L73">73</a></th><td>#apt-get --assume-yes install python-django</td></tr><tr><th id="L74"><a href="#L74">74</a></th><td>apt-get --assume-yes install libapache2-mod-fastcgi</td></tr><tr><th id="L75"><a href="#L75">75</a></th><td>apt-get --assume-yes install links</td></tr><tr><th id="L76"><a href="#L76">76</a></th><td></td></tr><tr><th id="L77"><a href="#L77">77</a></th><td></td></tr><tr><th id="L78"><a href="#L78">78</a></th><td>##</td></tr><tr><th id="L79"><a href="#L79">79</a></th><td># Install OMERO</td></tr><tr><th id="L80"><a href="#L80">80</a></th><td>#</td></tr><tr><th id="L81"><a href="#L81">81</a></th><td></td></tr><tr><th id="L82"><a href="#L82">82</a></th><td></td></tr><tr><th id="L83"><a href="#L83">83</a></th><td>##</td></tr><tr><th id="L84"><a href="#L84">84</a></th><td># Set up omero</td></tr><tr><th id="L85"><a href="#L85">85</a></th><td>#</td></tr><tr><th id="L86"><a href="#L86">86</a></th><td>mkdir -p $OMERODATADIR</td></tr><tr><th id="L87"><a href="#L87">87</a></th><td>mkdir -p $OMERODIR/Client</td></tr><tr><th id="L88"><a href="#L88">88</a></th><td>mkdir -p $OMERODIR/Server</td></tr><tr><th id="L89"><a href="#L89">89</a></th><td></td></tr><tr><th id="L90"><a href="#L90">90</a></th><td>chown -R omero $OMERODATADIR</td></tr><tr><th id="L91"><a href="#L91">91</a></th><td>chown -R omero $OMERODIR/Client</td></tr><tr><th id="L92"><a href="#L92">92</a></th><td>chown -R omero $OMERODIR/Server</td></tr></tbody></table>

        </div>
    </div>
    <div id="altlinks">
      <h3>Download in other formats:</h3>
      <ul>
        <li class="last first">
          <a rel="nofollow" href="/ome/raw-attachment/wiki/FLIM/ubuntu-root-install.sh">Original Format</a>
        </li>
      </ul>
    </div>
	<div id="bottom">
	<p><span class="agilo_version">1.3.2-PRO</span> © 2008-2010
	<a href="http://www.agile42.com/" target="_blank">agile42</a> all
	rights reserved
        (this page was served in: 0.39257 sec.)
    </p>
	</div>
	</div>
		<div class="ome-footer">
			<p>
			  <acronym title="Copyright">©</acronym> 2000-2012 University of
			  Dundee &amp; Open Microscopy Environment. All Rights Reserved.
			  <a href="/ome/wiki/CopyrightAndLicense">…</a><br />
			  OME source code is available under the <a href="/ome/wiki/CopyrightAndLicense">
			  GNU General public license</a> or through commercial license from
			<a href="http://www.glencoesoftware.com/">Glencoe Software</a>
		  </p>
		</div>
		<div class="left-ribbon-holder">
			<img id="left-hire-ribbon" src="https://www.openmicroscopy.org/site/art/were-hiring-ribbon-100x100.png" usemap="#left-hire-ribbon-map" />
			<map id="_left-hire-ribbon-map" name="left-hire-ribbon-map">
				<area shape="poly" coords="0,63,63,0,87,0,0,87," href="https://www.openmicroscopy.org/site/community/jobs" alt="We're Hiring!" title="OME Jobs" />
				<area shape="poly" coords="0,0,0,60,60,0," href="/ome" />
				<area shape="poly" coords="90,0,100,0,100,70,28,70," href="/ome" />
			</map>
		</div>
	  </body>
</html>