Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6BBD52AB
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:31:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E65D308FBFC;
	Sat, 12 Oct 2019 21:31:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AF5E5C3F8;
	Sat, 12 Oct 2019 21:31:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 97EAB1808878;
	Sat, 12 Oct 2019 21:31:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLSdNS006139 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:28:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 99162F6E1; Sat, 12 Oct 2019 21:28:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx30.extmail.prod.ext.phx2.redhat.com
	[10.5.110.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A16B19C70;
	Sat, 12 Oct 2019 21:28:37 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A8A4A1DB0;
	Sat, 12 Oct 2019 21:28:35 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:27:56 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:05 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.12) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ZhLFbAdqnb9A/vcoQP9DnBzDkhNHJNCzYG7OoTilk2QDvs/UoNyoyW6uuRruoiGv5QkREr2MAOpa2B7OUprr90k7VpBGXEokSfrBg2mDeYo4hOGQfO2IzZ7R1dm+96qiuxHQWxAKm5M9+XbuiQk6/iQEa8QVMqiTAC0/r3PU7/ZYLqS/kJ6sPkFyxH67SneGAygkadDgjV8o5rNAbO6ut0LfeSCUIE2V1KNCE8cAlRq++3Wwg2K2DJAjIK11q7VQPe4guKrbbZ1GGhlRWUluGoJzL/OhhKvHegQ7X/I1hxc+8zMfM6352mVR9Ovtcxrp2hwV74PNmjDMiqhKFDNMdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=EsZn2fNEJJ86VpaG92OiYpmOQXeGq3FEx6av4yj7XZI=;
	b=H9PqzWGfSaVVEOZHuYPxfZiLp/KOPhfHfzt7NfXnWk0c9lY3XkI3XT0xTLuMAgW9IMPqZUYnwcksfRHrfOsWUaraEJ79OC7FG7gWjtOoOL0zgCPBdElo1IxN96rX8fOaFBKRLcr+bb1fLYXRgMg8wpLQl6q9Xedgx2pcKWQ26zeg8un8TEsRyDWzwkRqTD780BAW+VrtHqIhKqc3nHXqX9cvmABhLoISi8XgOnso/ahNMj/5YGoI4ly0koV9vzEHx99mWFPxiqEIU39e8OoXbpuX/janNHeM67FUC2gzBfGSGVvBBbM5+I+c04dNb4N7jbPfz5x8jUwZG2wSyslQRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:03 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:03 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 21/72] libmultipath: process_config_dir(): remove unused
	argument
Thread-Index: AQHVgUPuSf8/ntVI/EGpWwboc2+xow==
Date: Sat, 12 Oct 2019 21:28:03 +0000
Message-ID: <20191012212703.12989-22-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: cabc182b-9750-4603-8281-08d74f5b1063
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317F3A96BBDCCBD8BBE08F1FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(1496009)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(14444005)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(4744005)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UU59VYNG9VQmwyf45i05hlbxMokM/MtqkUCJnDcXAXxi42EWPAQBgAo/pMJuyXN9o+2tBik1dByMPvv76E5jos60QyEzeYBxOt4k41YKPBL0f932RSd3YsP0FHtXNuMEJIeH/+R8QiYZ0RGl0WHJVei1byUzKmN4UJGlDuQVW4OYeirOrBXOFUdpRr7J9wNgMr9S/fkeGtkttxixbWWN3gZaBQvZ8XHZbWJ2wJQogbGCbjTxdXbX7QotjcBGsZEsKTRu3tit1xZfEXu84fCLp0rawQrf+JbBcawiMh8vboPfu8h0dgdtHHgY1Jsebtm2gZgqUoXU8AD0ghQNIh5ZLZy6cDEDfRIIIJqHkgYrr0EckbIKK+OaKz4rJSbaM9n39r1oNBhPUcs/ZSjhpl3BSkpHWSiuyyYnDUkJhSCaI2U=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cabc182b-9750-4603-8281-08d74f5b1063
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:03.4817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rVZp6Y/n3nmXQGThakKBfKDn9DdMyoaQpo3Zywa9CkpBabEgGiBEFuKvouChAzisUEihmp8SC+eibD3/nYkasw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.71]); Sat, 12 Oct 2019 21:28:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Sat, 12 Oct 2019 21:28:36 +0000 (UTC) for IP:'15.124.64.67'
	DOMAIN:'m9a0002g.houston.softwaregrp.com'
	HELO:'m9a0002g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.67
	m9a0002g.houston.softwaregrp.com 15.124.64.67
	m9a0002g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.71
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLSdNS006139
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 21/72] libmultipath: process_config_dir(): remove
 unused argument
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Sat, 12 Oct 2019 21:31:06 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libmultipath/config.c b/libmultipath/config.c
index 20e3b8bf..49723add 100644
--- a/libmultipath/config.c
+++ b/libmultipath/config.c
@@ -644,7 +644,7 @@ free_config (struct config * conf)
 /* if multipath fails to process the config directory, it should continue,
  * with just a warning message */
 static void
-process_config_dir(struct config *conf, vector keywords, char *dir)
+process_config_dir(struct config *conf, char *dir)
 {
 	struct dirent **namelist;
 	struct scandir_result sr;
@@ -749,7 +749,7 @@ load_config (char * file)
 	if (conf->config_dir == NULL)
 		conf->config_dir = set_default(DEFAULT_CONFIG_DIR);
 	if (conf->config_dir && conf->config_dir[0] != '\0')
-		process_config_dir(conf, conf->keywords, conf->config_dir);
+		process_config_dir(conf, conf->config_dir);
 
 	/*
 	 * fill the voids left in the config file
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
