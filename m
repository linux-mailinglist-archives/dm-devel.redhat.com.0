Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E947A8EECC
	for <lists+dm-devel@lfdr.de>; Thu, 15 Aug 2019 16:58:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B5F546412F;
	Thu, 15 Aug 2019 14:58:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 450E083886;
	Thu, 15 Aug 2019 14:58:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F0F5718089C8;
	Thu, 15 Aug 2019 14:58:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7FEtuhB008931 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Aug 2019 10:55:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 623FC45D1; Thu, 15 Aug 2019 14:55:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E68543FD8;
	Thu, 15 Aug 2019 14:55:49 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F38430860DF;
	Thu, 15 Aug 2019 14:55:47 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Thu, 15 Aug 2019 14:55:14 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Thu, 15 Aug 2019 14:46:56 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.8.13) by
	M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Thu, 15 Aug 2019 14:46:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=XNWgjIYifvw9Bj7PR6ABJewXiNB7T93m9Ng+MXPYukH9mpJoCMySjE7FKg7mpderc/AoQeKfjNP/KjONGrvOpYTiekMB7uNWvss3e52QVAnd6EPkteVZ3kcqN55megkIiAL6s0Gp0qz7SFQjXi6yJXWQIjkmrPiGTBCb9u6T3Jdc8RrgJKTXrQkWZzfjNHN6VuXoBp3GucNSGnRmWRKGLZNciEPOu39z2QQx8ArxmIyTJQB6g6EIUPjtYWO0/o0rGYEAtZzqU2WBFHnuBc6EB655vcpOO5ozurO+HbeGljpBmCppGJDNQnSfhRfROFR4Cj62e178y6LJM1u6LAOtVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=FjwRskU2eo/lhD6moX0KScSIaqbT0OBq5yBIi5nKqMQ=;
	b=IMFbSquuy9Skbw5G+PIV/jcj/kOWqIl/LRXoLgC4Ty3NRJocqKpJ26XRT9CoBIKxce7eSNytua3G/RuNA3+U1zAjqzVECl3T+zDpmacDJK8lPweMHEslmV/VDaqvKv+1/bPsOFAJ91EsGqCoj7Hg2j2ud1cSR/tqn/Qkz0XW7P8Nyrv3Hu7ccZ4+5C1KSOgxThnXjIPq6Bsxy0fAVmcTHl82X8yG3UF85FDx54eXGPQuvRuOtiy/jFaV0z1O/eoYJyVI85RpztM9RwSGP9XGZtIcuAjlHehSimS1pd9dbsob6fJfMzuJnHE9mLUEv7Mj/rwkxADXUeD6CVl+eZC0BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.14; Thu, 15 Aug 2019 14:46:55 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2157.022;
	Thu, 15 Aug 2019 14:46:55 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 1/2] multipath.conf: add "enable_foreign" parameter
Thread-Index: AQHVU3hIcgySVIT/9UW/gH0roU/Biw==
Date: Thu, 15 Aug 2019 14:46:54 +0000
Message-ID: <20190815144638.5664-2-martin.wilck@suse.com>
References: <20190815144638.5664-1-martin.wilck@suse.com>
In-Reply-To: <20190815144638.5664-1-martin.wilck@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM7PR04CA0018.eurprd04.prod.outlook.com
	(2603:10a6:20b:110::28) To CH2PR18MB3349.namprd18.prod.outlook.com
	(2603:10b6:610:2c::27)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3dc85be-b8d7-44f6-f5a8-08d7218f6a74
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3349; 
x-ms-traffictypediagnostic: CH2PR18MB3349:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB33495F2175E2D0952B58A0A7FCAC0@CH2PR18MB3349.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:205;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(199004)(189003)(4326008)(446003)(11346002)(256004)(14444005)(2616005)(66066001)(186003)(44832011)(6486002)(25786009)(476003)(486006)(107886003)(53936002)(99286004)(14454004)(102836004)(6512007)(386003)(6506007)(2906002)(26005)(36756003)(76176011)(6436002)(6116002)(66446008)(71190400001)(71200400001)(66556008)(81166006)(66476007)(305945005)(52116002)(8676002)(8936002)(1076003)(64756008)(81156014)(7736002)(110136005)(66946007)(86362001)(3846002)(54906003)(478600001)(50226002)(5660300002)(316002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3349;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yEcphdSIWJ21dOzPXL50Yi95r7Dlfb+BSMHVECyo8OrrQuF4S3N2B51pqnox2LgK4l6ySawnvSyyRS99+fGYasvWhdz1BDOVWkY/0ATDLEkhWbxI2mQwYYMFP5y5eqkaJvttvLbkaT9NHkp/JcayHulYsMRHwC4i2XTxV5xfi3EEp/BdkA7sUESCYBbPdBXRW9kqZV5gcbsZcvIm7aetD3mG4fRPY6I3Xqwgv8zoLM1C/sLBi5NNaMdkA4nIvSwpLhE7b/5/1srDYvIQdqRckuCU1Z8bcWkNWUkZcs+oKqDpshe1N0uDaWxMAXoOXNoVszuuNaBx3EVSKm5lozvxzy+xJx+j2T6Hy5755jiPLUrZpi4YHW/6MJtI5VEefiO8ZwdhjA/KLVH/IWY56BXpJXIIV+lsznNcLqDepPKR1nc=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a3dc85be-b8d7-44f6-f5a8-08d7218f6a74
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 14:46:54.9162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TQW+hUZRGyKt5ivLyuGvn+LEh0RzdU7kfaIC5HdutWBoTB4xRfQHWzdewRnHuhPvfkx0+w9gbxGUfaSInW+PEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3349
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.44]); Thu, 15 Aug 2019 14:55:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Thu, 15 Aug 2019 14:55:48 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7FEtuhB008931
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 1/2] multipath.conf: add "enable_foreign"
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Thu, 15 Aug 2019 14:58:17 +0000 (UTC)

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
index ff2b4e86..36e99196 100644
--- a/libmultipath/config.h
+++ b/libmultipath/config.h
@@ -224,6 +224,7 @@ struct config {
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
index c6eba0f6..9f282c3f 100644
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
@@ -1710,6 +1714,8 @@ init_keywords(vector keywords)
 	install_keyword("find_multipaths_timeout",
 			&def_find_multipaths_timeout_handler,
 			&snprint_def_find_multipaths_timeout);
+	install_keyword("enable_foreign", &def_enable_foreign_handler,
+			&snprint_def_enable_foreign);
 	__deprecated install_keyword("default_selector", &def_selector_handler, NULL);
 	__deprecated install_keyword("default_path_grouping_policy", &def_pgpolicy_handler, NULL);
 	__deprecated install_keyword("default_uid_attribute", &def_uid_attribute_handler, NULL);
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
index 7a5cd115..b5f08617 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -2848,7 +2848,7 @@ child (void * param)
 	}
 	/* Failing this is non-fatal */
 
-	init_foreign(conf->multipath_dir);
+	init_foreign(conf->multipath_dir, conf->enable_foreign);
 
 	if (poll_dmevents)
 		poll_dmevents = dmevent_poll_supported();
-- 
2.22.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
