Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E7CD529B
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:29:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F1F69356CE;
	Sat, 12 Oct 2019 21:29:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A50CF1001DC2;
	Sat, 12 Oct 2019 21:29:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 221FA180B536;
	Sat, 12 Oct 2019 21:29:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLSSjH006021 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:28:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7F0BA10013D9; Sat, 12 Oct 2019 21:28:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09B721001B08;
	Sat, 12 Oct 2019 21:28:26 +0000 (UTC)
Received: from m4a0041g.houston.softwaregrp.com
	(m4a0041g.houston.softwaregrp.com [15.124.2.87])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 85038356CE;
	Sat, 12 Oct 2019 21:28:24 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0041g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:27:30 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:27:43 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.10) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:27:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=RNYzJfG4G4gccplsYuLeHydaerVrhm4iAYp+CRWnN/wACNWwn7bTuDfwx2KAYUxYMqHkd2oQhKNdt7UuoXNb7uHDjIuogXwfF38c4uGB7rIJgiLF0KL+fMdKWAZN2QIEymTWKHSKlHVIeFUSkGXRmu/dos7i6W7BNfnGFu9QtixHZ4Ky7Vw19gDciDyNijoP1cYCsZx4PIaDQi4xMZepvpB/jYYULOBCgA9WZyMOJYwEJ1S8rkw8xzGJBs7EWL8wfPzZWjYyBmZYIGctPbqYfD98uDboYooqMbpQG5oCG1pvXOlNQvjT1blMhOvQybv4QPtykpWmGXZwlITcVBe54w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=7dir853+WFg1lQchXQ9PpL/4e5n0BA4uCFd7G2LAiXY=;
	b=F8SjOSLumTuk7X3EuZiTifmURBtLhdI+IYVj8y+qwa7CTDHX4kSaNMmW5DjwvwMMp0hWmEKR8MTKM00NqpHnhCYwhvToKciLcu1A9jj//i/vamqb8Ns3jmfSUL5E4uYQ56TCAP5H4CBfheqFlj8gqYo2a/h4VsS5LqEDYomvLclv5duqgBdYsarXsceDlLzKHvyUqGKJIxlwj43no3D+ITdMkingJOv8IAvp3wVVi2NSNuJvh/K4vC+PmW5U/GxnFG4nvlsjS/nX26I4yHMkY0cTNrMWd0ueANLohD4hnRDHBvEHbLlakVNmcsbbyshDPhVi1if/6R/NGb6J8y0q9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:27:40 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:27:40 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 03/72] libmultipath: alias.c: constify function arguments
Thread-Index: AQHVgUPgW+Y5/BVJckmjeqKmCKgQpg==
Date: Sat, 12 Oct 2019 21:27:40 +0000
Message-ID: <20191012212703.12989-4-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: e5a07ea4-979a-4f7b-36fd-08d74f5b02ea
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331772D73DFB33F731358018FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:288;
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
x-microsoft-antispam-message-info: kvY9E2BVSTDwPhA5zubjVY/FlWY6qNCTolN3Ra5i50Clb1FvLM77f0Gxk2Fhs2hZLcNK4YT3lWJ83dfgJOLjwD7h220xu7Lp5oCVy3ru7ylaM/hha6GOjqSvWIk/4wiadh1eFSWzaAuqiPs06XAkBebI93c5+kh7dI6mqjAlkqq3kNJZrmpdPPTyaCYatnBDvl56kLgd3lu5MQlW5EDzJ/DXJy0hFjl6VVoWA2EJBAojlTR1ClSdaQI5XhxL7depH5TVP+dgVUT0udf5KD9jW4/R3Z4Es4KC9PvyBrAvcgFXENvLsmM9bYJIlJK/WTRqvdcTtKG4sLWVfVc3Xxke2EDy+bZOWDEy0eEbvZP+8bKygnbDos09khuA7cbPptI0mZ/eCp/MTt5INdXViI3jHL5UG+HFsJgf6pPaNEr6A70=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a07ea4-979a-4f7b-36fd-08d74f5b02ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:27:40.7555 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: huTWZQl6NALyB7yNyqgepQCCOjoWj+jqJlnWiH9Q5n1MbIclQJEcJWTD74m0F+nUxvlCOwUOpwzCVoqYagQgLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.30]); Sat, 12 Oct 2019 21:28:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Sat, 12 Oct 2019 21:28:25 +0000 (UTC) for IP:'15.124.2.87'
	DOMAIN:'m4a0041g.houston.softwaregrp.com'
	HELO:'m4a0041g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.87
	m4a0041g.houston.softwaregrp.com 15.124.2.87
	m4a0041g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLSSjH006021
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 03/72] libmultipath: alias.c: constify function
	arguments
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Sat, 12 Oct 2019 21:29:20 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/alias.c | 29 ++++++++++++++++-------------
 libmultipath/alias.h | 12 +++++++-----
 2 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/libmultipath/alias.c b/libmultipath/alias.c
