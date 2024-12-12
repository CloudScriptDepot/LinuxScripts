#!/bin/bash

# Check if the system uses RPM or DEB package management
if command -v rpm &> /dev/null; then
    package_manager="rpm"
elif command -v dpkg &> /dev/null; then
    package_manager="dpkg"
else
    echo "Neither RPM nor DEB package management system found."
    exit 1
fi

# Function to remove RPM package
remove_rpm() {
    rpm_output=$(rpm -qa | grep xagt)
    if [ ! -z "$rpm_output" ]; then
        echo "RPM package found: $rpm_output"
        rpm -e "$rpm_output"
    else
        echo "xagt RPM package not found."
    fi
}

# Function to remove DEB package
remove_deb() {
    deb_output=$(dpkg -l | grep xagt | awk '{print $2}')
    if [ ! -z "$deb_output" ]; then
        echo "DEB package found: $deb_output"
        dpkg --purge "$deb_output"
    else
        echo "xagt DEB package not found."
    fi
}

# Remove the package based on the detected package manager
if [ "$package_manager" == "rpm" ]; then
    remove_rpm
elif [ "$package_manager" == "dpkg" ]; then
    remove_deb
fi
