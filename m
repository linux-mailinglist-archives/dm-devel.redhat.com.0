Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC0CD52D4
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:35:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0CB7DC08E286;
	Sat, 12 Oct 2019 21:35:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC3C45C226;
	Sat, 12 Oct 2019 21:35:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F4E31808878;
	Sat, 12 Oct 2019 21:35:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLUTUK006675 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 726CD5D717; Sat, 12 Oct 2019 21:30:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2669B5D6A3;
	Sat, 12 Oct 2019 21:30:27 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C504A3090FD1;
	Sat, 12 Oct 2019 21:30:25 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:29:47 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:29:01 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:29:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=kVS7pFebbx+mSXQ0GHzkFvaxHM+V1W6LtIaDhUhDOGoxEIGXdIVqfKb1ChRws4ySI1M8HJkx5+Tktq0m9OmK+N20yvQMxMzOMQTuMiWODAxlcszzKl0YHcsh4aRTLWAzr+1c23gD2vp1Agy4A+KrwVpgenYcn2mO5mTw3HFZFQIQXn93a0MTPQMxWMMfql+YHs4rJmIMJJvX3JsZ4GXZrytNRnHqNqfA/mlGoemDAXpHgh9O6PptSvPjSR9wBG3cXasTsZ5weVbFiSeIHQgjby2NBWmws5CYU8Z3kCEygsmar7fm9LAHIFkTNSb/+cFJWF20Kpy3xKy1UoZc5LaSEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=XanBbfJcXPRntUx0bTMwK8UER6q2AkYciCn2lSWUklA=;
	b=MhHIdAyPm5BtoQlef3WBUEm4rmiKXyrmtpTXcCwjWlFf/WPSJeRZwymMZDL3VTqZRFaTK/Z8HhIN3imBugGIR/TEfXTwONN8JADMo++PgEmePAs+CSG99O2FglabvX8Zdzoek9SIuaoFP3vi8j0Im7nWIup92d/W5ncEdfX8sN2xPAc0ZcEf6xIgcDMpF3CyjaeklwR9yvfOZpHFdCg6Y9clNSrW2cj5Msn6zYSPvX0g6E6bLSOXFdMe+vGwEnYWqMBatevjgOqtnH3PTafq6wWGAczMkAbpWnt71ig/eRku9nrJJHQCh/sM1EeU0P34FLiPf09s/5oBD9Y+/d7O+g==
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
Thread-Topic: [PATCH 55/72] libmpathpersist: fix -Wsign-compare warnings
Thread-Index: AQHVgUQH+KMgGVL0dUmJ3nYqYQCSEg==
Date: Sat, 12 Oct 2019 21:28:45 +0000
Message-ID: <20191012212703.12989-56-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: ace5b15a-f1d4-44b1-04f1-08d74f5b296d
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317734F1FF55EF42DE3E5ACFC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1013;
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
x-microsoft-antispam-message-info: dmZysS3nSBh1DSIuzv0ely0acl+GE0drvkF9sFoYwvz7R3GUxWBx0wrmKnnnLTWLE/RMAoF9lKljaZOk7wh9PSteRo/zIQ9wbhMMnVYYWSqbUs1JtBT0HMcgu+9ovDauSpnXilgzJetOoNeIk22RWXnzoKFyoDL5Grc5kTiQw1WSAyDwLEF9bDhz+nSbdFqndChEnhuo9awqiAYXVZHPHH8eJdHtM8hVR52CLShWcmbjcWievy3IA4P1KL98ZApq1bwypnwc3SJmbIeMfT6HCzFQZrFHQM2lQYg97k8AiNHCjcerVm77VWsCHx2NgucnP5zGE5YgVy98xMAf4BCO6owqoWsXyTp3Mc5qLGOoUkdKQkQSntHOTxHTyq/YpmZ4LVVMwnTQLHcrbIs/s1OeUI27QC9sBj/5BT0UN7702Bo=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ace5b15a-f1d4-44b1-04f1-08d74f5b296d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:45.3272 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: douC31w0QCEWv3wOUH4g5CUcz235tDyF5mMpT9/r/wcWyxnIo+6Vl73d8OFcc4PvOgIGYFVjuBluckl5xNIV2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Sat, 12 Oct 2019 21:30:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Sat, 12 Oct 2019 21:30:26 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLUTUK006675
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 55/72] libmpathpersist: fix -Wsign-compare
	warnings
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Sat, 12 Oct 2019 21:35:22 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmpathpersist/mpath_persist.c  |  3 ++-
 libmpathpersist/mpath_pr_ioctl.c | 10 +++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
index 603cfc3b..0c57dd92 100644
--- a/libmpathpersist/mpath_persist.c
+++ b/libmpathpersist/mpath_persist.c
@@ -854,7 +854,8 @@ int update_map_pr(struct multipath *mpp)
 {
 	int noisy=0;
 	struct prin_resp *resp;
-	int i, ret, isFound;
+	unsigned int i;
+	int ret, isFound;
 
 	if (!get_be64(mpp->reservation_key))
 	{
diff --git a/libmpathpersist/mpath_pr_ioctl.c b/libmpathpersist/mpath_pr_ioctl.c
index 05b30b56..74b26b0c 100644
--- a/libmpathpersist/mpath_pr_ioctl.c
+++ b/libmpathpersist/mpath_pr_ioctl.c
@@ -140,7 +140,7 @@ retry :
 
 uint32_t  format_transportids(struct prout_param_descriptor *paramp)
 {
-	int i = 0, len;
+	unsigned int i = 0, len;
 	uint32_t buff_offset = 4;
 	memset(paramp->private_buffer, 0, MPATH_MAX_PARAM_LEN);
 	for (i=0; i < paramp->num_transportid; i++ )
@@ -204,11 +204,11 @@ static void mpath_format_reportcapabilities(struct prin_resp *pr_buff)
 
 static void mpath_format_readfullstatus(struct prin_resp *pr_buff)
 {
-	int num, k, tid_len_len=0;
+	int num;
 	uint32_t fdesc_count=0;
 	unsigned char *p;
 	char  *ppbuff;
-	uint32_t additional_length;
+	uint32_t additional_length, k, tid_len_len = 0;
 	char tempbuff[MPATH_MAX_PARAM_LEN];
 	struct prin_fulldescr fdesc;
 
@@ -269,8 +269,8 @@ static void mpath_format_readfullstatus(struct prin_resp *pr_buff)
 void
 decode_transport_id(struct prin_fulldescr *fdesc, unsigned char * p, int length)
 {
-	int num, k;
-	int jump;
+	unsigned int num;
+	int jump, k;
 	for (k = 0, jump = 24; k < length; k += jump, p += jump) {
 		fdesc->trnptid.format_code = ((p[0] >> 6) & 0x3);
 		fdesc->trnptid.protocol_id = (p[0] & 0xf);
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
