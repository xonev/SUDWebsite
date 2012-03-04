<?php
/* @package Xmap
 * @author Guillermo Vargas http://joomla.vargas.co.cr
 * @email guille@vargas.co.cr
 * @translator  Gianmarco Odorizzi http://www.gianmarcoodorizzi.com
 * @email info@gianmarcoodorizzi.com
*/
defined( '_JEXEC' ) or die( 'Direct Access to this location is not allowed.' ); 

if( !defined( 'JOOMAP_LANG' )) {
    define ('JOOMAP_LANG', 1 );
    // -- General ------------------------------------------------------------------
    define("_XMAP_CFG_COM_TITLE", "Cofigurazione di Xmap");
    define("_XMAP_CFG_OPTIONS", "Visualizza Opzioni");
    define("_XMAP_CFG_TITLE", "Titolo");
    define("_XMAP_CFG_CSS_CLASSNAME", "CSS Classname");
    define("_XMAP_CFG_EXPAND_CATEGORIES","Espandi contenuto categorie");
    define("_XMAP_CFG_EXPAND_SECTIONS","Espandi contenuto sezioni");
    define("_XMAP_CFG_SHOW_MENU_TITLES", "Visualizza i titoli del menu");
    define("_XMAP_CFG_NUMBER_COLUMNS", "Numero di colonne");
    define('_XMAP_EX_LINK', 'Seleziona links esterni');
    define('_XMAP_CFG_CLICK_HERE', 'Click qui');
    define('_XMAP_CFG_GOOGLE_MAP',		'Google Sitemap');
    define('_XMAP_EXCLUDE_MENU',			'Escludi Menu IDs');
    define('_XMAP_TAB_DISPLAY',			'Visualizza');
    define('_XMAP_TAB_MENUS',				'Menu');
    define('_XMAP_CFG_WRITEABLE',			'Scrivibile');
    define('_XMAP_CFG_UNWRITEABLE',		'Non Scrivibile');
    define('_XMAP_MSG_MAKE_UNWRITEABLE',	'Dopo il salvataggio imposta come [ <span style="color: red;">non scrivibile</span> ]');
    define('_XMAP_MSG_OVERRIDE_WRITE_PROTECTION', 'Override write protection when saving');
    define('_XMAP_GOOGLE_LINK',			'Googlelink');

    // -- Tips ---------------------------------------------------------------------
    define('_XMAP_EXCLUDE_MENU_TIP',		'Specifica gli IDs dei menu che non vuoi includere nel sitemap.<br /><strong>NOTA</strong><br />Separa gli IDs con la virgola!');
    define('_XMAP_CFG_GOOGLE_MAP_TIP',	'File XML generato per GoogleSiteMap');
    define('_XMAP_GOOGLE_LINK_TIP',		'Copia il link e inseriscilo in GoogleSiteMap');

    // -- Menus --------------------------------------------------------------------
    define("_XMAP_CFG_SET_ORDER", "Modifica l'ordine del menu");
    define("_XMAP_CFG_MENU_SHOW", "Visualizza");
    define("_XMAP_CFG_MENU_REORDER", "Riordina");
    define("_XMAP_CFG_MENU_ORDER", "Ordina");
    define("_XMAP_CFG_MENU_NAME", "Nome Menu");
    define("_XMAP_CFG_DISABLE", "Click per disabilitare");
    define("_XMAP_CFG_ENABLE", "Click per abilitare");
    define('_XMAP_SHOW','Visualizza');
    define('_XMAP_NO_SHOW','Non visualizzare');

    // -- Toolbar ------------------------------------------------------------------
    define("_XMAP_TOOLBAR_SAVE", "Salva");
    define("_XMAP_TOOLBAR_CANCEL", "Cancella");

    // -- Errors -------------------------------------------------------------------
    define('_XMAP_ERR_NO_LANG','Nessun file di linguaggio [ %s ] trovato, è stato caricato quello di default: english<br />'); // %s = $GLOBALS['mosConfig_lang']
    define('_XMAP_ERR_CONF_SAVE',         '<h2>Salvataggio configurazione fallito.</h2>');
    define('_XMAP_ERR_NO_CREATE',         'ERRORE: Impossibile creare le tabelle di configurazione');
    define('_XMAP_ERR_NO_DEFAULT_SET',    'ERRORE: Impossibile inserire le configurazioni di default');
    define('_XMAP_ERR_NO_PREV_BU',        'WARNING: Impossibile cancellare backup precedenti');
    define('_XMAP_ERR_NO_BACKUP',         'ERRORE: Impossibile creare un backup');
    define('_XMAP_ERR_NO_DROP_DB',        'ERRORE: Impossibile cancellare le tabelle di configurazione');

    // -- Config -------------------------------------------------------------------
    define('_XMAP_MSG_SET_RESTORED',      'Configurazione ristabilite<br />');
    define('_XMAP_MSG_SET_BACKEDUP',      'Configurazioni salvata<br />');
    define('_XMAP_MSG_SET_DB_CREATED',    'Tabelle di configurazioni create<br />');
    define('_XMAP_MSG_SET_DEF_INSERT',    'Configurazioni di Default inserite');
    define('_XMAP_MSG_SET_DB_DROPPED',    'Tabelle di configurazione cancellate');
	
    // -- CSS ----------------------------------------------------------------------
    define('_XMAP_CSS',					'Xmap CSS');
    define('_XMAP_CSS_EDIT',				'Modifica template'); // Edit template
	
    // -- Sitemap ------------------------------------------------------------------
    define('_XMAP_SHOW_AS_EXTERN_ALT','Apri il link in una nuova finestra');
    define('_XMAP_PREVIEW','Anteprima');
    define('_XMAP_SITEMAP_NAME','Sitemap');

    // -- Added for Xmap 
    define('_XMAP_CHARSET','ISO-8859-1');
    define('_XMAP_CFG_MENU_SHOW_HTML',		'Mostra nel sito');
    define('_XMAP_CFG_MENU_SHOW_XML',		'Mostra nella mappa XML');
    define('_XMAP_CFG_MENU_PRIORITY',		'Priorità');
    define('_XMAP_CFG_MENU_CHANGEFREQ',		'Frequenza aggiornamenti');
    define('_XMAP_CFG_CHANGEFREQ_ALWAYS',		'Sempre');
    define('_XMAP_CFG_CHANGEFREQ_HOURLY',		'Ogni ora');
    define('_XMAP_CFG_CHANGEFREQ_DAILY',		'Quotidianamente');
    define('_XMAP_CFG_CHANGEFREQ_WEEKLY',		'Settimanalmente');
    define('_XMAP_CFG_CHANGEFREQ_MONTHLY',		'Mensilmente');
    define('_XMAP_CFG_CHANGEFREQ_YEARLY',		'Annualmente');
    define('_XMAP_CFG_CHANGEFREQ_NEVER',		'Mai');

    define('_XMAP_TIT_SETTINGS_OF',			'Preferenze per %s');
    define('_XMAP_TAB_SITEMAPS',			'Mappa sito');
    define('_XMAP_MSG_NO_SITEMAPS',			'Non sono state ancora create sitemap');
    define('_XMAP_MSG_NO_SITEMAP',			'Questa sitemap non è disponibile');
    define('_XMAP_MSG_LOADING_SETTINGS',		'Caricamento preferenze...');
    define('_XMAP_MSG_ERROR_LOADING_SITEMAP',		'Errore. Impossibile caricare la sitemap');
    define('_XMAP_MSG_ERROR_SAVE_PROPERTY',		'Errore. Impossibile salvare la proprietà della sitemap.');
    define('_XMAP_MSG_ERROR_CLEAN_CACHE',		'Errore. Impossibile svuotare la cache della sitemap');
    define('_XMAP_ERROR_DELETE_DEFAULT',		'Impossibile eliminare la sitemap di default!');
    define('_XMAP_MSG_CACHE_CLEANED',			'Cache eliminata!');
    define('_XMAP_SITEMAP_ID',				'Sitemap\'s ID');
    define('_XMAP_ADD_SITEMAP',				'Aggiungi Sitemap');
    define('_XMAP_NAME_NEW_SITEMAP',			'Nuova Sitemap');
    define('_XMAP_DELETE_SITEMAP',			'Cancella');
    define('_XMAP_SETTINGS_SITEMAP',			'Preferenze');
    define('_XMAP_COPY_SITEMAP',			'Copia');
    define('_XMAP_SITEMAP_SET_DEFAULT',			'Scegli default');
    define('_XMAP_EDIT_MENU',				'Opzioni');
    define('_XMAP_DELETE_MENU',				'Cancella');
    define('_XMAP_CLEAR_CACHE',				'Cancella cache');
    define('_XMAP_MOVEUP_MENU',		'Su');
    define('_XMAP_MOVEDOWN_MENU',	'Giù');
    define('_XMAP_ADD_MENU',		'Aggiungi menu');
    define('_XMAP_COPY_OF',		'Copia di %s');
    define('_XMAP_INFO_LAST_VISIT',	'Ultima visita');
    define('_XMAP_INFO_COUNT_VIEWS',	'Numero di visite');
    define('_XMAP_INFO_TOTAL_LINKS',	'Numero di links');
    define('_XMAP_CFG_URLS',		'Sitemap\'s URL');
    define('_XMAP_XML_LINK_TIP',	'Copia link e segnala a Google e Yahoo');
    define('_XMAP_HTML_LINK_TIP',	'Questo è l\' URl della Sitemap. Pioi utilizzarlo per creare delle voci nel tuo menu.');
    define('_XMAP_CFG_XML_MAP',		'XML Sitemap');
    define('_XMAP_CFG_HTML_MAP',	'HTML Sitemap');
    define('_XMAP_XML_LINK',		'Googlelink');
    define('_XMAP_CFG_XML_MAP_TIP',	'Il file XMl generato per i motori di ricerca');
    define('_XMAP_ADD', 'Salva');
    define('_XMAP_CANCEL', 'Annula');
    define('_XMAP_LOADING', 'Caricamento...');
    define('_XMAP_CACHE', 'Cache');
    define('_XMAP_USE_CACHE', 'Usa Cache');
    define('_XMAP_CACHE_LIFE_TIME', 'Durata cache');
    define('_XMAP_NEVER_VISITED', 'Mai');

	// New on Xmap 1.1
	define('_XMAP_PLUGINS','Plugins');	
	define( '_XMAP_INSTALL_3PD_WARN', 'Warning: Installing 3rd party extensions may compromise your server\'s security.' );
	define('_XMAP_INSTALL_NEW_PLUGIN', 'Install new Plugins');
	define('_XMAP_UNKNOWN_AUTHOR','Unknown author');
	define('_XMAP_PLUGIN_VERSION','Version %s');
	define('_XMAP_TAB_INSTALL_PLUGIN','Install');
	define('_XMAP_TAB_EXTENSIONS','Extensions');
	define('_XMAP_TAB_INSTALLED_EXTENSIONS','Installed Extensions');
	define('_XMAP_NO_PLUGINS_INSTALLED','No custom plugins installed');
	define('_XMAP_AUTHOR','Author');
	define('_XMAP_CONFIRM_DELETE_SITEMAP','Are you sure you want to delete this sitemap?');
	define('_XMAP_CONFIRM_UNINSTALL_PLUGIN','Are you sure you want to uninstall this plugin?');
	define('_XMAP_UNINSTALL','Uninstall');
	define('_XMAP_EXT_PUBLISHED','Published');
	define('_XMAP_EXT_UNPUBLISHED','Unpublished');
	define('_XMAP_PLUGIN_OPTIONS','Options');
	define('_XMAP_EXT_INSTALLED_MSG','The extension was installed successfully, please review their options and then publish the extension.');
	define('_XMAP_CONTINUE','Continue');
	define('_XMAP_MSG_EXCLUDE_CSS_SITEMAP','Do not include the CSS within the Sitemap');
	define('_XMAP_MSG_EXCLUDE_XSL_SITEMAP','Use classic XML Sitemap display');


	// New on Xmap 1.1
	define('_XMAP_MSG_SELECT_FOLDER','Please select a directory');
	define('_XMAP_UPLOAD_PKG_FILE','Upload Package File');
	define('_XMAP_UPLOAD_AND_INSTALL','Upload File &amp; Install');
	define('_XMAP_INSTALL_F_DIRECTORY','Install from directory');
	define('_XMAP_INSTALL_DIRECTORY','Install directory');
	define('_XMAP_INSTALL','Install');
	define('_XMAP_WRITEABLE','Writeable');
	define('_XMAP_UNWRITEABLE','Unwriteable');


	// New on Xmap 1.2
	define('_XMAP_COMPRESSION','Compression');
	define('_XMAP_USE_COMPRESSION','Compress the XML sitemap to save bandwidth');
}
