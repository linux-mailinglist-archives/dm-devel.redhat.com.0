Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 29918D52F3
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:48:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1CB80793C9;
	Sat, 12 Oct 2019 21:48:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E861426170;
	Sat, 12 Oct 2019 21:48:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88F361808878;
	Sat, 12 Oct 2019 21:48:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLWUfh007273 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:32:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E68815D6A3; Sat, 12 Oct 2019 21:32:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95B855D717;
	Sat, 12 Oct 2019 21:32:28 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D816430BBE82;
	Sat, 12 Oct 2019 21:32:26 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:31:33 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:58 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.10) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=fNfCsloW2R9p5oduOTm6efQYYIMDgce5d4cb5Fs0RJkPBmTUZHTlhYIgg4sfzsKj6dLTYNT3X11Jxl1yU6T9Kl5zHGMi8nJD/u/KmxfPMyDe0DwfNyEUkA84i0ht9fJ1hWjq8xAhn/LTxoch/yt5gDkpiU9a0Xm2Yd++4Xsvs7FBkjEI44dATn/RiakXr0e2RUYeB6PDdRaFdBNJJdXvTJa4j+r20dtzS2e8qaMC3sBXTGbLVehTxMb/DWpdAfLwqL8V1lRLc8rpVHwt3niwkwytDyuowIQ0zOy9RAm/byFvdpZKxpRLghcD+pJ3IcOaZLsbffkFv7290Is8TuETzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=z0ZExMvOBKvaFCx+vCS8jTbzNOXoXvu4R72k6qca0gE=;
	b=bLdrlb/hWGxzC82YT3TjXcRLRluXf8lOP8sXKnb6HG7iyRuUjrCGw82uZNKzRzOXuTdYvCX03tZLUqlAtDc5ISkVDu+pEM+63auORlV5hWFzUOaoPhpHXh4qnU902mhexjQ3gx5qibOfS++OcVRmphfG0Qcrg3zpEoowbwjs7wjmVLJHFyX9OKGioZPkb6QxYGn1nggGIl4vA26864U8PrnurTbjXmXV8TdhR0h0+42vIahI/K60x7pGxS8cwpCU6XWj2gQWA1BqD8B29j5CIhdiWWc0HcVEtMFSejFJ563QwgEkDAmnIHB25ljZb1iuOstc5EYb/Ojz9Eo3dLXG/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:54 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:54 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 47/72] libmultipath: parse_vpd_pg83(): fix -Wsign-compare
	warnings
