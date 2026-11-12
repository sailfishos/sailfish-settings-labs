#include <QCoreApplication>
#include <QLocale>
#include <QTranslator>
#include <QQmlEngine>
#include <QQmlExtensionPlugin>

class AppTranslator: public QTranslator
{
    Q_OBJECT
public:
    AppTranslator(QObject *parent)
        : QTranslator(parent)
    {
        qApp->installTranslator(this);
    }

    virtual ~AppTranslator()
    {
        qApp->removeTranslator(this);
    }
};

class SailfishSettingsNetworkingPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.sailfish.settings.labs")

public:

    void initializeEngine(QQmlEngine *engine, const char *uri)
    {
        Q_UNUSED(uri)
        Q_ASSERT(QLatin1String(uri) == QLatin1String("Sailfish.Settings.Labs"));

        AppTranslator *engineeringEnglish = new AppTranslator(engine);
        AppTranslator *translator = new AppTranslator(engine);
        engineeringEnglish->load("settings-sailfish-labs_eng_en", "/usr/share/translations");
        translator->load(QLocale(), "settings-sailfish-labs", "-", "/usr/share/translations");
    }

    virtual void registerTypes(const char *uri)
    {
        Q_ASSERT(QLatin1String(uri) == QLatin1String("Sailfish.Settings.Labs"));
    }
};

#include "plugin.moc"

