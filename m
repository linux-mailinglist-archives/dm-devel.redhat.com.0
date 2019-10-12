Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B8828D52C6
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:33:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 06E1AC08E2A3;
	Sat, 12 Oct 2019 21:33:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD2B15C231;
	Sat, 12 Oct 2019 21:33:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 366531803518;
	Sat, 12 Oct 2019 21:33:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLUIh6006573 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 51FE65D9CC; Sat, 12 Oct 2019 21:30:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0E725DA5B;
	Sat, 12 Oct 2019 21:30:15 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 137B8C01DDF8;
	Sat, 12 Oct 2019 21:30:14 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:29:35 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:08 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.12) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=fUsG99JISv75N1VxzXkMnmbKaoUYDvl0zGHPWn2urzqTerYXV03yeMIK+Za8ZwIzIrFBnnEzkjt63nLyaRkoGwSQcrGU9M80URmc1Giraysfd3pSViuqFpeMZhYtEx8DL2eleVWuXpe6mw/B8VwL7jliUS3KD/r0NxO5WCtpfPbuGco+oRRDno9EOy6fN62Hp8F8XdSDDgUctuc8oQXDeKSrvBaXg/idlspBgL+zJiH8iWEpxBzKQIlOyuiZZWRtilgJmHriNJnotZZYIIMWLPJQSSgxKuEapDexMMbIYh+hCrtDzjXAr2ReawfngxoGT/wXCyQ2VJBMWPLDsUAUfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Hr+hBqDNnx7+KgbZGrgcyLoCjglrrvu1iLDoNs+r6lk=;
	b=C0cGK6yNP+xubCjByjoodT1CIDEA3WhW/3/+Yun2zwgRmbvYtt5+UkoSxLM/3MzgP66acMJpUEVJTOKkz2jk3PTK5yj5dQ01gh7XhDhauRO6vHZUSIWF/qSMcFkVFgZZCS+VMNseZ7ltMIxrZk17RdNwDpWIosO8MhzkGczt7wTIvtV4XfXrlNTbfO5aNPyn92B1HtUVJthln0ReOSirZ90zeBsd6ZAdSssWIqyvRc/nvqipGiLZWe4/lKE2/6LP/qW2rBfVxrmJI+CseNP9vYHY1Scxu84vLlCqnOD00nxoUfOJchCZ+37YNFTCYCxgJgAA1cZOYYQ1BDrCzxrY+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:06 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:06 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 23/72] libmultipath: scsi_ioctl_pathinfo(): remove unused
	argument
Thread-Index: AQHVgUPvghIrB42IdkCiIqQjvw2ykg==
Date: Sat, 12 Oct 2019 21:28:06 +0000
Message-ID: <20191012212703.12989-24-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 03f45df0-cc1e-4a1d-85db-08d74f5b11f3
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317E2976FB1EBAA4022BBC4FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:181;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(1496009)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(4744005)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lTnD3Y04bGCPBUlJp8szxvmbZ4gGKvk+d5XfqEJiMYZNmfMnNTWeBmp5mFB/P8V8jvFxXFHzAZ0obiPTXqvhfhmVmrXvJ3nZ6y9a5acQ5J+7EyeBclXaYxkscOBm9sxMHtWfAA4Fsobh+gp9zDvWGtzOx4F2np6RLHdIqgAQf3xYyCWTZqqL9Bq10bOUtnMXAmZHMebmkQqWYuojt8sOrwmhdIiLoeqlYlmMiDOkJxCr5pI1e8uDHfpKoP/NvPisfx6Wpt0WOUP3oc8kP5+hiOGaY51lehDryaKc4nVd2PBEBlRjdQvKL9dYRnddhAcxxyxIE/ixEFR1P/w1E0MGxZakCF1Epb55EQF6pUx65EnaTLDriL34fcqTDNvpgQtw57nIJtcxv/C/QvQGU5n5d9UjBqLvryu1/3xG8vf0JqY=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f45df0-cc1e-4a1d-85db-08d74f5b11f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:06.0943 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cYhiBLbdvjLRo66pJkXMud1HYv9rCP2UC/AZEcdJpsPn3aKaxOU3OpBxY/mKc9OBw3qmyYTfiCEMr5RxinSD/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Sat, 12 Oct 2019 21:30:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Sat, 12 Oct 2019 21:30:14 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLUIh6006573
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 23/72] libmultipath: scsi_ioctl_pathinfo():
 remove unused argument
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Sat, 12 Oct 2019 21:33:31 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/discovery.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index d217ca92..4d93c91b 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1571,7 +1571,7 @@ sysfs_pathinfo(struct path * pp, vector hwtable)
 }
 
 static void
-scsi_ioctl_pathinfo (struct path * pp, struct config *conf, int mask)
+scsi_ioctl_pathinfo (struct path * pp, int mask)
 {
 	struct udev_device *parent;
 	const char *attr_path = NULL;
@@ -2050,7 +2050,7 @@ int pathinfo(struct path *pp, struct config *conf, int mask)
 		get_geometry(pp);
 
 	if (path_state == PATH_UP && pp->bus == SYSFS_BUS_SCSI)
-		scsi_ioctl_pathinfo(pp, conf, mask);
+		scsi_ioctl_pathinfo(pp, mask);
 
 	if (pp->bus == SYSFS_BUS_CCISS && mask & DI_SERIAL)
 		cciss_ioctl_pathinfo(pp);
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
