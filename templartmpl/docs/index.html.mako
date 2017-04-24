<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>${tdefs.project_name}</title>
		<link rel="shortcut icon" href="../static/favicon.ico"/>
		<meta name="Description" content="${tdefs.project_long_description}"/>
		<meta name="Keywords" content="${tdefs.personal_fullname}, ${tdefs.personal_slug}, ${tdefs.project_name}, ${', '.join(tdefs.project_keywords)}"/>
		${tdefs.project_google_analytics_snipplet}
	</head>
	<body>
		<h1>Welcome to the <i>${tdefs.project_name}</i> web site</h1>

		<p>current version is ${tdefs.git_lasttag}</p>

		<h2>A demo for the impatient...</h2>
		<p>If you are using chrome you need the Chrome PDF Viewer plugin enabled. With version up to 56 you go to chrome://plugins/
		and change the configuration of the pdf viewer. With newer chrome version you go to chrome://settings/ -
		Show advanced settings... - privacy - Content settings... - PDF Documents - Open PDF files in the default PDF viewer application.
		</p>
		<p>If you are using firefox you need to enable viewing pdf in the browser this way: preferences - applications - pdf - preview in firefox...</p>
		<object data="openbook.pdf" type="application/pdf" width="100%" height="1700"></object>
		<p>You can download the latest version of <b>${tdefs.project_name}</b> from <a href="openbook.pdf">here</a>.</p>

		<p><b>${tdefs.project_name}</b> is an open source project to build a free, high quality "real book"
		for Jazz musicians. A real book simply means a big book with lots of Jazz tunes or standards as they are more widely known. <b>${tdefs.project_name}</b> will always remain free and is guarateed so by it's license. The goal of production is beautiful and lightweight postscript and PDF real books with Jazz tunes. The idea is that the end user can control the final output and decide if he/she wants lyrics, size of paper, transposition for trumpet, selection of tunes and more. In addition you can produce midi, mp3 and ogg outputs. The end user can also, obviously, modify add or remove tunes or use the tunes in <b>${tdefs.project_name}</b> as the basis of arrangements.</p>

		<p>The project is developed by me, ${tdefs.personal_fullname}, and you can contact me at <a href="mailto:${tdefs.personal_email}">${tdefs.personal_email}</a>. There is already a handful of contributors who contributed or are contributing to this project and you can see the ones that are contributing by name in the git changelog. Some are contributing anonymously because of copyright issues. Anyone is welcome to contribute anonymously or by name (it is your choice).</p>

		<p>The license for the project is currently ${tdefs.project_license}. This is only so because I did not have time to think more deeply about the issue. It may change in the future as a result of future thinking on my part and the fact that I am the only copyright holder. The fact that the tunes inside the book have their own copyright holders complicates matters. In any case I am committed to keeping the project free in the free software sense and you are well within your rights to take a snapshot of it and continue developing it on your own when and if you feel that a future license selection does not match your expectations.</p>

		<p>Why did I start this ?</p>
		<ul>
			<li>
			I wanted to learn Jazz and a good way to do that is to write down the tunes (amongst many many other things).
			</li>
			<li>
			I wanted beautiful sheet music that I could fiddle with.
			</li>
			<li>
			I did not want to pay for the overly expensive real or fake books out there.
			</li>
			<li>
			I believe in free software and wanted free (in the sense of freedom) sheet music.
			</li>
			<li>
			Jazz is a prime example of a free type of art so combining it with free software seems a match made in heaven.
			</li>
			<li>
			Jazz musicians may need beautiful electronic Real books because electronic books are starting to be used by Jazz musicians both for practice and for performance.
			</li>
		</ul>
		<p>Future ideas include:</p>
		<ul>
			<li>
			supporting mobile reading formats like epub
			</li>
			<li>
			producing a mobile application for various platforms that musicians could use on their portable pads. This app would show them their music sheets and allow them to search for standards.
			</li>
		</ul>
		<p>Links to tools used by the <b>${tdefs.project_name}</b> project:</p>
		<ul>
			<li>
			The git tool used as a source control system for <b>${tdefs.project_name}</b> is <a title="git" href="http://git-scm.com/">here</a>
			</li>
			<li>
			The GNU make system used to build <b>${tdefs.project_name}</b> is <a title="GNU make" href="http://www.gnu.org/s/make/">here</a>
			</li>
			<li>
			The python scripting language that is used to script <b>${tdefs.project_name}</b> is <a title="python" href="http://python.org/">here</a>
			</li>
			<li>
			The mako templating engine for python that is used in <b>${tdefs.project_name}</b> is <a title="mako" href="http://www.makotemplates.org/">here</a>
			</li>
			<li>
			The lilypond language and compiler used to develop the tunes in <b>${tdefs.project_name}</b> is <a title="lilypond" href="http://lilypond.org/">here</a>
			</li>
			<li>
			The timidity tool used to convert from midi to wav and ogg in <b>${tdefs.project_name}</b> is <a title="timidity++" href="http://timidity.sourceforge.net/">here</a>
			</li>
			<li>
			The lame tool used to encode midi to mp3 in <b>${tdefs.project_name}</b> is <a title="lame" href="http://lame.sourceforge.net/">here</a>
			</li>
		</ul>
		<p>Some related <b>${tdefs.project_name}</b> project links:</p>
		<ul>
			<li>
			The <b>${tdefs.project_name}</b> github project is <a title="${tdefs.project_name} github project" href="${tdefs.project_website_source}">here</a>
			</li>
			<li>
			The <b>${tdefs.project_name}</b> web site for the project is <a title="${tdefs.project_name} web site" href="${tdefs.project_website}">here</a>
			</li>
			<li>
			The <b>${tdefs.project_name}</b> git clone link is <a title="${tdefs.project_name} git clone link" href="${tdefs.project_website_git}">here</a>
			</li>
			<li>
			The latest stable pdf coming out of the <b>${tdefs.project_name}</b> project is <a title="latest pdf" href="openbook.pdf">here</a>
			</li>
			<li>
			The latest stable postscript coming out of the <b>${tdefs.project_name}</b> project is <a title="latest postscript" href="openbook.ps">here</a>
			</li>
			<li>
			The latest stable lilypond coming out of the <b>${tdefs.project_name}</b> project is <a title="latest lilypond" href="openbook.ly">here</a>
			</li>
		</ul>
		<p>
			I would appreciate donations so that I could use my time to work on <b>${tdefs.project_name}</b> more.
			If you do donate and would like me to work on some specific tunes or features then be sure to mention them
			in your donation remark on paypal.
		</p>
		${tdefs.project_paypal_donate_button_snipplet}
		<p>
			Copyright ${tdefs.personal_fullname}, ${tdefs.project_copyright_years}
			<a href="mailto:${tdefs.personal_email}">${tdefs.personal_email}</a>
		</p>
	</body>
</html>
