Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AF9C47F1
	for <lists+dm-devel@lfdr.de>; Wed,  2 Oct 2019 08:51:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9BF86B;
	Wed,  2 Oct 2019 06:51:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEC035D9D3;
	Wed,  2 Oct 2019 06:51:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C8B134A486;
	Wed,  2 Oct 2019 06:51:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x926pOAV014216 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Oct 2019 02:51:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5CE5C614C1; Wed,  2 Oct 2019 06:51:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB112611DB;
	Wed,  2 Oct 2019 06:51:21 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3776F3025678;
	Wed,  2 Oct 2019 06:51:20 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Wed,  2 Oct 2019 06:50:19 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 2 Oct 2019 06:48:10 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 2 Oct 2019 06:48:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=AT452DYW+eOR4yhwberNb1UMBnuK60hEqOWqhs+/C11ZeJuQ2T7XT0hSzU841YOwQqMOO1pX9j0FMPGimy1jR8WOm9tEYKSh7UAKURYc2obKz47iBHCAySX4wIjU3duw3kBiy/jxaBp2N0pyU6OZFbO2V54BBmxIEYajaVyLio4kGCWZ6UxYbm3r6qIpDXACPEMPxEW80hMPgSkoCMoEZJo32SeQ9QYGn3ZIU+4o7qVseqU8ILh7WF3zfAKciGTOWhIriy90CmIdekt5wuC09RrI/WrQ0lwrtoZ20Y6zz0uCNxcBH3c1gnC6K4M7VxsYONimWWzzHGNCH0FupTpuUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=c1D7tNFbBX7yGBpPKryOxlVgzfnpwEBvX+XCakX//vg=;
	b=ATRAvmmjUcEjmQ5rr27vPXmll0lwMs+LmatI10gvXIMlMT+PK1NJKyNrFFpscjH6/uQ4zqc8sJe55L/sk76sGxu7dMQCaxNt2JKBDn1f1uAx2C8lKHs4CbulvCQEIdOACjIacAUI+ahSewrHR6z5wGUFISvMEwD603Bci9L9jdYmz4gLbtOiiBKFSJRZiEWTtBkUr/AVyYuHMwOCJ42lP7wUkXYSxQGKpaeIcSPpcVmCGvTCTVsq+8QuQemVd34rPFiPE5WLIhwrVfjoDFdp8BUTRiP+IrwmzCRSwd9qKfhBGTD9NY9EqRcaJLMXWnewOybIOhNz1nO/n4TG7Bwb9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3176.namprd18.prod.outlook.com (52.132.244.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2305.20; Wed, 2 Oct 2019 06:48:04 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2305.017;
	Wed, 2 Oct 2019 06:48:04 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Chongyun Wu
	<wu.chongyun@h3c.com>
Thread-Topic: [PATCH 1/3] multipath.conf: add "enable_foreign" parameter
Thread-Index: AQHVeO1XL4I19CFP7UWMGbVKh+RtEw==
Date: Wed, 2 Oct 2019 06:48:04 +0000
Message-ID: <20191002064655.2669-2-martin.wilck@suse.com>
References: <20191002064655.2669-1-martin.wilck@suse.com>
In-Reply-To: <20191002064655.2669-1-martin.wilck@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR07CA0111.eurprd07.prod.outlook.com
	(2603:10a6:207:7::21) To CH2PR18MB3349.namprd18.prod.outlook.com
	(2603:10b6:610:28::19)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2.203.223.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 901a51dc-ed65-499f-68c0-08d747047996
x-ms-traffictypediagnostic: CH2PR18MB3176:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3176FC6B15A64BC7883E7CC9FC9C0@CH2PR18MB3176.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:205;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(189003)(199004)(6506007)(110136005)(25786009)(5660300002)(66066001)(2906002)(316002)(102836004)(478600001)(76176011)(14454004)(52116002)(26005)(4326008)(99286004)(6486002)(186003)(81166006)(81156014)(8936002)(50226002)(6116002)(6512007)(54906003)(66446008)(64756008)(66946007)(14444005)(256004)(386003)(3846002)(107886003)(44832011)(8676002)(2616005)(66556008)(6436002)(66476007)(476003)(71200400001)(1076003)(86362001)(71190400001)(36756003)(486006)(446003)(11346002)(305945005)(7736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3176;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G0JuMfTPHjPDyrD9inX5NO1uw9fveFyERVNm6ODdPR+O3NJLz1ALk8ptDgn3IeMCM+4cL4wXJEVPyY/8J4icah/TDXueRA7Y8WpQLegHinguIefn9QGO90srHB/0zMNye8d/3IdL/97zTbnOsv/C9hbblVEUivWoXXrzQt03fBtwYw1BGD7w8SMkFq2BC7G2s5BOYUZwIxgTgXMRiP/MNzZspN/7LeAevfeJ8NNrn5/7OXC6hTCRXczqqZHqlZN2ZCmfrwBFhOoLTgR/zoOVVZGejK8CKzRJteNIZ9AsVkq3OGY6pz0mC0TKWt6RFzFhu4jmBVWlswzmC55tt95nQ0H2z78+IYRJkCmoSjNguPbsGQ17p528CzlGTsb9nszB2mX/D1RRZGm8Gs5BWRsKcxzdk3NERuQvOBXnsqNmbGE=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 901a51dc-ed65-499f-68c0-08d747047996
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 06:48:04.3634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: blZQOUy6VqvzV0Cz/sMV575jo7gpoyaY3qHv/6U1Rv2Ih1++5XfoO8LGpUnevp3tDVw/zF7H4CnQcJH9WqTE5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3176
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.44]); Wed, 02 Oct 2019 06:51:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Wed, 02 Oct 2019 06:51:21 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x926pOAV014216
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 1/3] multipath.conf: add "enable_foreign"
	parameter
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 02 Oct 2019 06:51:29 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

