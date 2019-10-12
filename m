Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0419CD52DD
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:37:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4857210DCCAD;
	Sat, 12 Oct 2019 21:37:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16CF310016EB;
	Sat, 12 Oct 2019 21:37:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9141D4EE68;
	Sat, 12 Oct 2019 21:37:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLVl48007061 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:31:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4C8F65D71C; Sat, 12 Oct 2019 21:31:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E148F5D717;
	Sat, 12 Oct 2019 21:31:44 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AF0D83082E90;
	Sat, 12 Oct 2019 21:31:43 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:30:50 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:52 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.11) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=CNbsN/bQyYdE5GcdzETJucoDbebec7575QDq0WyCighr57fA13aM+61enHX0qmtEA15Toz0+jnXnWcLzbP8AtpBiDRViii5nJlUs6DnnF21NjIllrQlo3erLMpG5mF8p5iRnbnvoF6tSbwAI9sHdfX//y/Q8F8Uj8FHAHFJGRaAxMFyjfgOa1jZ1TA69JAfU4hvDLMgAoyVCZ7Won8YRHjtkqy5LCkqTii7Wqdj/WrxomEZfHdqpplxyrPXNzQWk6KhYBisGHO2KoPszUXX9MTwZpZeQR5Dv63nJOYHa04TL3JZwgl4N3XeGUz4dzts+/7JlTE1PZXJ7WWD2WentLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=EIMS7pDT/kp0zRV83NwUsGh/+j1v4fTQma34O1osyXw=;
	b=ZPbuLW7kyOvwWC0exCbVue2K45/u8OlyEv474p73RGKCcrcmZhToFtyveHd0f6yphS6y4y06Eo8NeGPKxkMTL1v///qQ/U6p2IC/NH2Cnxm8yu86/8xvWEIMigx9fkaPfAFSGUbnMO9sDCKKcO+jSgq9O5+defVg2WIZMS4G90f36mhZrAFqG1D2HQRIdEb1wUjOP0qBoFOAJ+45phVaMO9wFHMRrN+mJoU09VLMcFF7rnceMgAzO/3cX5UJaPvx/wUfw8RuAoavQNTOim7VL0R52pRtbAPfbcEud8NCAUXlRlEX7plB7ZuoAKY8nk11e2OnU2B0vYLojcb2AFWFHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:48 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:48 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 35/72] libmultipath: snprint_multipath_map_json(): remove
	unused argument
Thread-Index: AQHVgUP4TvjbDFMrqEGZXALjE6HnWg==
Date: Sat, 12 Oct 2019 21:28:20 +0000
Message-ID: <20191012212703.12989-36-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 3c2d8cc9-d508-4cf8-4270-08d74f5b1add
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317DDB35CB2546BFB6E607FFC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(6666004)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ufGVUsc4+3D8KcrBOtKxr7ujlWWpln2A7HrljOiduGSt7VOctyWz6GDmAi6LOYn7RRilwy6HwEgaUsHZYQn+v80fdp0oeWl5GSXK2zAsANJMGu3yLsIsuqbpzbQPQiAkIm+MPP+7ymEgfnX6oiy06BCziDQoFbaSzLr0PEGQ2+YfalBlmbG+PoJCsr5tWf/JVK/oiRxntldqKfqiKMdVmqvdQW3cLzRPyLJ7+bSgfrAszbgyohjzXIgservRTTcC+f5xPxVpXW0Cz2X8eFmP2swqg3VuVkUGVlR/6bCKweVkeZOeEJCqQ3F3u8DnfuvPnwfAdxjYMGgJ5cLkcmrKZ0cwgR+amm1w3WG1y4GTG7x4AmRRf0zLb0IXZEQC5kQioaeH8EOeDCBCBa2w6lpZQXIqislIDG3ZK0xINOGTU1o=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2d8cc9-d508-4cf8-4270-08d74f5b1add
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:20.9000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CVgx0CBBVsPHxXnhD6G/Aqum1NopOBTLqeMJI4jRuuMcJWl5QqTsjTZ+gJQn7Q/pt9ac9mbB0wULjXGMMNZIGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Sat, 12 Oct 2019 21:31:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Sat, 12 Oct 2019 21:31:44 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLVl48007061
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 35/72] libmultipath:
 snprint_multipath_map_json(): remove unused argument
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Sat, 12 Oct 2019 21:37:22 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/print.c      | 4 ++--
 libmultipath/print.h      | 2 +-
 multipathd/cli_handlers.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/libmultipath/print.c b/libmultipath/print.c
index 74c0d62d..8fa86267 100644
--- a/libmultipath/print.c
+++ b/libmultipath/print.c
@@ -1339,8 +1339,8 @@ snprint_multipath_fields_json (char * buff, int len,
 }
 
 int
-snprint_multipath_map_json (char * buff, int len,
-		const struct multipath * mpp, int last){
+snprint_multipath_map_json (char * buff, int len, const struct multipath * mpp)
+{
 	int fwd = 0;
 
 	fwd +=  snprint_json_header(buff, len);
diff --git a/libmultipath/print.h b/libmultipath/print.h
index 7e36ec63..0c909e75 100644
--- a/libmultipath/print.h
+++ b/libmultipath/print.h
@@ -125,7 +125,7 @@ char *snprint_config(const struct config *conf, int *len,
 		     const struct _vector *hwtable,
 		     const struct _vector *mpvec);
 int snprint_multipath_map_json (char * buff, int len,
-				const struct multipath * mpp, int last);
+				const struct multipath * mpp);
 int snprint_blacklist_report (struct config *, char *, int);
 int snprint_wildcards (char *, int);
 int snprint_status (char *, int, const struct vectors *);
diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
index 8a899049..371b0a79 100644
--- a/multipathd/cli_handlers.c
+++ b/multipathd/cli_handlers.c
@@ -237,7 +237,7 @@ show_map_json (char ** r, int * len, struct multipath * mpp,
 
 		c = reply;
 
-		c += snprint_multipath_map_json(c, maxlen, mpp, 1);
+		c += snprint_multipath_map_json(c, maxlen, mpp);
 		again = ((c - reply) == maxlen);
 
 		REALLOC_REPLY(reply, again, maxlen);
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
