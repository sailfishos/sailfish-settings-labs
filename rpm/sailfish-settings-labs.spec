Name: sailfish-settings-labs

Summary:    Settings Labs Project
Version:    0.1.0
Release:    0
License:    BSD-3-Clause and ASL 2.0
URL:        https://github.com/sailfishos/sailfish-settings-labs
Source0:    %{name}-%{version}.tar.bz2
BuildArch:  noarch

Requires:   jolla-settings

BuildRequires:  qt5-qttools-linguist
BuildRequires:  qt5-qmake
BuildRequires:  qml-rpm-macros

%description
%{summary}.

%package peekfilter
Summary: Labs Edge Swipe
Requires: %{name} = %{version}

%description peekfilter
%{summary}.

%package all
Summary:  Meta package to include all Settings Labs features
Requires: %{name} = %{version}-%{release}
Requires: %{name}-peekfilter

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
%{_datadir}/jolla-settings/entries/%{name}.json

%files peekfilter
%{_datadir}/jolla-settings/entries/labs-peekfilter.json
%{_datadir}/%{name}/peekfilter/peekfilter.qml
%{_datadir}/%{name}/peekfilter/PeekSlider.qml
%{_datadir}/translations/settings-sailfish-labs-peekfilter_eng_en.qm
%exclude %{_datadir}/translations/source/*.ts


%files all
# Empty as this is meta package.
