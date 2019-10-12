Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 438D1D52D2
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:35:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5BC6F89AC4;
	Sat, 12 Oct 2019 21:35:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25C7B6031D;
	Sat, 12 Oct 2019 21:35:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B22381803517;
	Sat, 12 Oct 2019 21:35:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLUReI006660 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 32AAB19C70; Sat, 12 Oct 2019 21:30:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 299FA19C6A;
	Sat, 12 Oct 2019 21:30:27 +0000 (UTC)
Received: from m9a0001g.houston.softwaregrp.com
	(m9a0001g.houston.softwaregrp.com [15.124.64.66])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1803E8666C;
	Sat, 12 Oct 2019 21:30:26 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0001g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:29:42 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:29:00 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:29:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=mXPCNAeTgCu34M07e9oSI0Rnhp/n5MDpMThu+0Z5cOj7YzTQeGcEH+xA4rfX1fxwIMRFD/cpejsuh/yiDcMbtb1hSrm1Z6IrWQrV3AidgzxbU9OSK30SnNJjVtOta+Juqbud6+b6mPUi071WLb24h3yHVxJ98fspbtMVCZpH7IomYtd2HJzpEDdUkcPODQERhf0WHBb9QZQCpt2qWQPugEXPCm3Id6s/lXNenbygDU8KYfVjsmqMVe4OHVT8WJr44hk9FAi9aDMuMcvaCUwrRw//CZ/FPjL+d6mp8qv/3NL8TuZzhgx1NAh5imDxKgqfOmqoDPH5WD2PdWY+2SPosQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/lcoTlH+opvHWXHYoeUtXPE4SxW9SETW4lVWpF/S5us=;
	b=EG7ej2J30qU13O/CuY1d4N66/1khPlzamsRP4rOg19m7RaHSlq5k6+1EKMj5XY1JqT74vTdeEq9r1t300wT1R2POWs3Ng/r39uFGQO8XubBZRQUI1l6mRLbwRL9F7w+9Q1dCfxwHe7qmoHYAvwUYLvKMP1DI3oG63MVovEc4KXfYBWplayoSdzzuXfOK1W3xOQL72Y67ZGY5/S1vaJQ5Q/tHHAf/ZvSDy4pvzmXnGgmrBGaceGaxz3i4MuwK4s3KT/X+1ExH3LzVWafvaQuNOd4WsFvb4V5tkBjYHV/9KgUFN2a7mkw9JoEdbxUc+sKnDSGU3CQ+oy1BKwYLF+oRfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:57 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:57 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 54/72] libmpathcmd: fix -Wsign-compare warnings
Thread-Index: AQHVgUQGWZB+g0zMY06dqTPEFclz/Q==
Date: Sat, 12 Oct 2019 21:28:44 +0000
Message-ID: <20191012212703.12989-55-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: eead2dd2-ac01-4890-7e8a-08d74f5b28ab
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB33177A6C33B90CD502ACA4CCFC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:346;
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
x-microsoft-antispam-message-info: W4GGIHf4rgOPJJOzGTGLjLkyjBIOSnEGsR6xswfrj3BvWtDBdKx9SbvppwT3AEj2OE1E6qoNSTiIUypIy0MXnPGfHGJo/AbCGLdwIif2nVS8n+QaRQuo+0MZg1DddikYK3f3ZhPbY9tT0QeQDSrY/9n71Kq4dQh9jxLde2UNzl2Jz8hhrUSldm1wc0tyRSltaHciCq4hSIO1k2857ObwoK7A5QstcBx+HIF64ByQQ+yjPMNwo8XNhp5m6QhBjQPif1NPuSjgk1mlSX6+RFJaV8u5JNpD5o+50qgbaDWDe7ReeBLJSfWnb/OnXEVHK8N6AOefGyBV8MVwFz6eLFu26tZKhcP3MfeBLjCOqK6PP0hcNP+ZxVDL24lTU1cqEnQHuiYUP54YTgnh6P56dOmu8E0IZd1Tm/TFySn1uO7Vnmo=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: eead2dd2-ac01-4890-7e8a-08d74f5b28ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:44.1948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GpQX2dTGi5e74ttQb4rTBqj+nBNu9ee/lE09IRnvADHAygpTNbo5OSpAcfjyAgaI7NSsIzmfb2dJo6baZ19n5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.26]); Sat, 12 Oct 2019 21:30:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Sat, 12 Oct 2019 21:30:26 +0000 (UTC) for IP:'15.124.64.66'
	DOMAIN:'m9a0001g.houston.softwaregrp.com'
	HELO:'m9a0001g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.66
	m9a0001g.houston.softwaregrp.com 15.124.64.66
	m9a0001g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLUReI006660
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 54/72] libmpathcmd: fix -Wsign-compare warnings
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Sat, 12 Oct 2019 21:35:02 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmpathcmd/mpath_cmd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/libmpathcmd/mpath_cmd.c b/libmpathcmd/mpath_cmd.c
index f00bf7e1..60b2d965 100644
--- a/libmpathcmd/mpath_cmd.c
+++ b/libmpathcmd/mpath_cmd.c
@@ -96,7 +96,8 @@ static size_t write_all(int fd, const void *buf, size_t len)
  */
 int __mpath_connect(int nonblocking)
 {
-	int fd, len;
+	int fd;
+	size_t len;
 	struct sockaddr_un addr;
 	int flags = 0;
 
@@ -172,7 +173,7 @@ int mpath_recv_reply_data(int fd, char *reply, size_t len,
 	ret = read_all(fd, reply, len, timeout);
 	if (ret < 0)
 		return ret;
-	if (ret != len) {
+	if ((size_t)ret != len) {
 		errno = EIO;
 		return -1;
 	}
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
