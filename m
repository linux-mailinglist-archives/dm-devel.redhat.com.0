Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1361ED52BF
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:32:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6666CC058CA4;
	Sat, 12 Oct 2019 21:32:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F8D45C549;
	Sat, 12 Oct 2019 21:32:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D00694EE6D;
	Sat, 12 Oct 2019 21:32:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLTKKb006324 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:29:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C3009F6E1; Sat, 12 Oct 2019 21:29:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx26.extmail.prod.ext.phx2.redhat.com
	[10.5.110.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28D4219C6A;
	Sat, 12 Oct 2019 21:29:18 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 999ED801664;
	Sat, 12 Oct 2019 21:29:16 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:28:23 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:29:01 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.10) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:29:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=DY9h7AePmKd9OMogUAwFIXnFYLlmUdt3yeNf1miSfJqOYI+FYKuPKQWA96LCShSDV9oo6ZxIWGCqNI3taksrE42M6AVp+zM+hVuPETAtEYARYUUQ6jQMh5al5NpDF/dddl0YE1aXvz9hxxd2XpOdYmP7gMIchmyudPEnTYD5cSCo+tjapofrdWuIcKYQ9GXEeUyk69t6yZUDQ1VfgeBYjEwsrf2Bt8qaypxTqtGacdSZUdOi6VV/w1TlJNFqrWHLvnR27lmjh2BHn2VUSNt3N3Dwje+XUd8LajbDAq5AyE6zB8DRtMedd76iptdpYYPRS+CoAXp8H9a0kAvDo/TiXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=DakRZyd6CaXJNuT8mROKwoFFQUX/MfTnUHUpuLFwo7g=;
	b=AlXSB+xSDAhPvLLJ9IUIKtAs9Y+/6qYGCMze9lcDchX5nQllbCKDRM86HWxgdEmrY/CSu0z03a6fwk1viTsHk3JkNetnshV7MosiX5tbSZ8oMVHT1AMhNKP+5W98erhcWW5AiEbFFDXYS0y+MPfLYJL/iNY+xq1e8gTkb9YN/xPBFPM77WAKs8IaZX3sqBg5lRyvYAz5Y8dcR0CURj6YOPbCyPZkbAeIgfxWsfIvoXx/OAdoTLP1KRJsEBBgoHOmuKP+UxS8PicIzwbd0PSCw+5S7RymLwRx7rAJeHzfssPEskiyok8com+JXKkDmTnTY5CeBhL0LuBguXWgXtVG9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:58 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:58 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 57/72] kpartx: use unsigned int for "ns" argument of
	ptreader
Thread-Index: AQHVgUQITGba1A5U6ESrGfy9qCGHlA==
Date: Sat, 12 Oct 2019 21:28:48 +0000
Message-ID: <20191012212703.12989-58-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 609ac169-bd34-4945-307c-08d74f5b2aeb
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB33175173FB12196FBCD7BCF1FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:62;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(6666004)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(14444005)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cURX1bcsG+WnAZmRLwRMcsJFT4YzobM2uq+sQ16Bif7SBfjxHoWS1gmjJPvtd5q1k5SRFCI/96OP0BnhKphwTZbdtK628Ohj1LeJm6aEBbM74jZQSDItn2dMRZn2+Phrcb7QdMjWFNi5Tg5KZJwmO/GuvJ2ncBbLz/FM7dhJN/QsY7Ug/Y2Ds6BCzlvqRQdw1zLfJIj3MiV+UJLhtK0zfJwr8g/xTAXICrmH5DqD0/hqei03e7xLfvtdVVQ8LcN9t7XdUDGToBoXYt3eE+RtoRMmSq0oAtS+wzCporMhRXqqDNzONuYI2qA3OTXpYOkrx7HthA3f3Un7rXVIUPvrJDUi9xkmLC1RZj7qirXswEf8TnUbZk78W+bzn0UYBYmMdHqhJwUU1ixv46qxbUgpdmBvUyl+xHkl9QVvFBbJeMU=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 609ac169-bd34-4945-307c-08d74f5b2aeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:48.3695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UkN3bfTUThRA2mQ5LXE8akcv5QNOkuX6FDj6XG1IRXU1737I2XTsljiV9T5oQsbTH5RTFQ752gnEr82EIECMPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.67]); Sat, 12 Oct 2019 21:29:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]);
	Sat, 12 Oct 2019 21:29:17 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.67
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLTKKb006324
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 57/72] kpartx: use unsigned int for "ns" argument
	of ptreader
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Sat, 12 Oct 2019 21:32:49 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

