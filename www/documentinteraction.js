//  documentinteraction.js
//
//  Created by Pierre-Emmanuel Bois on 08/08/13.
//
//  Copyright 2012-2013 Pierre-Emmanuel Bois. All rights reserved.
//  MIT Licensed

var DocumentInteraction = {
    preview: function (url, ext, callback) {
        cordova.exec(callback, function (err) {
            callback('Error: Preview');
        }, "DocumentInteraction", "preview", [url, ext]);
    },
    openIn: function (url, ext, callback) {
        cordova.exec(callback, function (err) {
            callback('Error: OpenIn');
        }, "DocumentInteraction", "openIn", [url, ext]);
    },
    optionsMenu: function (url, ext, callback) {
        cordova.exec(callback, function (err) {
            callback('Error: OptionsMenu');
        }, "DocumentInteraction", "optionsMenu", [url, ext]);
    }
};

module.exports = DocumentInteraction;
