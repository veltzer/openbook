<%!
    import pydmt.helpers.project
    import pydmt.helpers.signature
    import pydmt.helpers.misc
    import pydmt.helpers.urls
    import config.project
    import config.personal
%><!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>${pydmt.helpers.project.get_name()}</title>
		<link rel="shortcut icon" href="favicon.ico"/>
		<meta name="Description" content="${config.project.description_long}"/>
		<meta name="Keywords" content="${config.personal.fullname}, ${config.personal.slug}, ${pydmt.helpers.project.get_name()}, ${', '.join(config.project.keywords)}"/>
	</head>
	<body>
		<h1>Welcome to the <i>${config.project.name_fancy}</i> web site</h1>

		<p>current version is ${pydmt.helpers.misc.get_version_str()}</p>

		<h2>A demo for the impatient is
			<a href="web/viewer.html?file=../output/openbook.pdf">here</a>
		</h2>
		<p>You can download the latest version of <b>${config.project.name_fancy}</b> from <a href="output/openbook.pdf">here</a>.</p>

		<p><b>${pydmt.helpers.project.get_name()}</b> is an open source project to build a free, high quality "real book"
		for Jazz musicians. A real book simply means a big book with lots of Jazz tunes or standards as they are more widely known. <b>${pydmt.helpers.project.get_name()}</b> will always remain free and is guarateed so by it's license. The goal of production is beautiful and lightweight postscript and PDF real books with Jazz tunes. The idea is that the end user can control the final output and decide if he/she wants lyrics, size of paper, transposition for trumpet, selection of tunes and more. In addition you can produce midi, mp3 and ogg outputs. The end user can also, obviously, modify add or remove tunes or use the tunes in <b>${pydmt.helpers.project.get_name()}</b> as the basis of arrangements.</p>

		<p>The project is developed by me, ${config.personal.fullname}, and you can contact me at <a href="mailto:${config.personal.email}">${config.personal.email}</a>. There is already a handful of contributors who contributed or are contributing to this project and you can see the ones that are contributing by name in the git changelog. Some are contributing anonymously because of copyright issues. Anyone is welcome to contribute anonymously or by name (it is your choice).</p>

		<p>The license for the project is currently ${config.project.license_type}. This is only so because I did not have time to think more deeply about the issue. It may change in the future as a result of future thinking on my part and the fact that I am the only copyright holder. The fact that the tunes inside the book have their own copyright holders complicates matters. In any case I am committed to keeping the project free in the free software sense and you are well within your rights to take a snapshot of it and continue developing it on your own when and if you feel that a future license selection does not match your expectations.</p>

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
		<p>Links to tools used by the <b>${pydmt.helpers.project.get_name()}</b> project:</p>
		<ul>
			<li>
			The git tool used as a source control system for <b>${pydmt.helpers.project.get_name()}</b> is <a title="git" href="http://git-scm.com/">here</a>
			</li>
			<li>
			The GNU make system used to build <b>${pydmt.helpers.project.get_name()}</b> is <a title="GNU make" href="http://www.gnu.org/s/make/">here</a>
			</li>
			<li>
			The python scripting language that is used to script <b>${pydmt.helpers.project.get_name()}</b> is <a title="python" href="http://python.org/">here</a>
			</li>
			<li>
			The mako templating engine for python that is used in <b>${pydmt.helpers.project.get_name()}</b> is <a title="mako" href="http://www.makotemplates.org/">here</a>
			</li>
			<li>
			The lilypond language and compiler used to develop the tunes in <b>${pydmt.helpers.project.get_name()}</b> is <a title="lilypond" href="http://lilypond.org/">here</a>
			</li>
			<li>
			The timidity tool used to convert from midi to wav and ogg in <b>${pydmt.helpers.project.get_name()}</b> is <a title="timidity++" href="http://timidity.sourceforge.net/">here</a>
			</li>
			<li>
			The lame tool used to encode midi to mp3 in <b>${pydmt.helpers.project.get_name()}</b> is <a title="lame" href="http://lame.sourceforge.net/">here</a>
			</li>
		</ul>
		<p>Some related <b>${pydmt.helpers.project.get_name()}</b> project links:</p>
		<ul>
			<li>
			The <b>${pydmt.helpers.project.get_name()}</b> github project is <a title="${pydmt.helpers.project.get_name()} github project" href="${pydmt.helpers.urls.get_website_source()}">here</a>
			</li>
			<li>
			The <b>${pydmt.helpers.project.get_name()}</b> web site for the project is <a title="${pydmt.helpers.project.get_name()} web site" href="${pydmt.helpers.urls.get_website()}">here</a>
			</li>
			<li>
			The <b>${pydmt.helpers.project.get_name()}</b> git clone link is <a title="${pydmt.helpers.project.get_name()} git clone link" href="${pydmt.helpers.urls.get_website_git()}">here</a>
			</li>
			<li>
			The latest stable pdf coming out of the <b>${pydmt.helpers.project.get_name()}</b> project is <a title="latest pdf" href="output/openbook.pdf">here</a>
			</li>
			<li>
			The latest stable postscript coming out of the <b>${pydmt.helpers.project.get_name()}</b> project is <a title="latest postscript" href="output/openbook.ps">here</a>
			</li>
			<li>
			The latest stable lilypond coming out of the <b>${pydmt.helpers.project.get_name()}</b> project is <a title="latest lilypond" href="output/openbook.ly">here</a>
			</li>
		</ul>
		<p>
			Copyright ${config.personal.fullname} © ${pydmt.helpers.signature.get_copyright_years_long()}
			<a href="mailto:${config.personal.email}">${config.personal.email}</a>
		</p>
	</body>
</html>
