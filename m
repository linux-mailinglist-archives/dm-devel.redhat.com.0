Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB41D52A6
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:30:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A412307D965;
	Sat, 12 Oct 2019 21:30:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 510E6194B9;
	Sat, 12 Oct 2019 21:30:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D820F4E589;
	Sat, 12 Oct 2019 21:30:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLSYYF006103 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:28:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CFA286031D; Sat, 12 Oct 2019 21:28:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx28.extmail.prod.ext.phx2.redhat.com
	[10.5.110.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 568D56017E;
	Sat, 12 Oct 2019 21:28:33 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2FD20883858;
	Sat, 12 Oct 2019 21:28:32 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:27:53 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:04 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.12) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=OUusrqv18phASB2JhIK7RRuSDiZDZLC7FDSlhTRawmdxhXx69eV7nfpu9w4ytKTguLhIOpbE5fzr2XRE29LGXCCYAYbWqRHJI04COFWhRat8C4FAo8V0ctWq9PB697YQFG0LCF7LtDyD2f8YA9klUop81UwKT3fTZkNEtNTLJpvPt0kEZY5GrgWJS6pw0mMb8ZeO0v32fUc6Qf8hNTsjNRwo/XkHkN6ptiy0aunxO6gZjsXGPEFac3YN3k6WOtZAZRiYCQqWlyORphDfnjGfbPZeYPKXHMSZDmXG2wUU3ypeAkc5ANw83DfJIyrUh4rHKNULS6UatQlXdsXqug1hIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=0IGYyKs1FB/oykR2Scj9xXtuYX8go0qwXMDhSF3k2W4=;
	b=FNe/IvPKk9VFYdbDbvmojAHW/05/Ax664UQ6VlN7Z85Q+69/gZ7Un2k3AaC08z4MzwaE4Nq5R/OI6d7o+se+kwB7r5Ea1sPSFGXPeAdjAAqB95IziDy2Snwa2fDb7ilozlaVvkGB+PCHfF1UGQIj38YgJug39FPfx8gfppGBnyuK0jdvo+BP8Zt+5xidAVgKzo1qrkZLD06gKiMoq6Aq6CKvSLJdVEtEJdb3WACiXVl2Qr6vGV90zFGFwkBHdvo/1CPG7/6Nik6BBkllzlRI5tM34EdUIsZnwUm0IJjlCwLLl/xu+JQdyL4nxmS7W4n/LgLkS8tHpAdUkFINJezbHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:01 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:01 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 19/72] libmultipath: remove_wwids(): fix possible leaks
Thread-Index: AQHVgUPsWMMnM1T/rEmvQ3bRTwvVdQ==
Date: Sat, 12 Oct 2019 21:28:00 +0000
Message-ID: <20191012212703.12989-20-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: ab3137ea-4dce-44dd-4cb4-08d74f5b0efb
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317E971430A0F368A5A3181FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:120;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(14444005)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QsFEPVI6BadBDa14V+Hibd6HVkGcSc9BQPCVF0WHYwipxAXTbeITOxPDaqu0N1xaeWjxWGBR9oTACi74aUiM8d6abQf6oMv+ubl7dCqgb7bJUcTEW4ZvsQ++xPwTErX2cCyn5lmpsmsmMTvVMFLe8TT5PInKuyO8bOTutHSt9dz5khjQMXLjsa7TNqOj+XGhCrZ3Kfeobgp2a37gV0pnFsGjLWwJqT005MSog5QAsbHM8kLLwWfY0/X3EZjZoPMU+bT6BWJ5PsjVu3a2fdYBsd3H0OiE0D9RiO89qTG3vc5bTr903+MRCMmmwfPY058yc40Eg3giSWJmLyhNDgNDqL1Owv4OpUXMh1nKUnUuzonZHr+TACNCdpZBYnmAs8W7dgduYNWjfyiK2Qq9NxUNRCLiALDjtxptea67JVBuJFw=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3137ea-4dce-44dd-4cb4-08d74f5b0efb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:00.9981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /rsQI7NbjEOCJVGMuOpHx2YvFy/vaUc1Qpti23yYdb7iIdwgnOB7kbFo1bGsi21U4dp2wi9mPqc1OojYjk7IaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.69]); Sat, 12 Oct 2019 21:28:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]);
	Sat, 12 Oct 2019 21:28:32 +0000 (UTC) for IP:'15.124.64.67'
	DOMAIN:'m9a0002g.houston.softwaregrp.com'
	HELO:'m9a0002g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.67
	m9a0002g.houston.softwaregrp.com 15.124.64.67
	m9a0002g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.69
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLSYYF006103
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 19/72] libmultipath: remove_wwids(): fix possible
	leaks
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Sat, 12 Oct 2019 21:30:45 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

... of fd and memory.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/wwids.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/libmultipath/wwids.c b/libmultipath/wwids.c
index f69ed6f5..d02a7072 100644
--- a/libmultipath/wwids.c
+++ b/libmultipath/wwids.c
@@ -195,7 +195,8 @@ do_remove_wwid(int fd, char *str) {
 
 int
 remove_wwid(char *wwid) {
-	int fd, len, can_write;
+	long fd;
+	int len, can_write;
 	char *str;
 	int ret = -1;
 	struct config *conf;
@@ -207,8 +208,10 @@ remove_wwid(char *wwid) {
 			strerror(errno));
 		return -1;
 	}
+	pthread_cleanup_push(free, str);
 	if (snprintf(str, len, "/%s/\n", wwid) >= len) {
 		condlog(0, "string overflow trying to remove wwid");
+		ret = -1;
 		goto out;
 	}
 	condlog(3, "removing line '%s' from wwids file", str);
@@ -216,18 +219,22 @@ remove_wwid(char *wwid) {
 	pthread_cleanup_push(put_multipath_config, conf);
 	fd = open_file(conf->wwids_file, &can_write, WWIDS_FILE_HEADER);
 	pthread_cleanup_pop(1);
-	if (fd < 0)
+
+	if (fd < 0) {
+		ret = -1;
 		goto out;
-	if (!can_write) {
-		condlog(0, "cannot remove wwid. wwids file is read-only");
-		goto out_file;
 	}
-	ret = do_remove_wwid(fd, str);
 
-out_file:
-	close(fd);
+	pthread_cleanup_push(close_fd, (void*)fd);
+	if (!can_write) {
+		ret = -1;
+		condlog(0, "cannot remove wwid. wwids file is read-only");
+	} else
+		ret = do_remove_wwid(fd, str);
+	pthread_cleanup_pop(1);
 out:
-	free(str);
+	/* free(str) */
+	pthread_cleanup_pop(1);
 	return ret;
 }
 
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
