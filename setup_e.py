'''
@author Kurt Matarese
Note: must be run with sudo, currently only setup for Fedora, assumes bash.
Also does not install cogo code yet.
'''

import argparse
import getpass
import os
import shutil
import subprocess
import sys

from distutils.sysconfig import get_python_lib

GENERAL_INSTALL_REQS = [
    'epel-release','python-pip','bash-completion', 'colordiff', 'expect', 'git', 'git-svn', 'subversion',
    'screen', 'wget', 'libxml2-devel', 'libxslt-devel', 'freetype',
    'freetype-devel', 'libpng', 'libpng-devel', 'blas', 'python-devel',
    'gcc-c++', 'gcc-gfortran', 'atlas', 'atlas-devel', 'python-pycurl',
    'R-devel', 'perl-SQL-Translator'
]
OPTIONAL_INSTALL_REQS = [
    'openssh-server'
]
EASY_INSTALL_REQS = [
    'python-dateutil', 'argparse', 'django', 'httpagentparser', 'pygeoip',
    'httplib2', 'jinja2', 'mechanize', 'pytz', 'simplejson',
    'sympy==0.7', 'tornado', 'pyyaml', 'atlas', 'numpy', 
    'matplotlib', 'pyquery', 'gitpython', 'scipy', 'MySQL-python',
    'psutil', 'objgraph'
]
# XXX Need a better way to manage these
# May be able to list them directly in setup.py
EXT_INSTALL_REQS = [
    #'http://svn.effbot.org/public/tags/elementtree-1.3a3-20070912/',
    'http://effbot.org/media/downloads/elementtidy-1.0-20050212.zip',
    'http://gdata-python-client.googlecode.com/files/gdata-2.0.14.tar.gz'
]

PYPIRC_FILE = """[distutils]
index-servers =
    auto

[auto]
username:cheeseshop
password:aut0chees3
repository:http://jack.base.autotegrity.com:8333
"""

PIPDIR_ROOT = '/root/.pip'
PIPCONF_ROOT = '/root/.pip/pip.conf'
PIPCONF_FILE = """[install]
extra-index-url = http://jack.base.autotegrity.com:8333/simple
trusted_host = jack.base.autotegrity.com
"""

SOURCE_ROOT = '/usr/local/src'
AUTO_SOURCE = '%s/auto' % SOURCE_ROOT
COGO_SOURCE = '%s/cogo' % SOURCE_ROOT

BASHRC_ENV_FILE = """
# environment variables
export GEOIP_DATA_DIR=/usr/local/share/geoip/data

# Python environment
alias ap='source /opt/prod/bin/activate'
alias ad='source /opt/devel/bin/activate'
alias d='deactivate'

alias pipp='/opt/prod/bin/pip'
alias pipd='/opt/devel/bin/pip'

alias makep='make ENV=/opt/prod'
alias makepall='for d in *; do cd $d; echo "======>>>>>> BULDING `pwd`"; makep develop; cd ..; done'
alias maked='make ENV=/opt/devel'
alias makedall='for d in *; do cd $d; echo "======>>>>>> BULDING `pwd`"; maked develop; cd ..; done'

alias makepcheese='makep CHEESESHOP=auto upload-nosign'
alias makedcheese='maked CHEESESHOP=auto upload-nosign'
alias makedcheeseall='for d in *; do cd $d; echo "======>>>>>> BULDING `pwd`"; maked CHEESESHOP=auto upload-nosign; cd ..; done'
alias makedinstallall='for d in *; do cd $d; echo "======>>>>>> BULDING `pwd`"; maked install; cd ..; done'
alias makedcleanall='for d in *; do cd $d; echo "======>>>>>> BULDING `pwd`"; maked clean; cd ..; done'

alias patchbranchall='for d in `ls -d */ | grep -v "ext/"`; do cd $d; echo "======>>>>>> Branching `pwd`"; git branch patches; git checkout patches; cd ..; done'
alias masterbranchall='for d in `ls -d */ | grep -v "ext/"`; do cd $d; echo "======>>>>>> Switching to Master: `pwd`"; git checkout master; cd ..; done'

alias pythonp='/opt/prod/bin/python'
alias pythond='/opt/devel/bin/python'

alias gitlogall='rm ~/git_log.out; for d in *; do cd $d; echo `pwd`; echo ======== `pwd` >> ~/git_log.out; git log >> ~/git_log.out; cd ..; done'
alias gitstatall='rm ~/git_stat.out; for d in *; do cd $d; echo `pwd`; echo ======== `pwd` >> ~/git_stat.out; git status >> ~/git_stat.out; cd ..; done'

alias cdc='cd %s'
alias cda='cd %s'
alias cdodp='cd %s/autotegrity/optimization/odp'
""" % (COGO_SOURCE, AUTO_SOURCE, AUTO_SOURCE)

def run_command(cmd):
    print '>> ' + cmd
    subprocess.check_call(cmd, shell=True)