ns, the number of slices, should be positive.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 kpartx/bsd.c      | 4 ++--
 kpartx/dasd.c     | 2 +-
 kpartx/dos.c      | 4 ++--
 kpartx/gpt.c      | 4 ++--
 kpartx/gpt.h      | 2 +-
 kpartx/kpartx.h   | 4 ++--
 kpartx/mac.c      | 4 ++--
 kpartx/ps3.c      | 4 ++--
 kpartx/solaris.c  | 4 ++--
 kpartx/sun.c      | 4 ++--
 kpartx/unixware.c | 4 ++--
 11 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/kpartx/bsd.c b/kpartx/bsd.c
index f87175e2..0e661fbc 100644
--- a/kpartx/bsd.c
+++ b/kpartx/bsd.c
@@ -47,13 +47,13 @@ struct bsd_disklabel {
 };
 
 int
-read_bsd_pt(int fd, struct slice all, struct slice *sp, int ns) {
+read_bsd_pt(int fd, struct slice all, struct slice *sp, unsigned int ns) {
 	struct bsd_disklabel *l;
 	struct bsd_partition *p;
 	unsigned int offset = all.start, end;
 	int max_partitions;
 	char *bp;
-	int n = 0, i, j;
+	unsigned int n = 0, i, j;
 
 	bp = getblock(fd, offset+1);    /* 1 sector suffices */
 	if (bp == NULL)
diff --git a/kpartx/dasd.c b/kpartx/dasd.c
index 4f3f744e..1486ccaa 100644
--- a/kpartx/dasd.c
+++ b/kpartx/dasd.c
@@ -66,7 +66,7 @@ typedef unsigned int __attribute__((__may_alias__)) label_ints_t;
  */
 int
 read_dasd_pt(int fd, __attribute__((unused)) struct slice all,
-	     struct slice *sp, __attribute__((unused)) int ns)
+	     struct slice *sp, __attribute__((unused)) unsigned int ns)
 {
 	int retval = -1;
 	int blocksize;
diff --git a/kpartx/dos.c b/kpartx/dos.c
index 4985152c..0c706690 100644
--- a/kpartx/dos.c
+++ b/kpartx/dos.c
@@ -74,10 +74,10 @@ is_gpt(int type) {
 }
 
 int
-read_dos_pt(int fd, struct slice all, struct slice *sp, int ns) {
+read_dos_pt(int fd, struct slice all, struct slice *sp, unsigned int ns) {
 	struct partition p;
 	unsigned long offset = all.start;
-	int i, n=4;
+	unsigned int i, n=4;
 	unsigned char *bp;
 	uint64_t  sector_size_mul = get_sector_size(fd)/512;
 
diff --git a/kpartx/gpt.c b/kpartx/gpt.c
index aa2a440c..785b34ea 100644
--- a/kpartx/gpt.c
+++ b/kpartx/gpt.c
@@ -602,11 +602,11 @@ fail:
  */
 int
 read_gpt_pt (int fd, __attribute__((unused)) struct slice all,
-	     struct slice *sp, int ns)
+	     struct slice *sp, unsigned int ns)
 {
 	gpt_header *gpt = NULL;
 	gpt_entry *ptes = NULL;
-	uint32_t i;
+	unsigned int i;
 	int n = 0;
 	int last_used_index=-1;
 	int sector_size_mul = get_sector_size(fd)/512;
diff --git a/kpartx/gpt.h b/kpartx/gpt.h
index 7bb54b74..4e1b49aa 100644
--- a/kpartx/gpt.h
+++ b/kpartx/gpt.h
@@ -105,7 +105,7 @@ typedef struct _legacy_mbr {
 #define EFI_GPT_PRIMARY_PARTITION_TABLE_LBA 1
 
 /* Functions */
-int read_gpt_pt (int fd, struct slice all, struct slice *sp, int ns);
+int read_gpt_pt (int fd, struct slice all, struct slice *sp, unsigned int ns);
 
 
 #endif
diff --git a/kpartx/kpartx.h b/kpartx/kpartx.h
index 015dcab4..dfc66c5d 100644
--- a/kpartx/kpartx.h
+++ b/kpartx/kpartx.h
@@ -38,7 +38,7 @@ struct slice {
 };
 
 typedef int (ptreader)(int fd, struct slice all, struct slice *sp,
-		       int ns);
+		       unsigned int ns);
 
 extern int force_gpt;
 
@@ -54,7 +54,7 @@ extern ptreader read_ps3_pt;
 
 char *getblock(int fd, unsigned int secnr);
 
-static inline int
+static inline unsigned int
 four2int(unsigned char *p) {
 	return p[0] + (p[1]<<8) + (p[2]<<16) + (p[3]<<24);
 }
diff --git a/kpartx/mac.c b/kpartx/mac.c
index 6aeac4e9..c21ac702 100644
--- a/kpartx/mac.c
+++ b/kpartx/mac.c
@@ -6,12 +6,12 @@
 
 int
 read_mac_pt(int fd, __attribute__((unused)) struct slice all,
-	    struct slice *sp, int ns) {
+	    struct slice *sp, unsigned int ns) {
 	struct mac_driver_desc *md;
 	struct mac_partition *part;
 	unsigned secsize;
 	char *data;
-	int blk, blocks_in_map;
+	unsigned int blk, blocks_in_map;
 	int n = 0;
 
 	md = (struct mac_driver_desc *) getblock(fd, 0);
diff --git a/kpartx/ps3.c b/kpartx/ps3.c
index 2cf4ffa2..42551bcc 100644
--- a/kpartx/ps3.c
+++ b/kpartx/ps3.c
@@ -34,7 +34,7 @@ struct disklabel {
 static int
 read_disklabel(int fd, struct disklabel *label) {
 	unsigned char *data;
-	int i;
+	unsigned int i;
 
 	for (i = 0; i < sizeof(struct disklabel) / SECTOR_SIZE; i++) {
 		data = (unsigned char *) getblock(fd, i);
@@ -49,7 +49,7 @@ read_disklabel(int fd, struct disklabel *label) {
 
 int
 read_ps3_pt(int fd, __attribute__((unused)) struct slice all,
-	    struct slice *sp, __attribute__((unused)) int ns) {
+	    struct slice *sp, __attribute__((unused)) unsigned int ns) {
 	struct disklabel label;
 	int n = 0;
 	int i;
diff --git a/kpartx/solaris.c b/kpartx/solaris.c
index e7826c62..c2480b50 100644
--- a/kpartx/solaris.c
+++ b/kpartx/solaris.c
@@ -28,11 +28,11 @@ struct solaris_x86_vtoc {
 };
 
 int
-read_solaris_pt(int fd, struct slice all, struct slice *sp, int ns) {
+read_solaris_pt(int fd, struct slice all, struct slice *sp, unsigned int ns) {
 	struct solaris_x86_vtoc *v;
 	struct solaris_x86_slice *s;
 	unsigned int offset = all.start;
-	int i, n;
+	unsigned int i, n;
 	char *bp;
 
 	bp = getblock(fd, offset+1);	/* 1 sector suffices */
diff --git a/kpartx/sun.c b/kpartx/sun.c
index 276066d1..df630a7c 100644
--- a/kpartx/sun.c
+++ b/kpartx/sun.c
@@ -59,11 +59,11 @@ sun_verify_checksum (struct sun_disk_label *label)
 }
 
 int
-read_sun_pt(int fd, struct slice all, struct slice *sp, int ns) {
+read_sun_pt(int fd, struct slice all, struct slice *sp, unsigned int ns) {
 	struct sun_disk_label *l;
 	struct sun_raw_part *s;
 	unsigned int offset = all.start, end;
-	int i, j, n;
+	unsigned int i, j, n;
 	char *bp;
 
 	bp = getblock(fd, offset);
diff --git a/kpartx/unixware.c b/kpartx/unixware.c
index c7b9786e..2f663af0 100644
--- a/kpartx/unixware.c
+++ b/kpartx/unixware.c
@@ -48,12 +48,12 @@ struct unixware_disklabel {
 };  /* 408 */
 
 int
-read_unixware_pt(int fd, struct slice all, struct slice *sp, int ns) {
+read_unixware_pt(int fd, struct slice all, struct slice *sp, unsigned int ns) {
 	struct unixware_disklabel *l;
 	struct unixware_slice *p;
 	unsigned int offset = all.start;
 	char *bp;
-	int n = 0;
+	unsigned int n = 0;
 
 	bp = getblock(fd, offset+29);	/* 1 sector suffices */
 	if (bp == NULL)
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
