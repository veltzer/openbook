<%!
    import pydmt.helpers.project
    import pydmt.helpers.misc
    import pydmt.helpers.signature
    import pydmt.helpers.urls
    import config.project
    import config.personal
    import os.path
    import glob
    import yaml
%>## ${pydmt.helpers.project.get_name()}

version: ${pydmt.helpers.misc.get_version_str()}

description: ${config.project.description_short}

website: ${pydmt.helpers.urls.get_website()}

${"##"} build

<%
	action_files = glob.glob('.github/workflows/*.yml')
	for action_file in action_files:
		with open(action_file, 'r') as stream:
			action_name=yaml.safe_load(stream)["name"]
			context.write(f"![{action_name}](https://github.com/{config.personal.github_username}/{pydmt.helpers.project.get_name()}/workflows/{action_name}/badge.svg)")
%>

% if hasattr(config.project, "description_long"):
${config.project.description_long}
% endif

${"##"} contact

chat with me at [![gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/veltzer/mark.veltzer)

% if os.path.isfile("snipplets/main.md.mako"):
<%include file="../snipplets/main.md.mako" />
% endif
${config.personal.fullname}, Copyright © ${pydmt.helpers.signature.get_copyright_years_long()}
