#!/usr/bin/env rpmlint

Name: sailfish-settings-labs

Summary:    Settings Labs Project
Version:    0.1.0
Release:    0
Group:      Applications
License:    BSD-3-Clause
URL:        https://github.com/sailfishos/sailfish-settings-labs
Source0:    %{name}-%{version}.tar.bz2
BuildArch:  noarch

Requires:   jolla-settings

BuildRequires:  qt5-qttools-linguist
BuildRequires:  qt5-qmake
BuildRequires:  qml-rpm-macros

%description
%{summary}.

%package template
Summary: Settings Labs Example
Requires: %{name} = %{version}

%description template
%{summary}.

%package all
Summary:  Meta package to include all Settings Labs features
Requires: %{name} = %{version}-%{release}
Requires: %{name}-template

%description all
This package is here to include all Settings Labs
features.

%prep
%autosetup -p1 -n %{name}-%{version}

%build
%qmake5

%make_build

%install
%qmake5_install

%files
%dir %{_datadir}/%{name}
%{_datadir}/%{name}/README.md
%{_datadir}/jolla-settings/entries/%{name}.json

%files template
%{_datadir}/jolla-settings/entries/template.json
%dnl %dir %{_datadir}/%{name}/template
%dnl %{_datadir}/%{name}/template/main.qml
%dnl 

%files all
# Empty as this is meta package.