This new configuration parameter can be used to selectively
enable foreign libraries. The value is a regular expression,
against which foreign library names such as "nvme" are matched.
By setting this to a value that matches no foreign library
(e.g. "^$" or "NONE"), foreign code is completely disabled.
By default, all available foreign libraries are loaded.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/config.h   |  1 +
 libmultipath/defaults.h |  2 ++
 libmultipath/dict.c     |  6 +++++
 libmultipath/foreign.c  | 53 +++++++++++++++++++++++++++++++++++++----
 libmultipath/foreign.h  |  3 ++-
 multipath/main.c        |  2 +-
 multipathd/main.c       |  2 +-
 7 files changed, 62 insertions(+), 7 deletions(-)

diff --git a/libmultipath/config.h b/libmultipath/config.h
index 0b978970..ffec3103 100644
--- a/libmultipath/config.h
+++ b/libmultipath/config.h
@@ -225,6 +225,7 @@ struct config {
 	vector elist_device;
 	vector elist_property;
 	vector elist_protocol;
+	char *enable_foreign;
 };
 
 extern struct udev * udev;
diff --git a/libmultipath/defaults.h b/libmultipath/defaults.h
index decc9335..4dfe007c 100644
--- a/libmultipath/defaults.h
+++ b/libmultipath/defaults.h
@@ -48,6 +48,8 @@
 #define DEFAULT_FIND_MULTIPATHS_TIMEOUT -10
 #define DEFAULT_UNKNOWN_FIND_MULTIPATHS_TIMEOUT 1
 #define DEFAULT_ALL_TG_PT ALL_TG_PT_OFF
+/* Enable all foreign libraries by default */
+#define DEFAULT_ENABLE_FOREIGN ""
 
 #define CHECKINT_UNDEF		(~0U)
 #define DEFAULT_CHECKINT	5
diff --git a/libmultipath/dict.c b/libmultipath/dict.c
index b5feb884..2b046e1d 100644
--- a/libmultipath/dict.c
+++ b/libmultipath/dict.c
@@ -610,6 +610,10 @@ declare_def_handler(find_multipaths_timeout, set_int)
 declare_def_snprint_defint(find_multipaths_timeout, print_int,
 			   DEFAULT_FIND_MULTIPATHS_TIMEOUT)
 
+declare_def_handler(enable_foreign, set_str)
+declare_def_snprint_defstr(enable_foreign, print_str,
+			   DEFAULT_ENABLE_FOREIGN)
+
 static int
 def_config_dir_handler(struct config *conf, vector strvec)
 {
@@ -1712,6 +1716,8 @@ init_keywords(vector keywords)
 	install_keyword("find_multipaths_timeout",
 			&def_find_multipaths_timeout_handler,
 			&snprint_def_find_multipaths_timeout);
+	install_keyword("enable_foreign", &def_enable_foreign_handler,
+			&snprint_def_enable_foreign);
 	install_keyword("marginal_pathgroups", &def_marginal_pathgroups_handler, &snprint_def_marginal_pathgroups);
 	__deprecated install_keyword("default_selector", &def_selector_handler, NULL);
 	__deprecated install_keyword("default_path_grouping_policy", &def_pgpolicy_handler, NULL);
diff --git a/libmultipath/foreign.c b/libmultipath/foreign.c
index 48e8d247..4b34e141 100644
--- a/libmultipath/foreign.c
+++ b/libmultipath/foreign.c
@@ -16,6 +16,7 @@
 */
 
 #include <sys/sysmacros.h>
+#include <sys/types.h>
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
@@ -25,6 +26,7 @@
 #include <fnmatch.h>
 #include <dlfcn.h>
 #include <libudev.h>
+#include <regex.h>
 #include "vector.h"
 #include "debug.h"
 #include "util.h"
@@ -111,17 +113,45 @@ static int select_foreign_libs(const struct dirent *di)
 	return fnmatch(foreign_pattern, di->d_name, FNM_FILE_NAME) == 0;
 }
 
