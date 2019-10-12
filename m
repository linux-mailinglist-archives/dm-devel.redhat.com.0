Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 240A1D52C0
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:32:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6882218C428E;
	Sat, 12 Oct 2019 21:32:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D05F5C226;
	Sat, 12 Oct 2019 21:32:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D8032180B76F;
	Sat, 12 Oct 2019 21:32:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLTfH1006395 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:29:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B5B411001B07; Sat, 12 Oct 2019 21:29:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A96810013D9;
	Sat, 12 Oct 2019 21:29:39 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CFFC8C01DDF8;
	Sat, 12 Oct 2019 21:29:37 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:28:59 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:51 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.10) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=UvkUonlpFLrPe+1syZNLdtvpTQR2lQ0ZV08dmVe034Tg2i+nJ4HbDfqU6UWs0M8grmp7e5am1HMyVY/t/fbI4VDxiS+6Y7ZngPPOIVB/j+G7HLIosPsT5ojizY99ATvKC1MdMeEsNEMYKT86PP7stdQUjVONHu+s/UhZE7WIDogvfM8PYqnZ43/JiCtV9sBcib09j5ndHzpOoxvP7F6NB1fDXLu4+L4+j/Uhtj3VVlKUcVDE7LoUTDlLhDn3mpoJ4lLzbuXrxyDm8JNzMi5m6MwXLabfxjA+iw7MP6GiQK2gTcQZsjnpOc/k6Gvm5u4SuIPwFlrvR9XfY3837UtosQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=7tW6SP2diNiiGz9C/ZEom0cfzLgKdk4gf6xY88JUY00=;
	b=BqnNkCd0l/HeY03ojdl/bKTtxXoLcY12RZKNrAsT8WnIQhesNyr5q5dr3RwggwRXtDTXZ/LAEio9NzQbZkRwdzJ3n80xmyFV0IplCzObAW9uAJWobfORkLnGq9VK3VoQXQddVgBI8+0DS1DK2DNF9wVKVzJg57tLAQGKrcwrFJa+yysuAv+Wvz5hzA2G6K/qascYHOvaa6XfMX0gA/FsG1sV+jZt+UKemYJUOa8/qG6VV/VLIBRzCj7qshRsfFRpxfz9kdaUHBH8ZxvyLBVaOAf7rbguwOSB8jTdkif27yfRo4zkYHxqpXsy+TrMuGpOtPjf6H1q+wULEymwBMA7ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:46 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:46 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 32/72] kpartx: mark unused arguments in ptreader methods
Thread-Index: AQHVgUP2WAasUL8yGUqSIiVCvR+sEA==
Date: Sat, 12 Oct 2019 21:28:17 +0000
Message-ID: <20191012212703.12989-33-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: e8cda4a0-c39b-40c6-5f37-08d74f5b18b3
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331787E448695594FBB2517EFC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:243;
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
x-microsoft-antispam-message-info: s6IF3MOaC74YPHUAiyJzOkmRjpm2ilfRhjabGUyye2hpTDo3Z4+85sMxl93uFOL+R8arE9BnR7y25YIDAd2nu95NorPCA9gooxpzicfPBbA3HVa/sGqy9GS4raBlJzlrmQny9NvrIpghUepTxH9OQyM/DtOqsRXD/esch1Z+hdvu08Cp3GUFduthNoyq8VRJBOBZKxoUzNG7FaWpTp/eaZPadgcCOyC25fCfqGbq9AZSS2d9MN8wv6HelVObCO6uGjcSds0gaq9KrLdnOL3hgxMkbOFL83cFdXa4Dy8Srot+pkCiJO0um9rK79eirgY3jjm31vNsXcP/Yme7txsUW1O5AfqBfMi8e73Ze3DNV66ojvdhWzifiMCbS7e0lvaYqeP6YrUwjBqtQ96EWb1q79G5VDxiJRYDmTvlw27kwco=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e8cda4a0-c39b-40c6-5f37-08d74f5b18b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:17.2760 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R1Gv81A92v5zSncynCRzXBmmrIHtlJQU385BOdLuY41tk17L6GU3u0Uu2Pt9E3LGQKEyJJhTgh4Ge6WtUX2zwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Sat, 12 Oct 2019 21:29:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Sat, 12 Oct 2019 21:29:38 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLTfH1006395
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 32/72] kpartx: mark unused arguments in ptreader
	methods
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]); Sat, 12 Oct 2019 21:32:49 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 kpartx/dasd.c | 3 ++-
 kpartx/gpt.c  | 3 ++-
 kpartx/mac.c  | 3 ++-
 kpartx/ps3.c  | 3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/kpartx/dasd.c b/kpartx/dasd.c
index 4e7e4743..4f3f744e 100644
--- a/kpartx/dasd.c
+++ b/kpartx/dasd.c
@@ -65,7 +65,8 @@ typedef unsigned int __attribute__((__may_alias__)) label_ints_t;
 /*
  */
 int
-read_dasd_pt(int fd, struct slice all, struct slice *sp, int ns)
+read_dasd_pt(int fd, __attribute__((unused)) struct slice all,
+	     struct slice *sp, __attribute__((unused)) int ns)
 {
 	int retval = -1;
 	int blocksize;
diff --git a/kpartx/gpt.c b/kpartx/gpt.c
index f3216ba2..4f88d486 100644
--- a/kpartx/gpt.c
+++ b/kpartx/gpt.c
@@ -601,7 +601,8 @@ fail:
  *
  */
 int
-read_gpt_pt (int fd, struct slice all, struct slice *sp, int ns)
+read_gpt_pt (int fd, __attribute__((unused)) struct slice all,
+	     struct slice *sp, int ns)
 {
 	gpt_header *gpt = NULL;
 	gpt_entry *ptes = NULL;
diff --git a/kpartx/mac.c b/kpartx/mac.c
index 6e82c95e..6aeac4e9 100644
--- a/kpartx/mac.c
+++ b/kpartx/mac.c
@@ -5,7 +5,8 @@
 #include "mac.h"
 
 int
-read_mac_pt(int fd, struct slice all, struct slice *sp, int ns) {
+read_mac_pt(int fd, __attribute__((unused)) struct slice all,
+	    struct slice *sp, int ns) {
 	struct mac_driver_desc *md;
 	struct mac_partition *part;
 	unsigned secsize;
diff --git a/kpartx/ps3.c b/kpartx/ps3.c
index 84550978..2cf4ffa2 100644
--- a/kpartx/ps3.c
+++ b/kpartx/ps3.c
@@ -48,7 +48,8 @@ read_disklabel(int fd, struct disklabel *label) {
 }
 
 int
-read_ps3_pt(int fd, struct slice all, struct slice *sp, int ns) {
+read_ps3_pt(int fd, __attribute__((unused)) struct slice all,
+	    struct slice *sp, __attribute__((unused)) int ns) {
 	struct disklabel label;
 	int n = 0;
 	int i;
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
