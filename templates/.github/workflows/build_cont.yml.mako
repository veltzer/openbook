<%!
    import config.python
%>name: build_cont
on: [push, pull_request, workflow_dispatch]
jobs:
  build:
    name: Build on ${"${{ matrix.container }}"}
    runs-on: ubuntu-latest
    container: ${"${{ matrix.container }}"}
    strategy:
      matrix:
        container: ${config.python.test_container}
        python-version: ${config.python.test_python}
    steps:
    - name: checkout
      uses: actions/checkout@v3
    - name: python ${"${{ matrix.python-version }}"}
      uses: actions/setup-python@v3
      with:
        python-version: ${"${{ matrix.python-version }}"}
    - name: bootstrap os
      run: |
        apt-get update --yes --quiet
        apt-get install --yes --quiet python3-openssl
    - name: bootstrap
      run: python -m pip install pydmt pymakehelper pyclassifiers
    - name: pydmt
      run: pydmt build --dev False
    - name: make
      run: pymakehelper run_make
