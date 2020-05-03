<%!
    import config.project
    import user.personal
    import config.git
    line = "=" * len(config.project.project_name)
%>${config.project.project_name_fancy}
${line}

![build](https://github.com/veltzer/${config.project.project_name}/workflows/build/badge.svg)

version: ${config.git.git_last_tag}

${config.project.project_long_description}

${config.project.project_description}

	${user.personal.personal_origin}, ${config.project.project_copyright_years}
