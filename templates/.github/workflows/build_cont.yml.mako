<%!
    import config.python
%>name: build_cont
on: [push, pull_request]
jobs:
  build:
    name: Build on ${"${{ matrix.container }}"}
    runs-on: ubuntu-latest
    container: ${"${{ matrix.container }}"}
    strategy:
      matrix:
        container: ${config.python.test_container}
        # python-version: ${config.python.test_python}
    steps:
    - uses: actions/checkout@v2
    - name: run script
      run: bash ./scripts/build_on_docker.sh
