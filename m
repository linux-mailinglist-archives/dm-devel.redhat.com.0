Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 497B7D52EF
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:47:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 94473A3CD7F;
	Sat, 12 Oct 2019 21:47:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 600FC60BF4;
	Sat, 12 Oct 2019 21:47:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D3DC11803518;
	Sat, 12 Oct 2019 21:47:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLWOjV007250 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:32:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7EB195C22F; Sat, 12 Oct 2019 21:32:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74F225C223;
	Sat, 12 Oct 2019 21:32:24 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E2C162D6A04;
	Sat, 12 Oct 2019 21:32:22 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:31:29 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:58 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.10) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=CTM5EiE8FOv/PO12XUv8kzejMh9edmGciDcDwUKWxzDMMWcOBXMuIqQuSbA2MD+W7AMm0VPOR8Sot+77jIUrjbbQGtWPNIuRtlAd5kH3ckhIx2lD6GWr1SkRGpn9jQbSxS2U02+5NKzL2B202xeJrfai681+Oh5jx6aRucXU+5X+lH9OYiuLT9z1G8Hgc1lIIx21sTWYPS4FJweIJPrXMGVl0inyrNy7SCdFPn+Zotg2kkRvQzaJw/HcSj9wD6D8/ryroYfUHPZzYZWr9Ltrqi1gQo/xqxOFoKXRWuWc8mhcXuDUZzTZAy2iuxTMQ/L5liEGsDTvz1HP4OoJitQmkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=bHd7J6xzuB0P71tdUhNtYRsZjljEW+IQk4tWB8fkEeA=;
	b=CXJpxRM7HOm/9LHl1pjl3RXbhoQPDeqW1Wqya2cx1XYUJJRSXw9PGxUZ0Y3Y/QD5C18WRT8ezUXnFxNfel3lH3QowjJtrsjGCl1Djch8mntu9gNRImDU4b1p+TgRGbHzaGKktM+yVz6agkkx/Zwj9eqLj8aon/OgCx5xUqySD2cweN+twb/uWxMxIaD4nnRguGfjL0oxMzuz+ZG0HzERiANdAcrqQvR3CtD07wcRAIETY+YbJ0pMWxKCTfget68H/wpOLe4tDjLpkP+KFDJ/0yv4tpfTpNac9uYJf9JUUH8n2Pgwgi8P/7AZx183bdrKlc2qLLXIP4dKNzzZ7CSbgQ==
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
	Sat, 12 Oct 2019 21:28:53 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 46/72] libmultipath: parse_vpd_pg83(): sanitize
	indentation
Thread-Index: AQHVgUQAxPZc0uR+c0GlMfrF+vmCbg==
Date: Sat, 12 Oct 2019 21:28:34 +0000
Message-ID: <20191012212703.12989-47-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 6226555e-c4d9-4df9-8e1d-08d74f5b2304
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331796D010FACA14CE8F22BDFC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:595;
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
x-microsoft-antispam-message-info: 97wSCNsVg0YbrYhMNjMyAh14jHXR2xr4j3kv8bQy79eKx9Jj1S738zQ0rDDFyrrDCgz57mgiEb/0h9J1E3nxf8OBbrW+7hc/+scfmAiolN24F+/UTUlIB4SqASpWMO33uNOZJK1C5ucd65NCax5MA97uojljtp9JmYVuM4EInJkM3GdBa7ECTLYDp6UUId2mvk1HReKqPiC3YM63WxQjF4XIrCsyUiWBbSXM/XwHVKt0DtADLtOn/nKbInN1W1U3bpOXd8IhjVp/DPrHFM/zj0+RMFNHZ46febepAvjgOPOiyQZHHLoJX5b7Yfg5jPKcP77gYGCDZIBGiEXwpV1+zXLR8loN3F6R7gt7nzALHk+1YnK4T9KD3rRbVxSblmnMptVaPjsmpDyi46faFtXmY1VYzyYXnziZ39NMXigWKWc=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6226555e-c4d9-4df9-8e1d-08d74f5b2304
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:34.5713 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BfPdB/1r30R9Nt0gQJZZ1jK7mPrrhFe7KCQ6W6F7pCIIGFBN7MNsw1AJQbDJem0NG+hf1t0PsW4yVFVs692IcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.29]); Sat, 12 Oct 2019 21:32:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Sat, 12 Oct 2019 21:32:23 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLWOjV007250
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 46/72] libmultipath: parse_vpd_pg83(): sanitize
	indentation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]); Sat, 12 Oct 2019 21:47:51 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

This just moves a lot of code to the left. No functional change.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/discovery.c | 174 ++++++++++++++++++++-------------------
 1 file changed, 88 insertions(+), 86 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index c6c57430..0d0a6bc1 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1045,100 +1045,102 @@ parse_vpd_pg83(const unsigned char *in, size_t in_len,
 		}
 		d += d[3] + 4;
 	}