index fd6b7f91..5b05ff69 100644
--- a/libmultipath/alias.c
+++ b/libmultipath/alias.c
@@ -37,7 +37,7 @@
  */
 
 int
-valid_alias(char *alias)
+valid_alias(const char *alias)
 {
 	if (strchr(alias, '/') != NULL)
 		return 0;
@@ -46,7 +46,7 @@ valid_alias(char *alias)
 
 
 static int
-format_devname(char *name, int id, int len, char *prefix)
+format_devname(char *name, int id, int len, const char *prefix)
 {
 	int pos;
 	int prefix_len = strlen(prefix);
@@ -66,9 +66,9 @@ format_devname(char *name, int id, int len, char *prefix)
 }
 
 static int
-scan_devname(char *alias, char *prefix)
+scan_devname(const char *alias, const char *prefix)
 {
-	char *c;
+	const char *c;
 	int i, n = 0;
 
 	if (!prefix || strncmp(alias, prefix, strlen(prefix)))
@@ -97,7 +97,8 @@ scan_devname(char *alias, char *prefix)
 }
 
 static int
-lookup_binding(FILE *f, char *map_wwid, char **map_alias, char *prefix)
+lookup_binding(FILE *f, const char *map_wwid, char **map_alias,
+	       const char *prefix)
 {
 	char buf[LINE_MAX];
 	unsigned int line_nr = 0;
@@ -109,7 +110,8 @@ lookup_binding(FILE *f, char *map_wwid, char **map_alias, char *prefix)
 
 	rewind(f);
 	while (fgets(buf, LINE_MAX, f)) {
-		char *c, *alias, *wwid;
+		const char *alias, *wwid;
+		char *c;
 		int curr_id;
 
 		line_nr++;
@@ -154,7 +156,7 @@ lookup_binding(FILE *f, char *map_wwid, char **map_alias, char *prefix)
 }
 
 static int
-rlookup_binding(FILE *f, char *buff, char *map_alias, char *prefix)
+rlookup_binding(FILE *f, char *buff, const char *map_alias, const char *prefix)
 {
 	char line[LINE_MAX];
 	unsigned int line_nr = 0;
@@ -162,7 +164,8 @@ rlookup_binding(FILE *f, char *buff, char *map_alias, char *prefix)
 	buff[0] = '\0';
 
 	while (fgets(line, LINE_MAX, f)) {
-		char *c, *alias, *wwid;
+		char *c;
+		const char *alias, *wwid;
 
 		line_nr++;
 		c = strpbrk(line, "#\n\r");
@@ -197,7 +200,7 @@ rlookup_binding(FILE *f, char *buff, char *map_alias, char *prefix)
 }
 
 static char *
-allocate_binding(int fd, char *wwid, int id, char *prefix)
+allocate_binding(int fd, const char *wwid, int id, const char *prefix)
 {
 	char buf[LINE_MAX];
 	off_t offset;
@@ -243,8 +246,8 @@ allocate_binding(int fd, char *wwid, int id, char *prefix)
 }
 
 char *
-use_existing_alias (char *wwid, char *file, char *alias_old,
-		char *prefix, int bindings_read_only)
+use_existing_alias (const char *wwid, const char *file, const char *alias_old,
+		    const char *prefix, int bindings_read_only)
 {
 	char *alias = NULL;
 	int id = 0;
@@ -311,7 +314,7 @@ out:
 }
 
 char *
-get_user_friendly_alias(char *wwid, char *file, char *prefix,
+get_user_friendly_alias(const char *wwid, const char *file, const char *prefix,
 			int bindings_read_only)
 {
 	char *alias;
@@ -358,7 +361,7 @@ get_user_friendly_alias(char *wwid, char *file, char *prefix,
 }
 
 int
-get_user_friendly_wwid(char *alias, char *buff, char *file)
+get_user_friendly_wwid(const char *alias, char *buff, const char *file)
 {
 	int fd, unused;
 	FILE *f;
diff --git a/libmultipath/alias.h b/libmultipath/alias.h
index 95473ff9..7c4b302b 100644
--- a/libmultipath/alias.h
+++ b/libmultipath/alias.h
@@ -7,9 +7,11 @@
 "# alias wwid\n" \
 "#\n"
 
-int valid_alias(char *alias);
-char *get_user_friendly_alias(char *wwid, char *file, char *prefix,
+int valid_alias(const char *alias);
+char *get_user_friendly_alias(const char *wwid, const char *file,
+			      const char *prefix,
 			      int bindings_readonly);
-int get_user_friendly_wwid(char *alias, char *buff, char *file);
-char *use_existing_alias (char *wwid, char *file, char *alias_old,
-		char *prefix, int bindings_read_only);
+int get_user_friendly_wwid(const char *alias, char *buff, const char *file);
+char *use_existing_alias (const char *wwid, const char *file,
+			  const char *alias_old,
+			  const char *prefix, int bindings_read_only);
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
