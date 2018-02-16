<%!
    import config.project
    import config.personal
    import config.git
    line = "=" * len(config.project.project_name)
%>${config.project.project_name}
${line}

version: ${config.git.git_last_tag}

${config.project.project_long_description}

${config.project.project_description}

	${config.personal.personal_origin}, ${config.project.project_copyright_years}
