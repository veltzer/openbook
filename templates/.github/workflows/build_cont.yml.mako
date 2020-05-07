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
    - name: Install system-wide dependencies
      run: |
        # update must be done first or it doesn't know anything about any package
        apt-get update
        # because tzdata is interactive
        export DEBIAN_FRONTEND=noninteractive
        apt-get -y install tzdata
        # this is the real installation
        apt-get install -y lilypond qpdf python3 python3-pip git python3-virtualenv
        dpkg --listfiles python3-virtualenv
        #virtualenv .venv
        #source .venv/bin/activate
        #python -m pip install --upgrade pip
        #pip install -r requirements.txt
        #make
        #make all_tunes
