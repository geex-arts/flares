import UIKit
import Social
import MobileCoreServices
import Photos
import UniformTypeIdentifiers
import AVFoundation
import ImageIO

@objc(ShareViewController)
class ShareViewController: UIViewController {
    // TODO: IMPORTANT: This should be your host app bundle identifier
    var hostAppBundleIdentifier = "com.geex.arts.flares"
    let sharedKey = "SharingKey"
    var appGroupId = ""
    var sharedText: [String] = []
    
    let imageContentType = UTType.image.identifier;
    let videoContentType = UTType.movie.identifier;
    let textContentType = UTType.text.identifier;
    let urlContentType = UTType.url.identifier;
    let fileURLType = UTType.fileURL.identifier;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // load group and app id from build info
        loadIds();
        
    }
    
    private func loadIds() {
        
        // loading Share extension App Id
        let shareExtensionAppBundleIdentifier = Bundle.main.bundleIdentifier!;
        
        
        // convert ShareExtension id to host app id
        // By default it is remove last part of id after last point
        // For example: com.test.ShareExtension -> com.test
        let lastIndexOfPoint = shareExtensionAppBundleIdentifier.lastIndex(of: ".");
        hostAppBundleIdentifier = String(shareExtensionAppBundleIdentifier[..<lastIndexOfPoint!]);
        print(2332);
        // loading custom AppGroupId from Build Settings or use group.<hostAppBundleIdentifier>
        appGroupId = (Bundle.main.object(forInfoDictionaryKey: "AppGroupId") as? String) ?? "group.\(hostAppBundleIdentifier)";
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        // This will called after the user selects app from sharing app list.
        handleImageAttachment()
        
    }
    
    func handleImageAttachment(){
        if let content = self.extensionContext?.inputItems.first as? NSExtensionItem {
            if let contents = content.attachments {
                for (index, attachment) in (contents).enumerated() {
                    
                    if attachment.isURL {
                        handleUrl(content: content, attachment: attachment, index: index)
                    }
                    else if attachment.isText {
                        handleText(content: content, attachment: attachment, index: index)
                    } else {
                        print(" \(attachment) File type is not supported by flutter shaing plugin.")
                    }
                }
            }
        }
        
    }
    
    
    private func handleText (content: NSExtensionItem, attachment: NSItemProvider, index: Int) {
        attachment.loadItem(forTypeIdentifier: textContentType, options: nil) { [weak self] data, error in
            
            if error == nil, let item = data as? String, let this = self {
                
                this.sharedText.append(item)
                
                // If this is the last item, save imagesData in userDefaults and redirect to host app
                if index == (content.attachments?.count)! - 1 {
                    let userDefaults = UserDefaults(suiteName: this.appGroupId)
                    userDefaults?.set(this.sharedText, forKey: this.sharedKey)
                    userDefaults?.synchronize()
                    this.redirectToHostApp(type: .text)
                }
                
            } else {
                self?.dismissWithError()
            }
        }
    }
    
    private func handleUrl (content: NSExtensionItem, attachment: NSItemProvider, index: Int) {
        attachment.loadItem(forTypeIdentifier: urlContentType, options: nil) { [weak self] data, error in
            
            if error == nil, let item = data as? URL, let this = self {
                
                this.sharedText.append(item.absoluteString)
                
                // If this is the last item, save imagesData in userDefaults and redirect to host app
                if index == (content.attachments?.count)! - 1 {
                    let userDefaults = UserDefaults(suiteName: this.appGroupId)
                    userDefaults?.set(this.sharedText, forKey: this.sharedKey)
                    userDefaults?.synchronize()
                    this.redirectToHostApp(type: .url)
                }
                
            } else {
                self?.dismissWithError()
            }
        }
    }
    
    
    private func dismissWithError() {
        print("[ERROR] Error loading data!")
        let alert = UIAlertController(title: "Error", message: "Error loading data", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Error", style: .cancel) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }
    
    private func redirectToHostApp(type: RedirectType) {
        // load group and app id from build info
        loadIds();
        let url = URL(string: "SharingMedia-\(hostAppBundleIdentifier)://dataUrl=\(sharedKey)#\(type)")
        var responder = self as UIResponder?
        let selectorOpenURL = sel_registerName("openURL:")
        
        while (responder != nil) {
            if (responder?.responds(to: selectorOpenURL))! {
                let _ = responder?.perform(selectorOpenURL, with: url)
            }
            responder = responder!.next
        }
        extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }
    
    enum RedirectType {
        case media
        case text
        case file
        case url
    }
    

}
// MARK: - Attachment Types
extension NSItemProvider {


    var isText: Bool {
        return hasItemConformingToTypeIdentifier(UTType.text.identifier)
    }

    var isURL: Bool {
        return hasItemConformingToTypeIdentifier(UTType.url.identifier)
    }

}
