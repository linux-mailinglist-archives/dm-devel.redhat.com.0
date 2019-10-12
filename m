Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE39D529A
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:29:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C385A18C4272;
	Sat, 12 Oct 2019 21:29:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F1DE6031D;
	Sat, 12 Oct 2019 21:29:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D3DE4E58A;
	Sat, 12 Oct 2019 21:29:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLSMAW005957 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:28:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E4E545D717; Sat, 12 Oct 2019 21:28:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx26.extmail.prod.ext.phx2.redhat.com
	[10.5.110.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5D255D6A3;
	Sat, 12 Oct 2019 21:28:20 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C198801664;
	Sat, 12 Oct 2019 21:28:19 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:27:40 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:27:52 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:27:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=AIRd1t9y2v5Zy/OBDEnxVFTmrocZxPFmb2r7jRW4jwDh3KbxK48psQiVE3SFCCEdEFDz1oLQoZ5OErdl0zTCVFVekp0uTUdjQSPmpew3NZTWACBej2ItnPr0ldeuN97NqLp/TskMLe4zJGN/Nwsg472zVpOQdQW+Jlppp9oGA8+jEKGxB9Zmti05qTXBF9Om5Ylpm6eLF2H7kJ83XrZy3MeJaY4GFltXsCquFO0pxsrCWni1dPrOCn80nm2F4jP0F3SseuNVdhvj+XR5U7f965kfiGjoLpRHTFL6s3/rIhAbvM+OYlx/RoYEFbv9nBGAeBdrbNL78e1HCmU5Mp2ONg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=uMqd0t4oAckFt/3JlLR3cVw9UzHAQIPcGHoia2tpyas=;
	b=erY1+NjYmJnWoonXIS35jZe2eahdnWUMjf60XcC+VCe04oqNYTxYQXyCqaloRflouMG7S5uxbM4IOij0K1N0U5Galqn/uL4nQTM65Cc070HoN2JviQ0L9YRlDRGMgsCiJKqS2mbjtTlvYaO+pgrnomt50feadwiFOyMb8c2VrjlJz4O5AB6L+W9kMj5fSFkn5qClbw7VBojqadHns8yOlAYohY7RkzdHxyj5GL3Z8zdd4iPPhk32l8e0bl+4054RleWMaEcxDW8+nnxP2P5Fgu4aVlXmZsTeSGsHYkIBJrfZgBPGqtGlD9ZE1WR7Lq05v5VbCmDlbff9gT48DANOiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:27:48 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:27:48 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 09/72] libmultipath: allocate_binding(): error out for
	id=0
Thread-Index: AQHVgUPlPKVGomRkqESDwfnyQ87iNg==
Date: Sat, 12 Oct 2019 21:27:48 +0000
Message-ID: <20191012212703.12989-10-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: f37f0f5b-391a-4c58-639f-08d74f5b075f
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB33170FA68CFC9FD105AABB1AFC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(4744005)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8UvcVGTYIh9mE0hUTLuCA14+7FnjXmfmI5H8e5bjLGMOvYKIvL4UIdmLfIXseRH1PjOONx+wUwg+F6bgFfUPLTmq304sDjT2C6dhOkqUxplSkYUp2ar4z59oSwWzcogdDJLoZO5jz8jEnz6BgeoVQ9qa6CJHFCYs8mZmI/nNvxLLFJ+FGV9aUkQOTUDbwIdktlFKJVcqCNyGxZYlB2/Pg3kBt91ju/ffO8wt8LNqzzN2xQWfMIbogE0sYn+v6MDYDUBocOQxYq1xCpw3sAGWg0vMC4bdRDg8YimV802kdb69ZUYy2QcWvpcEEeeGHIdYu5Y5STr+DhOin5od3DaYeeyr/O5wwcEa5YzLol7a75W2smK9xGumgqqGtsNKTsWwBtKQXcz39ZR4aB0ky19vKeB4HN/L8QZZK+dNrBSBjmw=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f37f0f5b-391a-4c58-639f-08d74f5b075f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:27:48.3373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MRr1wqdj8v3m/cjeWDyEPif7IHtOGN/ThF8+gJxgyREdMiWPKOtqqysxgAUZjq4/6dO7PqrFOes7uj/4SOiS2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.67]); Sat, 12 Oct 2019 21:28:20 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]);
	Sat, 12 Oct 2019 21:28:20 +0000 (UTC) for IP:'15.124.64.67'
	DOMAIN:'m9a0002g.houston.softwaregrp.com'
	HELO:'m9a0002g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.67
	m9a0002g.houston.softwaregrp.com 15.124.64.67
	m9a0002g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.67
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLSMAW005957
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 09/72] libmultipath: allocate_binding(): error
	out for id=0
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]); Sat, 12 Oct 2019 21:29:20 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Only for positive id can we allocate a binding. All current
callers make sure the id is positive. Yet, fix the implementation
in allocate_binding(), too.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/alias.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/libmultipath/alias.c b/libmultipath/alias.c
index 767800d0..2df34f32 100644
--- a/libmultipath/alias.c
+++ b/libmultipath/alias.c
@@ -233,8 +233,9 @@ allocate_binding(int fd, const char *wwid, int id, const char *prefix)
 	char *alias, *c;
 	int i;
 
-	if (id < 0) {
-		condlog(0, "Bindings file full. Cannot allocate new binding");
+	if (id <= 0) {
+		condlog(0, "%s: cannot allocate new binding for id %d",
+			__func__, id);
 		return NULL;
 	}
 
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