def install_general_requirements():
    print '\n======== Install General Requirements ========\n'
    run_command('/usr/bin/yum install --assumeyes %s' % ' '.join(GENERAL_INSTALL_REQS))
    run_command('yum-builddep MySQL-python')
    run_command('yum-builddep numpy')
    run_command('yum-builddep python-matplotlib')
    run_command('yum-builddep scipy')

def setup_src_dir():
    print '\n======== Setup Src Directory ========\n'
    run_command('mkdir -p %s' % SOURCE_ROOT)
    os.chdir(SOURCE_ROOT)
    #run_command('wget http://nightly.ziade.org/distribute_setup.py')
    #run_command('wget https://bootstrap.pypa.io/get-pip.py')
    #run_command('python distribute_setup.py')
    #run_command('python get-pip.py')
    run_command('pip install --upgrade pip virtualenv ipython')
    if os.path.exists('%s/autotegrity' % AUTO_SOURCE):
        os.chdir(AUTO_SOURCE)
        run_command('git pull')
    else:
        cmd = "git clone ssh://mechanic@garage.base.autotegrity.com/Users/Shared/auto-python %s" % AUTO_SOURCE
        run_command(cmd)
        run_command('groupadd devel')
        run_command('chown -R root:devel %s' % AUTO_SOURCE)
        run_command('chmod -R g+rw %s' % AUTO_SOURCE)
        run_command('find %s -type d -exec chmod g+xs {} \;' % AUTO_SOURCE)
        run_command('git config --global user.name "Auto Mechanic"')
        run_command('git config --global user.email auto@autotegrity.com')
        run_command('cp %s/setup/git/hooks/* %s/.git/hooks/' % (AUTO_SOURCE, AUTO_SOURCE))
        run_command('chmod +x %s/setup/git/hooks/*' % AUTO_SOURCE)

def setup_cheeseshop_access():
    print '\n======== Setup Cheeseshop Access ========\n'
    if os.path.exists(PYPIRC):
        print 'WARNING: moving existing .pypirc to .pypirc.old'
        run_command('mv %s %s.old' % (PYPIRC, PYPIRC))
    f = open(PYPIRC, 'w')
    f.write(PYPIRC_FILE)
    f.close()
    run_command('chown %s %s' % (USER, PYPIRC))
    print 'Done.'

def setup_pip():
    print '\n======== Setup pip ========\n'
    # root setup
    if not os.path.exists(PIPDIR_ROOT):
        run_command('mkdir %s' % PIPDIR_ROOT)
    if os.path.exists(PIPCONF_ROOT):
        print 'WARNING: moving existing .pip.conf to .pip.conf.old'
        run_command('mv %s %s.old' % (PIPCONF_ROOT, PIPCONF_ROOT))
    f = open(PIPCONF_ROOT, 'w')
    f.write(PIPCONF_FILE)
    f.close()

    # user setup
    if not os.path.exists(PIPDIR):
        run_command('mkdir %s' % PIPDIR)
    if os.path.exists(PIPCONF):
        print 'WARNING: moving existing .pip.conf to .pip.conf.old'
        run_command('mv %s %s.old' % (PIPCONF, PIPCONF))
    f = open(PIPCONF, 'w')
    f.write(PIPCONF_FILE)
    f.close()
    run_command('chown -R %s %s' % (USER, PIPDIR))
    print 'Done.'

def ext_install(link, source, environment):
    # XXX Add command to automatically commit new ext code??
    if '.zip' in link:
        run_command('curl -O %s' % link)
        archive = link.split('/')[-1]
        run_command('unzip %s -d %s/ext/' % (archive, source))
        filename = archive.split('.zip')[0]
        run_command('cd %s/ext/%s/; %s/bin/python setup.py install; cd %s' % (source, filename, environment, source))
        run_command('rm %s' % archive)
    elif '.tar' in link:
        run_command('curl -O %s' % link)
        archive = link.split('/')[-1]
        run_command('tar xf %s -C %s/ext/' % (archive, source))
        filename = archive.split('.tar')[0]
        run_command('cd %s/ext/%s/; %s/bin/python setup.py install; cd %s' % (source, filename, environment, source))
        run_command('rm %s' % archive)
    else:
        # Assume its consumable by pip, just install directly
        run_command('%s/bin/pip install %s' % (environment, link))

def setup_virtual_envs():
    print '\n======== Setup Virtual Environments ========\n'    
    # Production
    run_command('mkdir -p /opt/prod')
    run_command('virtualenv --no-site-packages --distribute /opt/prod')
    run_command('/opt/prod/bin/pip install ipython')
    for pkg in EASY_INSTALL_REQS:
        run_command('/opt/prod/bin/easy_install %s' % pkg)
    for link in EXT_INSTALL_REQS:
        ext_install(link, '/usr/local/src/auto', '/opt/prod')
    run_command('chown -R root:devel /opt/prod')
    run_command('chmod -R g+rw /opt/prod')
    run_command('find /opt/prod -type d -exec chmod g+xs {} \;')

    # Development
    run_command('mkdir -p /opt/devel')
    run_command('virtualenv --no-site-packages --distribute /opt/devel')
    run_command('/opt/devel/bin/pip install ipython')
    for pkg in EASY_INSTALL_REQS:
        run_command('/opt/devel/bin/easy_install %s' % pkg)
    for link in EXT_INSTALL_REQS:
        ext_install(link, '/usr/local/src/auto', '/opt/devel')
    run_command('chown -R root:devel /opt/devel')
    run_command('chmod -R g+rw /opt/devel')
    run_command('find /opt/devel -type d -exec chmod g+xs {} \;')

