Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FE5D52D9
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:36:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A84D883858;
	Sat, 12 Oct 2019 21:36:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0393B10013D9;
	Sat, 12 Oct 2019 21:36:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5531C1803517;
	Sat, 12 Oct 2019 21:36:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLUpVX006839 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7877260BF4; Sat, 12 Oct 2019 21:30:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52FD260BF1;
	Sat, 12 Oct 2019 21:30:51 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C66DF2BF73;
	Sat, 12 Oct 2019 21:30:49 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:30:11 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:29:40 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.13) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:29:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=m8rJ5HQRh6VSE9pxwX31+TFW5oKmaPenbJV+ufCaZUpc7Bpjx0IweKV3ncw1vQwjbI3JUcWXhW1aHo/5kPo7Ou82r9YNWHdYyL86EuzA346i0Io93nV7bCcWs+xyMfIXXV1hHzqvQWDYz2rVcNbh7z8KN6ANbsGoS4KjYOQHNA7RRsXve1x7WhX3i35UwmrHPNkOl8vJVuGDj7ryIzZw6rTBBNnAKhZJPTM2AW9juViIZ5+rx2ZCmFo9OVMYEt9J+V/bwv65nTVv1f6RWTjZ96AvkIYgM2qarvYeQzTERl9WUiezevlQWOUaJev9qfFbAvswK1GSBUrGoypwir0TRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QJbbniqy4o/nUsfaYSkX7jG2kuRLpEY1s/VPB2Cr1Yk=;
	b=lC/dFYmw1nKKokRg+0zsILzSWadpFPT4pRCghz0SdxHglgMqOqFMAQgXwVCAe7pLfErtkFYlhLvGfKPUR70XmRSvFlxiXsOafkHCFcmmrc1Hd3aNokaTs3TihY+LtfnAVlhPGmbpP5BLTG7UYuKCjiSRIyLqRssBHTv+eO6oKvAXQRg1Nc/LT0koLX4U1IYb94uNStenJGKnmBC0c78hA2CxejRd1OA55J9qzKC/mmacD8zx6qwTX5+N7lrjQtR30gULiUmzSpGC2ejkmvTLSVlthxcnBnqKxzTqY6MjJWEanc6s21RS9lYi9Dq/Bw0BjvNAM8mzuuOOv9DhI0mb0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:29:35 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:29:35 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 69/72] multipath tests: Makefile: fix "clean" target
Thread-Index: AQHVgUQRf+mc7Ilui0GOsPSLuetprA==
Date: Sat, 12 Oct 2019 21:29:03 +0000
Message-ID: <20191012212703.12989-70-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: ecb5611b-d859-417f-9ad8-08d74f5b3447
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB33170E1A886B609B294B0D25FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(6666004)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(14444005)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(4744005)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hE444oIbXNidqZTdwj8FSBSzdLYF6LgsITESsKuiYOJpJO/zI4lpw97fBNForRGz9wDZWnxy59FO5YQrygOoOohTNZFS6NUGVJ5+yhKmEFatYtWbICFVFA4mPhOKZXG0EaxV4RmNvZ1PtUsXnypMSmkQ6IkiCPv4vM84yssb4OkT6aLnhSp/wDOZJ/hLN4QjSh245P+KNSkrh6XRDAlVZdpzhh91bGQdhnBx0/6FxCWnIQfr5nWpQiVpwicNn1xl8py7OuktGCwlO1em3NZwXe7foE+RjaeK6OcAe/aG8OsZXYWaCcj2lg9hZgN+Gh3C8ugE+Eh3ZMw33t4cx/iYqJ1r/bMJRUqaDIN9h218PTDLnswXg2X4dM1q0goeRIj6DQS25JR0jHSxstR035XduzjeEmY9uL1KgvY3AfyO2sQ=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb5611b-d859-417f-9ad8-08d74f5b3447
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:29:03.6509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gkkx/5gNKtg6clzKfjcKSwsEPvf/YkTdp+rMByMkdoRWVR9pzRgK4cllH4gdrY2YrPDAPOfmQD+PUMzbk47MDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Sat, 12 Oct 2019 21:30:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Sat, 12 Oct 2019 21:30:50 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLUpVX006839
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 69/72] multipath tests: Makefile: fix "clean"
	target
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]); Sat, 12 Oct 2019 21:36:20 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile b/tests/Makefile
index 60338f14..c70b8399 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -42,7 +42,7 @@ lib/libchecktur.so:
 OBJS = $(TESTS:%=%.o) test-lib.o
 
 clean: dep_clean
-	$(RM) $(TESTS:%=%-test) $(TESTS:%=%.out) $(OBJS)
+	$(RM) $(TESTS:%=%-test) $(TESTS:%=%.out) $(OBJS) *.o.wrap
 	$(RM) -rf lib
 
 .SECONDARY: $(OBJS)
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