-	if (prio > 0) {
-		vpd_type = vpd[1] & 0xf;
-		vpd_len = vpd[3];
+
+	if (prio <= 0)
+		return -ENODATA;
+
+	vpd_type = vpd[1] & 0xf;
+	vpd_len = vpd[3];
+	vpd += 4;
+	if (vpd_type == 0x2 || vpd_type == 0x3) {
+		int i;
+
+		assert(out_len >= 2);
+		len = sprintf(out, "%d", vpd_type);
+		if (2 * vpd_len >= out_len - len) {
+			condlog(1, "%s: WWID overflow, type %d, %d/%lu bytes required",
+				__func__, vpd_type,
+				2 * vpd_len + len + 1, out_len);
+			vpd_len = (out_len - len - 1) / 2;
+		}
+		for (i = 0; i < vpd_len; i++)
+			len += sprintf(out + len,
+				       "%02x", vpd[i]);
+	} else if (vpd_type == 0x8) {
+		if (!memcmp("eui.", vpd, 4))
+			out[0] =  '2';
+		else if (!memcmp("naa.", vpd, 4))
+			out[0] = '3';
+		else
+			out[0] = '8';
+
 		vpd += 4;
-		if (vpd_type == 0x2 || vpd_type == 0x3) {
-			int i;
-
-			assert(out_len >= 2);
-			len = sprintf(out, "%d", vpd_type);
-			if (2 * vpd_len >= out_len - len) {
-				condlog(1, "%s: WWID overflow, type %d, %d/%lu bytes required",
-					__func__, vpd_type,
-					2 * vpd_len + len + 1, out_len);
-				vpd_len = (out_len - len - 1) / 2;
-			}
-			for (i = 0; i < vpd_len; i++)
-				len += sprintf(out + len,
-					       "%02x", vpd[i]);
-		} else if (vpd_type == 0x8) {
-			if (!memcmp("eui.", vpd, 4))
-				out[0] =  '2';
-			else if (!memcmp("naa.", vpd, 4))
-				out[0] = '3';
-			else
-				out[0] = '8';
-
-			vpd += 4;
-			len = vpd_len - 4;
-			while (len > 2 && vpd[len - 2] == '\0')
-				--len;
-			if (len > out_len - 1) {
-				condlog(1, "%s: WWID overflow, type 8/%c, %d/%lu bytes required",
-					__func__, out[0], len + 1, out_len);
-				len = out_len - 1;
-			}
+		len = vpd_len - 4;
+		while (len > 2 && vpd[len - 2] == '\0')
+			--len;
+		if (len > out_len - 1) {
+			condlog(1, "%s: WWID overflow, type 8/%c, %d/%lu bytes required",
+				__func__, out[0], len + 1, out_len);
+			len = out_len - 1;
+		}
 
-			if (out[0] == '8')
-				for (i = 0; i < len; ++i)
-					out[1 + i] = vpd[i];
-			else
-				for (i = 0; i < len; ++i)
-					out[1 + i] = tolower(vpd[i]);
+		if (out[0] == '8')
+			for (i = 0; i < len; ++i)
+				out[1 + i] = vpd[i];
+		else
+			for (i = 0; i < len; ++i)
+				out[1 + i] = tolower(vpd[i]);
 
-			/* designator should be 0-terminated, but let's make sure */
-			out[len] = '\0';
+		/* designator should be 0-terminated, but let's make sure */
+		out[len] = '\0';
 
-		} else if (vpd_type == 0x1) {
-			const unsigned char *p;
-			int p_len;
-
-			out[0] = '1';
-			len = 1;
-			p = vpd;
-			while ((p = memchr(vpd, ' ', vpd_len))) {
-				p_len = p - vpd;
-				if (len + p_len > out_len - 1) {
-					condlog(1, "%s: WWID overflow, type 1, %d/%lu bytes required",
-						__func__, len + p_len, out_len);
-					p_len = out_len - len - 1;
-				}
-				memcpy(out + len, vpd, p_len);
-				len += p_len;
-				if (len >= out_len - 1) {
-					out[len] = '\0';
-					break;
-				}
-				out[len] = '_';
-				len ++;
-				if (len >= out_len - 1) {
-					out[len] = '\0';
-					break;
-				}
-				vpd = p;
-				vpd_len -= p_len;
-				while (vpd && *vpd == ' ') {
-					vpd++;
-					vpd_len --;
-				}
+	} else if (vpd_type == 0x1) {
+		const unsigned char *p;
+		int p_len;
+
+		out[0] = '1';
+		len = 1;
+		p = vpd;
+		while ((p = memchr(vpd, ' ', vpd_len))) {
+			p_len = p - vpd;
+			if (len + p_len > out_len - 1) {
+				condlog(1, "%s: WWID overflow, type 1, %d/%lu bytes required",
+					__func__, len + p_len, out_len);
+				p_len = out_len - len - 1;
 			}
-			p_len = vpd_len;
-			if (p_len > 0 && len < out_len - 1) {
-				if (len + p_len > out_len - 1) {
-					condlog(1, "%s: WWID overflow, type 1, %d/%lu bytes required",
-						__func__, len + p_len + 1, out_len);
-					p_len = out_len - len - 1;
-				}
-				memcpy(out + len, vpd, p_len);
-				len += p_len;
+			memcpy(out + len, vpd, p_len);
+			len += p_len;
+			if (len >= out_len - 1) {
 				out[len] = '\0';
+				break;
 			}
-			if (len > 1 && out[len - 1] == '_') {
-				out[len - 1] = '\0';
-				len--;
+			out[len] = '_';
+			len ++;
+			if (len >= out_len - 1) {
+				out[len] = '\0';
+				break;
 			}
+			vpd = p;
+			vpd_len -= p_len;
+			while (vpd && *vpd == ' ') {
+				vpd++;
+				vpd_len --;
+			}
+		}
+		p_len = vpd_len;
+		if (p_len > 0 && len < out_len - 1) {
+			if (len + p_len > out_len - 1) {
+				condlog(1, "%s: WWID overflow, type 1, %d/%lu bytes required",
+					__func__, len + p_len + 1, out_len);
+				p_len = out_len - len - 1;
+			}
+			memcpy(out + len, vpd, p_len);
+			len += p_len;
+			out[len] = '\0';
+		}
+		if (len > 1 && out[len - 1] == '_') {
+			out[len - 1] = '\0';
+			len--;
 		}
 	}
 	return len;
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
