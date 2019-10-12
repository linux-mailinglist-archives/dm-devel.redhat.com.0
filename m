Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D55D52DC
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:37:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A185F2D6A23;
	Sat, 12 Oct 2019 21:37:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 421FD1C945;
	Sat, 12 Oct 2019 21:37:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC5114EE68;
	Sat, 12 Oct 2019 21:37:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLVhne007046 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:31:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A45D1608C2; Sat, 12 Oct 2019 21:31:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D799608A5;
	Sat, 12 Oct 2019 21:31:41 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA07A308FEC6;
	Sat, 12 Oct 2019 21:31:39 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:30:46 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:50 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.10) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=U7nvL4hioFmfQqS2kMDJ+mSK5xFlUP73s/EI/dKS2pzqYrvfpc2KAKcLiFkZ/fbW9vNQZw7lF1MhSg9kC7feNK38B6ubP1PcvvdZV3ZVc3bu4iRtm32deS7xuZu6rBfe4keqbqq8bSAT/HiW1NnmVZu1h+dOoAa+2tg0EUBTJk0SRCI4pQiJZUYojOc+CiUUngMw2a/PK50RiekXw/DXlKAk38q4Cs2pvSiZhoFe+cRZVR4kJfLRTL+zzIKsFGLX2C9wUzPT0RCt3kLvS20jTEYleCBsRMNRspVy5R32FXF2clRp8Rsx5rVhLnFiFJUMFw3KMjOhodPUUCeoAshS6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6gYkjmtgnJBzV6dWwQJdgxftjDXPy4zoEoRKaCf1oSg=;
	b=kEo4OvMo1meITdWtnNyMHtUfXecnyaw1772lXvMDHP60iYa3bZ3v7no0DhlnfxOvI7mj5sZMZDWRWuU06CAq5RLnOn4KWNt0IQ4siD/dbkNQeAJI7j+004S3EvsTEBPdaWQOYpNFKvSKlm7DiwOVDZ944eKAp849z2WSEIASbCsGxNimzFEGC0tro1P1AukM7dgFkVbQhXNI99vLXD4OkOTlcTlyV+W0qcZNgR0fk7HQaBdqF8Dj0HRl8ULxJ2ofaiQKdNPm7o8OrxIbn37PIAivmvg4XP0ffiIJe95FL7weUa0P12mn6Wkx6nbSmhtYybgsQLwumAKwGEQI0u35OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:45 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:45 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 31/72] kpartx: gpt: remove unused arg in
	read_lastoddsector()
Thread-Index: AQHVgUP12j6IfLasDU+ADZgrDeNLEA==
Date: Sat, 12 Oct 2019 21:28:16 +0000
Message-ID: <20191012212703.12989-32-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 999f35ca-bfe6-4df5-c77c-08d74f5b17f0
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB33171C6B75EC6EF6AFAD4376FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:626;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(6666004)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(4744005)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1IM68Lb8wGQhzJaoKOLJluhSzfDMfZDqJCXCqmfpjp8rUJBE9t72idWOwpgl2dNLf5PkIXY2lKpDVxFmjWL8maa1kZZyQ58zEAdrMgM4tHaa9odluDC77y7WkMVgGN5+pll/D04b7TujWDplxdkJpGID60ko0TYHpPfBopfpPsm3mZ34munyz9D+XFo0cmnWYuYIkhsDOCbJD/v1vu9fRX45//FbSoBhTLMGaLYEe4x1nddOlAiUG9MqBseBModOxCMuO8ZkDAp+7l411DVwG7aNHKsLd9FOL8sfD+/xNHPGCcSAjhlX/IS+jEjtjVSmVjUM6fC+TLf4SBT2GHal/HGRNQhY7zFlemYbymlHzsjw5AfpcNl1/2qkyrmzXctytOBxyFyz3bCGS5skMkYbKEoS4HJ8nY+miXF1d2b9214=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 999f35ca-bfe6-4df5-c77c-08d74f5b17f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:16.1096 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OUM3GxkWJHQzca0K8Wg6EQPXno/PdF2MjE4PooFwaLjpMIubr+TQ1H/SInfmj3KwlxCwlgB8ovt62uqO3NpvVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Sat, 12 Oct 2019 21:31:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Sat, 12 Oct 2019 21:31:40 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLVhne007046
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 31/72] kpartx: gpt: remove unused arg in
	read_lastoddsector()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Sat, 12 Oct 2019 21:37:02 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 kpartx/gpt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kpartx/gpt.c b/kpartx/gpt.c
index e31611a3..f3216ba2 100644
--- a/kpartx/gpt.c
+++ b/kpartx/gpt.c
@@ -182,7 +182,7 @@ last_lba(int filedes)
 
 
 static ssize_t
-read_lastoddsector(int fd, uint64_t lba, void *buffer, size_t count)
+read_lastoddsector(int fd, void *buffer, size_t count)
 {
 	int rc;
 	struct blkdev_ioctl_param ioctl_param;
@@ -221,7 +221,7 @@ read_lba(int fd, uint64_t lba, void *buffer, size_t bytes)
 	   one sector, so we don't have to be fancy.
 	*/
 	if (!bytesread && !(lastlba & 1) && lba == lastlba) {
-		bytesread = read_lastoddsector(fd, lba, buffer, bytes);
+		bytesread = read_lastoddsector(fd, buffer, bytes);
 	}
 	return bytesread;
 }
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
