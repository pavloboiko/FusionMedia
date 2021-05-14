import class Foundation.Bundle

extension Foundation.Bundle {
    static var module: Bundle = {
        let mainPath = Bundle.main.bundlePath + "/" + "FusionMedia_FusionMedia_Android.bundle"
        let buildPath = "/Volumes/SSD_Data/Work/Ongoing_Project/Scade/FusionMediaWorking/FusionMedia/.build/x86_64-apple-macosx/debug/FusionMedia_FusionMedia_Android.bundle"

        let preferredBundle = Bundle(path: mainPath)

        guard let bundle = preferredBundle != nil ? preferredBundle : Bundle(path: buildPath) else {
            fatalError("could not load resource bundle: from \(mainPath) or \(buildPath)")
        }

        return bundle
    }()
}