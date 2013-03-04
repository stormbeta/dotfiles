<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: Undo Tree</title><link rel="alternate" type="application/wiki" title="Editar esta página" href="http://www.emacswiki.org/emacs-es?action=edit;id=UndoTree" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs-es?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: UndoTree" href="http://www.emacswiki.org/emacs-es?action=rss;rcidonly=UndoTree" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for UndoTree only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=UndoTree" />
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-2101513-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></head><body class="http://www.emacswiki.org/emacs-es"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs-es/MapaDelSitio"><img class="logo" src="/emacs_logo.png" alt="[Inicio]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs-es/MapaDelSitio">MapaDelSitio</a> <a class="local" href="http://www.emacswiki.org/emacs-es/CambiosRecientes">CambiosRecientes</a> <a class="local" href="http://www.emacswiki.org/emacs-es/Noticias">Noticias</a> <a class="local" href="http://www.emacswiki.org/emacs-es/%c3%81reaElisp">ÁreaElisp</a> <a class="local" href="http://www.emacswiki.org/emacs-es/WikiC%c3%b3mo">WikiCómo</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<h1><a title="Clic para buscar Referer a esta página" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22UndoTree%22">UndoTree</a></h1></div><div class="wrapper"><div class="content browse"><div class="toc"><h2>Contents</h2><ol><li><a href="#toc1">About</a></li><li><a href="#toc2">Downloading</a></li><li><a href="#toc3">Contributing</a></li><li><a href="#toc4">Screenshot</a></li></ol></div><h2 id="toc1">About</h2><p>Emacs has a powerful undo system. Unlike the standard undo/redo system in most software, it allows you to recover <em>any</em> past state of a buffer (whereas the standard undo/redo system can lose past states as soon as you redo). However, this power comes at a price: many people find Emacs&#x2019; undo system confusing and difficult to use, spawning a number of packages that replace it with the less powerful but more intuitive undo/redo system (see <a class="local" href="http://www.emacswiki.org/emacs-es/CategoryUndo">CategoryUndo</a>).</p><p>Both the loss of data with standard undo/redo, and the confusion of Emacs&#x2019; undo, stem from trying to treat undo history as a linear sequence of changes. It&#x2019;s not. The <code>undo-tree-mode</code> provided by this package replaces Emacs&#x2019; undo system with a system that treats undo history as what it is: a branching tree of changes. This simple idea allows the more intuitive behaviour of the standard undo/redo system to be combined with the power of never losing any history. An added side bonus is that undo history can in some cases be stored more efficiently, allowing more changes to accumulate before Emacs starts discarding history.</p><p>It gets better. You don&#x2019;t have to imagine the undo tree, because <code>undo-tree-mode</code> includes an undo-tree visualizer which draws it for you, and lets you browse around the undo history.</p><p>The only downside to this more advanced yet simpler undo system is that it was inspired by Vim. But, after all, most successful religions steal the best ideas from their competitors!</p><p>For more information, see the Commentary at the top of the <code>undo-tree.el</code> file. (Note that <code>undo-tree-mode</code> does not yet support undo-in-region. Support for this is planned for a future version.)</p><h2 id="toc2">Downloading</h2><p>The latest &#x201c;stable&#x201d; version (version 0.3.2, released January 2012) can be obtained from:</p><ul><li>Undo-tree package download: <a class="url http" href="http://www.dr-qubit.org/download.php?file=undo-tree/undo-tree.el">http://www.dr-qubit.org/download.php?file=undo-tree/undo-tree.el</a></li><li>Web-site: <a class="url http" href="http://www.dr-qubit.org/emacs.php#undo-tree">http://www.dr-qubit.org/emacs.php#undo-tree</a></li></ul><p>If you want to live on the bleeding edge, the latest &#x201c;development&#x201d; version can be found in a git repository located at:</p><ul><li>Undo-tree git repository: <a class="url http" href="http://www.dr-qubit.org/git/undo-tree.git">http://www.dr-qubit.org/git/undo-tree.git</a></li></ul><p>This is a git repository, <em>not</em> a web page. To grab the latest development version, clone the repository using something like:</p><pre>    git clone http://www.dr-qubit.org/git/undo-tree.git undo-tree</pre><h2 id="toc3">Contributing</h2><p>Please send bug reports and suggestions to <a class="url mailto outside" href="mailto:toby-undo-tree@dr-qubit.org">toby-undo-tree@dr-qubit.org</a> (you can post them here as well if you like, of course). I don&#x2019;t check this page regularly, so anything not emailed to me is likely to languish here unnoticed for some time.</p><p>If you have code you would like to contribute to undo-tree, either send a patch against the latest development version to <a class="url mailto outside" href="mailto:toby-undo-tree@dr-qubit.org">toby-undo-tree@dr-qubit.org</a>, or better still, use git, rebase your work against the latest git HEAD, and let me know where to find your clone of the undo-tree repository so that I can pull your changes.</p><p>&#x2013; <a class="local" href="http://www.emacswiki.org/emacs-es/TobyCubitt">TobyCubitt</a></p><h2 id="toc4">Screenshot</h2><p><a class="image" href="http://www.emacswiki.org/emacs-es/UndoTreeScreenshot"><img class="upload" src="http://www.emacswiki.org/pics/static/UndoTreeScreenshot.png" alt="UndoTreeScreenshot" /></a></p><hr /><p><a class="local" href="http://www.emacswiki.org/emacs-es/CategoryUndo">CategoryUndo</a></p></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs-es/MapaDelSitio">MapaDelSitio</a> <a class="local" href="http://www.emacswiki.org/emacs-es/CambiosRecientes">CambiosRecientes</a> <a class="local" href="http://www.emacswiki.org/emacs-es/Noticias">Noticias</a> <a class="local" href="http://www.emacswiki.org/emacs-es/%c3%81reaElisp">ÁreaElisp</a> <a class="local" href="http://www.emacswiki.org/emacs-es/WikiC%c3%b3mo">WikiCómo</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs-es?action=translate;id=UndoTree;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Añadir traducción</a></span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Clic para editar esta página" rel="nofollow" href="http://www.emacswiki.org/emacs-es?action=edit;id=UndoTree">Editar esta página</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs-es?action=history;id=UndoTree">Ver otras revisiones</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs-es?action=admin;id=UndoTree">Administración</a></span><span class="time"><br /> Última vez editado 2012-01-03 19:48 UTC por <a class="author" title="desde 236.pool85-49-100.dynamic.orange.es" href="http://www.emacswiki.org/emacs-es/TobyCubitt">TobyCubitt</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs-es?action=browse;diff=2;id=UndoTree">(diff)</a></span><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
