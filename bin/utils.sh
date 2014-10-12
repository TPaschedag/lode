# -*- tab-width : 4; indent-tabs-mode : nil -*-
#
# Display an error message and exit
#
die()
{
    echo  "$@"
    exit 1;
}

test_create_dir()
{
    local d="$1"

    if [ -n "${d}" ] ; then
        echo -n "Check directory '$d' ... : "
        if [ -e "${d}" ] ; then
            if [ -d "${d}" ] ; then
                echo "Exist" 1>&2
            else
                echo "Error Exist but not a Directory" 1>&2
                exit 1
            fi
        else
            mkdir "${d}"
            if [ $? = "0" ] ; then
                echo "Created" 1>&2
            else
                echo "Error Creating" 1>&2
                exit 1
            fi
        fi
    fi
}


test_create_dirs()
{
    local d=

    for d in "$@" ; do
        test_create_dir "${d}"
    done
}

test_git_or_clone()
{
    # test if a git repo exist, if not clone it
    # you need to have the current working dir be where you want to clone
    local g="$1"
    local remote="$2"

    if [ -n "${g}" -a -n "${remote}" ] ; then
        if [ -d "${g}" ] ; then
            if [ -d "${g}/.git" ] ; then
                echo "git repo '$(pwd)/$g' exist" 1>&2
            else
                echo "Error $(pwd)/${g} is a directory but not a git repo" 1>&2
                exit 1
            fi
        elif [ -e "${g}" ] ; then
            echo "Error $(pwd)/${g} is a directory but not a git repo" 1>&2
            exit 1
        else
            git clone "${remote}" "${g}"
            if [ $? = "0" ] ; then
                echo "Cloned $(pwd)/${g}" 1>&2
            else
                echo "Error Cloning $(pwd)/${g}" 1>&2
                rm -fr "${g}"
                exit 1
            fi
        fi
    fi
}

determin_os_flavor()
{
    OS_FLAVOR="Unknown"
}

os_flavor_notes()
{
:
}

os_notes()
{
:
}

os_prereq()
{
:
}

os_flavor_prereq()
{
:
}

determine_os()
{
    base_os=$(uname)
    
    case "$base_os" in
    Darwin)
        OS="MacOSX"
        ;;
    Linux)
        OS="Linux"
        ;;
    *)
        die "Error:Unsupported base_os:${base_os}"
        ;;
    esac
    OS_FLAVOR=""
    
    if [ -f "${BASE_DIR?}/bin/utils_${OS?}.sh" ] ; then
        source "${BASE_DIR?}/bin/utils_${OS?}.sh"
    fi
    determine_os_flavor
    if [ -n "${OS_FLAVOR?}" ] ; then
        if [ -f "${BASE_DIR?}/bin/utils_${OS?}_${OS_FLAVOR?}.sh" ] ; then
            source "${BASE_DIR?}/bin/utils_${OS?}_${OS_FLAVOR?}.sh"
        fi
    fi
}

setup_base_tree()
{
    test_create_dirs packages opt ext_tar adm tb
}

setup_adm_repos()
{
    pushd "${BASE_DIR?}/adm" > /dev/null

    test_git_or_clone buildbot git://gerrit.libreoffice.org/buildbot

    popd > /dev/null
}

display_prereq()
{
    os_prereq
    os_flavor_prereq

cat <<EOF

Done.

EOF
}

final_notes()
{
    os_notes
    os_flavor_notes
    cat <<EOF

Done.

EOF
}