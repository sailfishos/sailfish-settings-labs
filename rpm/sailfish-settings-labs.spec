Name: sailfish-settings-labs

Summary:    Settings Labs Project
Version:    0.1.0
Release:    0
License:    BSD-3-Clause and ASL 2.0
URL:        https://github.com/sailfishos/sailfish-settings-labs
Source0:    %{name}-%{version}.tar.bz2

Requires:   jolla-settings

BuildRequires:  qt5-qttools-linguist
BuildRequires:  qt5-qmake
BuildRequires:  qml-rpm-macros

%description
%{summary}.

%package ts-devel
Summary: Translation source for Settings Labs Project

%description ts-devel
Translation source for Settings Labs Project

%package all
Summary:  Meta package to include all Settings Labs features
BuildArch:  noarch
Requires: %{name} = %{version}-%{release}
Requires: %{name}-gestures
Requires: %{name}-peekfilter

%description all
This package is here to include all Settings Labs
features.

# Add/remove subpackages below to ease merging

%package gestures
Summary: Gestures Lab Components
BuildArch:  noarch
Requires: %{name} = %{version}

%description gestures
%{summary}.

%package peekfilter
Summary: Edge Swipe Lab Components
BuildArch:  noarch
Requires: %{name} = %{version}

%description peekfilter
%{summary}.

%prep
%autosetup -p1 -n %{name}-%{version}

%build
%qmake5

%make_build

%install
%qmake5_install

%files
%dir %{_datadir}/%{name}
%dir %{_libdir}/qt5/qml/Sailfish/Settings/Labs
%{_libdir}/qt5/qml/Sailfish/Settings/Labs/*.so
%{_libdir}/qt5/qml/Sailfish/Settings/Labs/qmldir
%{_datadir}/jolla-settings/entries/%{name}.json
%{_datadir}/translations/settings-sailfish-labs_eng_en.qm

%files ts-devel
%{_datadir}/translations/source/*.ts

%files all
# Empty as this is meta package.

%files gestures
%{_datadir}/jolla-settings/entries/labs-gestures.json
%dir %{_datadir}/%{name}/gestures/
%dir %{_datadir}/%{name}/gestures/components
%{_datadir}/%{name}/gestures/gestures.qml
%{_datadir}/%{name}/gestures/components/quickapptoggle.qml

%files peekfilter
%{_datadir}/jolla-settings/entries/labs-peekfilter.json
%dir %{_datadir}/%{name}/peekfilter
%{_datadir}/%{name}/peekfilter/peekfilter.qml
%{_datadir}/%{name}/peekfilter/PeekSlider.qml

# Add/remove subpackages below to ease merging
