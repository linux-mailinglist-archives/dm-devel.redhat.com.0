Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D3434D529D
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:29:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E8C7180166E;
	Sat, 12 Oct 2019 21:29:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 876585C299;
	Sat, 12 Oct 2019 21:29:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 16A094A486;
	Sat, 12 Oct 2019 21:29:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLSTuq006048 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:28:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D17B5608C2; Sat, 12 Oct 2019 21:28:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9157608A5;
	Sat, 12 Oct 2019 21:28:29 +0000 (UTC)
Received: from m4a0041g.houston.softwaregrp.com
	(m4a0041g.houston.softwaregrp.com [15.124.2.87])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B849301D671;
	Sat, 12 Oct 2019 21:28:28 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0041g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:27:34 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:27:58 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.11) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:27:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=XkDac5CJqRTOGaO1og+J8gAx88HEaXhU+f3/zVPjd4AAuBvecPDg9vDjQAgBjAfJZQZrIYdCNFm+gjLxdSzyntnyRZoi7ciSIr19WvwI9bHaIZLvd/EJAqxRUWBAwNWHf840wFxk2TzPN5M7uV/6y1fW33wDUVkX4TDA8APfYacJqt8wNpf0c9ng55IR+amnmC3ssIAXEGBnDBk+/iF+ZyU1KWq62PRIxggLsyXx4RwirZL/uKKpko58fggiDYFPfchzb12q4ExsZHPttie4AzPIx2F2zTIXTT/xmEW6IIo4Ekp1tnmozeTeMx0LTFbSIFPnHEuN66Du+KE8noGdXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=xH7DKghXMUAQsPP05meR5e6gY2G/5HvR++AzbhX/tzw=;
	b=epGFOvqyc2SKflQx6FEen0b71UxkLkUBQgsBGIIalf/lO7rs/XwGKQQtZ9r3vdMrbouzdKLGBQuA5NmJbbFYUgzcAjX0BgMZkpPYcUQ1z7CQ5An1Lx3HSvda3pwwPR5EWRK9Fug7cICADUnzEgSVD5hkxTETsiN6WmHFwYaeG6pX9TNmI995XJMTA1mBi0kzVUpXvmM+tuy4M3MZ/euktIxFdqtdVBSURNQLoYMS2Abu3gAZPwkhCrc8ntITF3eHNduXQM7EJNIywFRT4On5qULp5fvZs3cQ4X6cB+VBdL/12QOBeI3t/UpTgXKWqAQl/6SeIyhgDQx4xjKtI2+B3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:27:57 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:27:57 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 16/72] libmultipath: make path_discovery()
	pthread_cancel()-safe
Thread-Index: AQHVgUPqnzv3jnlGqEilDNHk61rXRA==
Date: Sat, 12 Oct 2019 21:27:57 +0000
Message-ID: <20191012212703.12989-17-martin.wilck@suse.com>
References: <20191012212703.12989-1-martin.wilck@suse.com>
In-Reply-To: <20191012212703.12989-1-martin.wilck@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR02CA0045.eurprd02.prod.outlook.com
	(2603:10a6:208:d2::22) To CH2PR18MB3349.namprd18.prod.outlook.com
	(2603:10b6:610:28::19)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2.203.223.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25ce0e5a-06d3-4733-675c-08d74f5b0caf
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331784908835654545F07178FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kPNWgCr4RFeQbU3Yu7fi3CMzLaGSA70ke3x02ciVOPN8ngBbtGb1/UmfJG9o4eTVRsrROMWFOjUjL/rSi30XdLfEDzYNHPivCvBkpnPd/dguIBc3voEqq/OqVdpfJaYXpEkeKicAAU1k1AYXNrhUmubTjoRIBS0f71NbCVRh2qr5FMvjstBCZ0luDXL75recWHJuLfn783UCYcJK5MxC2lP8RnGDFdgE7N/6V1CilP3B6rivb62lHTIfn9U22vWkvVo8xOFJ7g2kHHUK3PtErdYdc1jyY7hinIpZttaPAJJlQf1YT4wJdckHHZEMwevJ1sjiJPWZzYuQqwQkg8rRvvxjfYzG9PlRtCpcqiotzwb87PKFDA4ih+jfhXITpuZFJWt30jUFiud6FqmPVdAD0gaibF4NTeLL4fz9x2wad+Q=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ce0e5a-06d3-4733-675c-08d74f5b0caf
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:27:57.1353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iIbYILz/EZ1DhTOXTAv2amjc8WY69rXZOESeec/zjYuupGK2lDP2ZjZOBpOFIvGoh4RyhTAQ6+G9mWIA2Avs4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.47]); Sat, 12 Oct 2019 21:28:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Sat, 12 Oct 2019 21:28:29 +0000 (UTC) for IP:'15.124.2.87'
	DOMAIN:'m4a0041g.houston.softwaregrp.com'
	HELO:'m4a0041g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.87
	m4a0041g.houston.softwaregrp.com 15.124.2.87
	m4a0041g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLSTuq006048
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 16/72] libmultipath: make path_discovery()
 pthread_cancel()-safe
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]); Sat, 12 Oct 2019 21:29:41 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

