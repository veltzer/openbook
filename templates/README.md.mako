<%!
    import config.project
    import config.personal
    import config.git
%>${config.project.project_name}
${'=' * len(config.project.project_name)}

version: ${config.git.git_last_tag}

${config.project.project_long_description}

${config.project.project_description}

	${config.personal.personal_origin}, ${config.project.project_copyright_years}
