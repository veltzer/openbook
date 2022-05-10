<%!
    import config.project
    import config.python
    import config.openbook
    import user.personal
    import config.git
    line = "=" * len(config.project.project_name)
%>${config.project.project_name_fancy}
${line}

build
-----
![build](https://github.com/veltzer/${config.project.project_name}/workflows/build/badge.svg)
* test_os: ${config.python.test_os}
* test_python: ${config.python.test_python}

version: ${config.git.git_last_tag}

## viewer version: ${config.openbook.pdfjs_version}
##
<%include file="../snipplets/main.md.mako" />

	${user.personal.personal_origin}, ${config.project.project_copyright_years}