def setup_autotegrity_config():
    print '\n======== Setup Autotegrity Config ========\n'
    # XXX For now just point it to /usr/local/src, eventually should point it
    # to virtualenv

    CONFIG_PREFIX = '/etc/autotegrity/'
    SOURCE_DIR = '%s/autotegrity/' % AUTO_SOURCE

    CONFIG_DIRS = (
        "optimization/odp/config",
        "optimization/odp/facts",
    )

    CONFIG_FILES = (
      "db.cnf",
    )

    if not os.path.exists(CONFIG_PREFIX):
        run_command("mkdir %s" % CONFIG_PREFIX)

    for config_dir in CONFIG_DIRS:
        source_dir = os.path.abspath(os.path.join(SOURCE_DIR, config_dir))
        target_dir = os.path.abspath(os.path.join(CONFIG_PREFIX, config_dir))

        print "%s --> %s" % (source_dir, target_dir)

        while os.path.exists(target_dir):
            print "Target directory [%s] exists; removing" % target_dir
            try:
                shutil.rmtree(target_dir)
            except:
                os.remove(target_dir)

        target_dir_base = os.path.dirname(target_dir)
        if not os.path.exists(target_dir_base):
            os.makedirs(target_dir_base)

        try:
            os.symlink(source_dir, target_dir)
        except:
            pass

    for config_file in CONFIG_FILES:
        source_file = os.path.abspath(os.path.join(SOURCE_DIR, config_file))
        target_file = os.path.abspath(os.path.join(CONFIG_PREFIX, config_file))

        print "%s --> %s" % (source_file, target_file)

        while os.path.exists(target_file):
            print "Target file [%s] exists; removing" % target_file

            os.remove(target_file)

        try:
            os.symlink(source_file, target_file)
        except:
            pass

# XXX Temporary hack to satisfy some hardcoded paths...
def setup_tmp_links():
    run_command('mkdir -p /opt/svn/repository')
    run_command('cd /opt/svn/repository')
    run_command('ln -s /usr/local/src/auto/autotegrity')
    run_command('sudo chown -R mechanic /opt/svn')
    run_command('sudo chmod -R 755 /opt/svn')

def setup_user():
    print '\n======== Setup User ========\n'
    if os.path.exists(BASHRC_ENV):
        print 'WARNING: moving existing .bashrc.env to .bashrc.env.old'
        run_command('mv %s %s.old' % (BASHRC_ENV, BASHRC_ENV))
    f = open(BASHRC_ENV, 'w')
    f.write(BASHRC_ENV_FILE)
    f.close()

    # append to .bashrc to load this
    f = open(BASHRC, 'a')
    f.write('\n[ -f %s ] && source %s' % (BASHRC_ENV, BASHRC_ENV))
    f.close()

    run_command('chown %s %s' % (USER, BASHRC_ENV))
    run_command('usermod -aG devel %s' % USER)
    print 'NOTE: you may have to log out and back in for permissions to take effect'

# -------- Main
if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--user', help='user to install for', type=str, default=None)
    args = parser.parse_args()

    if os.getuid() != 0:
        sys.exit('Must be run with sudo')

    if args.user is None:
        sys.exit('Must specify a user to install the environment for')

    global PYPIRC, PIPDIR, BASHRC, BASHRC_ENV, USER
    USER = args.user
    PIPCONF = '/home/%s/.pip/pip.conf' % USER
    PYPIRC = '/home/%s/.pypirc' % USER
    PIPDIR = '/home/%s/.pip' % USER
    BASHRC = '/home/%s/.bashrc' % USER
    BASHRC_ENV = '/home/%s/.bashrc.env' % USER

    install_general_requirements()
    import pdb
    pdb.set_trace()
    setup_src_dir()
    setup_cheeseshop_access()
    setup_pip()
    setup_virtual_envs()
    setup_autotegrity_config()
    ##setup_tmp_links()
    setup_user()

    print "--------"
    print "Setup complete. Try doing a 'make develop' in %s." % AUTO_SOURCE
    print "That should deploy links to the source into /opt/devel by default."
    print "You can then activate that python environment using the bash alias"
    print "'ad', open the python interpreter, and try 'from autotegrity import db'."
    print "You can deactivate that virtual environment using the bash alias 'd'."
    print ''
    print "Note: if you are having permissions issues, try logging out and back in."