The udev_enumerate and udev_device refs wouldn't be released
if the thread was cancelled. Fix it.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/discovery.c | 51 +++++++++++++++++++++++++++++++---------
 1 file changed, 40 insertions(+), 11 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index e68b0e9f..d217ca92 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -140,19 +140,47 @@ path_discover (vector pathvec, struct config * conf,
 	return pathinfo(pp, conf, flag);
 }
 
+static void cleanup_udev_enumerate_ptr(void *arg)
+{
+	struct udev_enumerate *ue;
+
+	if (!arg)
+		return;
+	ue = *((struct udev_enumerate**) arg);
+	if (ue)
+		(void)udev_enumerate_unref(ue);
+}
+
+static void cleanup_udev_device_ptr(void *arg)
+{
+	struct udev_device *ud;
+
+	if (!arg)
+		return;
+	ud = *((struct udev_device**) arg);
+	if (ud)
+		(void)udev_device_unref(ud);
+}
+
 int
 path_discovery (vector pathvec, int flag)
 {
-	struct udev_enumerate *udev_iter;
+	struct udev_enumerate *udev_iter = NULL;
 	struct udev_list_entry *entry;
-	struct udev_device *udevice;
+	struct udev_device *udevice = NULL;
 	struct config *conf;
-	const char *devpath;
 	int num_paths = 0, total_paths = 0, ret;
 
+	pthread_cleanup_push(cleanup_udev_enumerate_ptr, &udev_iter);
+	pthread_cleanup_push(cleanup_udev_device_ptr, &udevice);
+	conf = get_multipath_config();
+	pthread_cleanup_push(put_multipath_config, conf);
+
 	udev_iter = udev_enumerate_new(udev);
-	if (!udev_iter)
-		return -ENOMEM;
+	if (!udev_iter) {
+		ret = -ENOMEM;
+		goto out;
+	}
 
 	if (udev_enumerate_add_match_subsystem(udev_iter, "block") < 0 ||
 	    udev_enumerate_add_match_is_initialized(udev_iter) < 0 ||
@@ -165,6 +193,8 @@ path_discovery (vector pathvec, int flag)
 	udev_list_entry_foreach(entry,
 				udev_enumerate_get_list_entry(udev_iter)) {
 		const char *devtype;
+		const char *devpath;
+
 		devpath = udev_list_entry_get_name(entry);
 		condlog(4, "Discover device %s", devpath);
 		udevice = udev_device_new_from_syspath(udev, devpath);
@@ -175,19 +205,18 @@ path_discovery (vector pathvec, int flag)
 		devtype = udev_device_get_devtype(udevice);
 		if(devtype && !strncmp(devtype, "disk", 4)) {
 			total_paths++;
-			conf = get_multipath_config();
-			pthread_cleanup_push(put_multipath_config, conf);
 			if (path_discover(pathvec, conf,
 					  udevice, flag) == PATHINFO_OK)
 				num_paths++;
-			pthread_cleanup_pop(1);
 		}
-		udev_device_unref(udevice);
+		udevice = udev_device_unref(udevice);
 	}
 	ret = total_paths - num_paths;
-out:
-	udev_enumerate_unref(udev_iter);
 	condlog(4, "Discovered %d/%d paths", num_paths, total_paths);
+out:
+	pthread_cleanup_pop(1);
+	pthread_cleanup_pop(1);
+	pthread_cleanup_pop(1);
 	return ret;
 }
 
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