-static int _init_foreign(const char *multipath_dir)
+static void free_pre(void *arg)
+{
+	regex_t **pre = arg;
+
+	if (pre != NULL && *pre != NULL) {
+		regfree(*pre);
+		free(*pre);
+		*pre = NULL;
+	}
+}
+
+static int _init_foreign(const char *multipath_dir, const char *enable)
 {
 	char pathbuf[PATH_MAX];
 	struct dirent **di;
 	struct scandir_result sr;
 	int r, i;
+	regex_t *enable_re = NULL;
 
 	foreigns = vector_alloc();
 	if (foreigns == NULL)
 		return -ENOMEM;
 
+	pthread_cleanup_push(free_pre, &enable_re);
+	enable_re = calloc(1, sizeof(*enable_re));
+	if (enable_re) {
+		const char *str = enable ? enable : DEFAULT_ENABLE_FOREIGN;
+
+		r = regcomp(enable_re, str, REG_EXTENDED|REG_NOSUB);
+		if (r != 0) {
+			char errbuf[64];
+
+			(void)regerror(r, enable_re, errbuf, sizeof(errbuf));
+			condlog (2, "%s: error compiling enable_foreign = \"%s\": \"%s\"",
+				 __func__, str, errbuf);
+			free_pre(&enable_re);
+		}
+	}
+
 	r = scandir(multipath_dir, &di, select_foreign_libs, alphasort);
 
 	if (r == 0) {
@@ -163,6 +193,20 @@ static int _init_foreign(const char *multipath_dir)
 		memset(fgn, 0, sizeof(*fgn));
 		strlcpy((char*)fgn + offsetof(struct foreign, name), c, namesz);
 
+		if (enable_re != NULL) {
+			int ret = regexec(enable_re, fgn->name, 0, NULL, 0);
+
+			if (ret == REG_NOMATCH) {
+				condlog(3, "%s: foreign library \"%s\" is not enabled",
+					__func__, fgn->name);
+				free(fgn);
+				continue;
+			} else if (ret != 0)
+				/* assume it matches */
+				condlog(2, "%s: error %d in regexec() for %s",
+					__func__, ret, fgn->name);
+		}
+
 		snprintf(pathbuf, sizeof(pathbuf), "%s/%s", multipath_dir, fn);
 		fgn->handle = dlopen(pathbuf, RTLD_NOW|RTLD_LOCAL);
 		msg = dlerror();
@@ -205,11 +249,12 @@ static int _init_foreign(const char *multipath_dir)
 	dl_err:
 		free_foreign(fgn);
 	}
-	pthread_cleanup_pop(1);
+	pthread_cleanup_pop(1); /* free_scandir_result */
+	pthread_cleanup_pop(1); /* free_pre */
 	return 0;
 }
 
-int init_foreign(const char *multipath_dir)
+int init_foreign(const char *multipath_dir, const char *enable)
 {
 	int ret;
 
@@ -222,7 +267,7 @@ int init_foreign(const char *multipath_dir)
 	}
 
 	pthread_cleanup_push(unlock_foreigns, NULL);
-	ret = _init_foreign(multipath_dir);
+	ret = _init_foreign(multipath_dir, enable);
 	pthread_cleanup_pop(1);
 
 	return ret;
diff --git a/libmultipath/foreign.h b/libmultipath/foreign.h
index 697f12f8..acd33601 100644
--- a/libmultipath/foreign.h
+++ b/libmultipath/foreign.h
@@ -195,9 +195,10 @@ struct foreign {
  * init_foreign(dir)
  * load and initialize foreign multipath libraries in dir (libforeign-*.so).
  * @param dir: directory to search
+ * @param enable: regex to match foreign library name ("*" above) against
  * @returns: 0 on success, negative value on failure.
  */
-int init_foreign(const char *multipath_dir);
+int init_foreign(const char *multipath_dir, const char *enable);
 
 /**
  * cleanup_foreign(dir)
diff --git a/multipath/main.c b/multipath/main.c
index 96a11468..4f4d8e89 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -1050,7 +1050,7 @@ main (int argc, char *argv[])
 		goto out;
 	}
 	/* Failing here is non-fatal */
-	init_foreign(conf->multipath_dir);
+	init_foreign(conf->multipath_dir, conf->enable_foreign);
 	if (cmd == CMD_USABLE_PATHS) {
 		r = check_usable_paths(conf, dev, dev_type) ?
 			RTVL_FAIL : RTVL_OK;
diff --git a/multipathd/main.c b/multipathd/main.c
index f7a57c74..70172d71 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -2840,7 +2840,7 @@ child (void * param)
 	}
 	/* Failing this is non-fatal */
 
-	init_foreign(conf->multipath_dir);
+	init_foreign(conf->multipath_dir, conf->enable_foreign);
 
 	if (poll_dmevents)
 		poll_dmevents = dmevent_poll_supported();
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
