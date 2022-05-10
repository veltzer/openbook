<%!
    import config.python
    import pydmt.helpers.python
%>name: build
on: [push, pull_request, workflow_dispatch]
jobs:
  build:
    runs-on: ${"${{ matrix.os }}"}
    strategy:
      matrix:
        os: ${pydmt.helpers.python.get_list_quoted(config.python.test_os)}
        python-version: ${pydmt.helpers.python.get_list_quoted(config.python.test_python)}
    steps:
    - name: checkout
      uses: actions/checkout@v3
    - name: python ${"${{ matrix.python-version }}"}
      uses: actions/setup-python@v3
      with:
        python-version: ${"${{ matrix.python-version }}"}
    - name: bootstrap
      run: python -m pip install pydmt pymakehelper pyclassifiers
    - name: pydmt
      run: pydmt build --dev False