Thread-Index: AQHVgUQBqURMKB2oBEK9l3RRYGpZtA==
Date: Sat, 12 Oct 2019 21:28:35 +0000
Message-ID: <20191012212703.12989-48-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 9f7d4181-df7b-4c12-4143-08d74f5b23b2
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB33176367E4A6C08BA0024B95FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:489;
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
x-microsoft-antispam-message-info: QDkIOKCiF8jVw3nF+d/oTmczWziBUMlJpHLLHfUJW1uYHqtCY4IsMFwGM16QcR5YFtPvLVBhDGvps7Hs76NSMUnRM3WKzPi4avRycg4oOGwUnZ/mn7pQQNXTUP2kqWna0teKUMFCkoa/wFWtn2MMNfN4sdy9esA3vrmoePIu4AajSpskWkIpZnBq/q/CHlWh6eFz23L/B1xLkH7wae8elI2YkNH3+pfOuw14pbnWjA02BPW0XySlCMGBu7Pm6gzm2Wn9wJbUjOeVrY+7RczwuPmzCoDZL4jWqTn4Vw/0/vE7RKQ40d1/pUhwg59+4J/6f0iw9aRADEWd8ex+EQa+lWkIQNjdLIxGxs3qudYAXkB0A48zlhhobKA/lwjCnWJ+BT85bPjFNXoaB7oNEWf5IaeLE1z/3DwgvCG5DMej7P4=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f7d4181-df7b-4c12-4143-08d74f5b23b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:35.7146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xx3hHeVh93YEFXv4DJ0VRezCnnwJdO+aVf8hpuR67WEUE0Ict/ThD0Phea7Egn2AGjwQ0Tx8L+YNX7RuZeA8TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Sat, 12 Oct 2019 21:32:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Sat, 12 Oct 2019 21:32:27 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLWUfh007273
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 47/72] libmultipath: parse_vpd_pg83(): fix
 -Wsign-compare warnings
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Sat, 12 Oct 2019 21:48:43 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Most of this is trivial. Changes are: return early if there
is obviously not enough space. Check vpd_len for designator
type 8.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/discovery.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 0d0a6bc1..6288c3e0 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -978,7 +978,8 @@ parse_vpd_pg83(const unsigned char *in, size_t in_len,
 {
 	const unsigned char *d;
 	const unsigned char *vpd = NULL;
-	int len = -ENODATA, vpd_type, vpd_len, prio = -1, i, naa_prio;
+	size_t len, vpd_len, i;
+	int vpd_type, prio = -1, naa_prio;
 
 	d = in + 4;
 	while (d < in + in_len) {
@@ -1048,17 +1049,20 @@ parse_vpd_pg83(const unsigned char *in, size_t in_len,
 
 	if (prio <= 0)
 		return -ENODATA;
+	/* Need space at least for one digit */
+	else if (out_len <= 1)
+		return 0;
 
+	len = 0;
 	vpd_type = vpd[1] & 0xf;
 	vpd_len = vpd[3];
 	vpd += 4;
 	if (vpd_type == 0x2 || vpd_type == 0x3) {
-		int i;
+		size_t i;
 
-		assert(out_len >= 2);
 		len = sprintf(out, "%d", vpd_type);
 		if (2 * vpd_len >= out_len - len) {
-			condlog(1, "%s: WWID overflow, type %d, %d/%lu bytes required",
+			condlog(1, "%s: WWID overflow, type %d, %lu/%lu bytes required",
 				__func__, vpd_type,
 				2 * vpd_len + len + 1, out_len);
 			vpd_len = (out_len - len - 1) / 2;
@@ -1066,6 +1070,10 @@ parse_vpd_pg83(const unsigned char *in, size_t in_len,
 		for (i = 0; i < vpd_len; i++)
 			len += sprintf(out + len,
 				       "%02x", vpd[i]);
+	} else if (vpd_type == 0x8 && vpd_len < 4) {
+		condlog(1, "%s: VPD length %lu too small for designator type 8",
+			__func__, vpd_len);
+		return -EINVAL;
 	} else if (vpd_type == 0x8) {
 		if (!memcmp("eui.", vpd, 4))
 			out[0] =  '2';
@@ -1079,7 +1087,7 @@ parse_vpd_pg83(const unsigned char *in, size_t in_len,
 		while (len > 2 && vpd[len - 2] == '\0')
 			--len;
 		if (len > out_len - 1) {
-			condlog(1, "%s: WWID overflow, type 8/%c, %d/%lu bytes required",
+			condlog(1, "%s: WWID overflow, type 8/%c, %lu/%lu bytes required",
 				__func__, out[0], len + 1, out_len);
 			len = out_len - 1;
 		}
@@ -1096,15 +1104,14 @@ parse_vpd_pg83(const unsigned char *in, size_t in_len,
 
 	} else if (vpd_type == 0x1) {
 		const unsigned char *p;
-		int p_len;
+		size_t p_len;
 
 		out[0] = '1';
 		len = 1;
-		p = vpd;
 		while ((p = memchr(vpd, ' ', vpd_len))) {
 			p_len = p - vpd;
 			if (len + p_len > out_len - 1) {
-				condlog(1, "%s: WWID overflow, type 1, %d/%lu bytes required",
+				condlog(1, "%s: WWID overflow, type 1, %lu/%lu bytes required",
 					__func__, len + p_len, out_len);
 				p_len = out_len - len - 1;
 			}
@@ -1130,7 +1137,7 @@ parse_vpd_pg83(const unsigned char *in, size_t in_len,
 		p_len = vpd_len;
 		if (p_len > 0 && len < out_len - 1) {
 			if (len + p_len > out_len - 1) {
-				condlog(1, "%s: WWID overflow, type 1, %d/%lu bytes required",
+				condlog(1, "%s: WWID overflow, type 1, %lu/%lu bytes required",
 					__func__, len + p_len + 1, out_len);
 				p_len = out_len - len - 1;
 			}
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
