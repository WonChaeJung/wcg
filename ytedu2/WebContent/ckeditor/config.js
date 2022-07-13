/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
    config.autoParagraph = false;
    config.resize_enabled = false;
    config.enterMode = CKEDITOR.ENTER_BR;
	config.filebrowserBrowseUrl = '/CmFileService/fileBrowse.do?type=file';
	config.filebrowserImageBrowseUrl = '/CmFileService/fileBrowse.do?type=image';
	config.filebrowserFlashBrowseUrl = '/CmFileService/fileBrowse.do?type=flash';
	config.filebrowserUploadUrl = '/CmFileService/fileUpload.do?type=file';
	config.filebrowserImageUploadUrl = '/CmFileService/fileUpload.do?type=image';
	config.filebrowserFlashUploadUrl = '/CmFileService/fileUpload.do?type=flash';
	config.filebrowserWindowFeatures = 'location=no,menubar=no,toolbar=no,dependent=yes,minimizable=no,modal=yes,alwaysRaised=yes,resizable=no,scrollbars=yes,width=640,height=480';
	config.filebrowserWindowWidth = 640;
	config.filebrowserWindowHeight = 480;
};
