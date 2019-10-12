Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0E4D52CA
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:33:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A0AA5C05243E;
	Sat, 12 Oct 2019 21:33:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75BDF60BF4;
	Sat, 12 Oct 2019 21:33:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 457FE180BA99;
	Sat, 12 Oct 2019 21:33:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLVuwj007121 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:31:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A3ECD5D721; Sat, 12 Oct 2019 21:31:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A2D25D717;
	Sat, 12 Oct 2019 21:31:56 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 193E1302C084;
	Sat, 12 Oct 2019 21:31:55 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:31:01 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:54 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.10) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=KvZKm9nJvOi6k34HcZFRSnU1hYnDF9xIOwVp0eJsEN0FGYY+lrfgRcWyTlVilxcp/V+sLDvrd5tMChd/9j+NCJelfROxotPu6zU1XAuD97zFZ7lJgbutdLbP4Xi3FEEFzdVqpfuSzatjP92pl33R/NPXbcfhRtOYLHGFvmWh582rr2/XBSS+9r09xo6H6YjWbLhx0DuKHmuT5Zjn1ZCXKnphPNEBMOa7QPrNl5eWJDKjf5B/Uja93X28bvrkt7MXCthMacfpecho7bzPkvYRka5UJc8ekbKOigXAm/8sZFmDvZ4WSqnHL4yPPIw/N0N1GnVSk3C4Zs8syI9ahVniDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=PHlkp08IDc+t0vZ2CZ2oY4Ci9UrURO0OgyEVg5vF86c=;
	b=nKPdSIGrNbV/kX0RK2axdb4IYrQ1zfPkSCycOuHc5A0HKErogf6+qqeSNw6PRFK3DRbNKjOkhgKQ2xNsiYRBUNSdfAIIAU5valkhAJHj8AdAIBglxA59zqT+QAIvYK2K3N7TeI0u5iiFW7Puy+cqbRldjCYdIsiTSP8L12evGYTBgbSFufeNJJFH7loC6z8hogivZ/WBU52iPoUWDxN9RYLrNOQy2kJ6UR2713aj997CJwyEI5Xwfwf1EwakDt1aJbzs5CEuOWDvMcZ9VwTLJs63kOrSm9W0Y5POhWFgIlKDLoUJNHZJdWbCyQgOR91Qk9smNttnp9R3XgUgj36kTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:50 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:50 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 39/72] libmpathpersist: remove unused "noisy" argument in
	various functions
Thread-Index: AQHVgUP7n9TkEVHQO0mf4HwzSjUFFg==
Date: Sat, 12 Oct 2019 21:28:25 +0000
Message-ID: <20191012212703.12989-40-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: c3a7820f-fe6f-4b99-0a36-08d74f5b1ddc
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331774E39AE078D5E5DB2906FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:104;
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
x-microsoft-antispam-message-info: 0iBUThhDialEFSBZw/zRTLMKK+madzOQ1smTcuzzdYcngtvZP3oWpA0jUCWU0U28y9rRR/pz7uEwHnlPWIy4kmNFEyrAnCO/hxwjXhTX6pe1cZZuLxoIWef+GApvn/loSfn0f4Ig0DjZ+vXUIlk+TCibUVG5hx2Ig+4d9SknS4JX0hRQ/6igkJCQ8Jbx3wwebpAMW/0sJjet103HuwqvnRV3lZbjfQ+FsVQyCfEfgLzbpcoqh9k7YmTF/tSD35Ml9Reel4LjZA8MHVG1079rD74Z06B0RjIswPk/GN/NV64H+kNrhwFer5Zb0fvXWz2B8Lx4mLredkrRzF/trEYAOlnNUjoNuvstoPM/1kZKvRKYN/aJ8xZ0S4EoJLuZhMbU/nOahcDbjOR/dkE66A2JovlZK2NnfbxP9a25d2IULEw=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a7820f-fe6f-4b99-0a36-08d74f5b1ddc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:25.9461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i40xT61eMiXIJjWBW+WOguTPnJRK72FXUK1nzRF5YDaCbPk0JQqiiXpS/dfDHkf2+q14kwzdzPqV0s0zqnigKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Sat, 12 Oct 2019 21:31:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Sat, 12 Oct 2019 21:31:56 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLVuwj007121
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 39/72] libmpathpersist: remove unused "noisy"
 argument in various functions
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Sat, 12 Oct 2019 21:33:55 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmpathpersist/mpath_pr_ioctl.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/libmpathpersist/mpath_pr_ioctl.c b/libmpathpersist/mpath_pr_ioctl.c
index cf528feb..209892f6 100644
--- a/libmpathpersist/mpath_pr_ioctl.c
+++ b/libmpathpersist/mpath_pr_ioctl.c
@@ -23,10 +23,8 @@
 #define MAXRETRY 5
 
 int prin_do_scsi_ioctl(char * dev, int rq_servact, struct prin_resp *resp, int noisy);
-void mpath_format_readkeys(struct prin_resp *pr_buff, int len , int noisy);
-void mpath_format_readfullstatus(struct prin_resp *pr_buff, int len, int noisy);
 int mpath_translate_response (char * dev, struct sg_io_hdr io_hdr,
-			      SenseData_t *Sensedata, int noisy);
+			      SenseData_t *Sensedata);
 void dumpHex(const char* str, int len, int no_ascii);
 int prout_do_scsi_ioctl( char * dev, int rq_servact, int rq_scope,
 		unsigned int rq_type, struct prout_param_descriptor *paramp, int noisy);
@@ -115,7 +113,7 @@ retry :
 
 	condlog(4, "%s: Duration=%u (ms)", dev, io_hdr.duration);
 
-	status = mpath_translate_response(dev, io_hdr, &Sensedata, noisy);
+	status = mpath_translate_response(dev, io_hdr, &Sensedata);
 	condlog(3, "%s: status = %d", dev, status);
 
 	if (status == MPATH_PR_SENSE_UNIT_ATTENTION && (retry > 0))
@@ -181,13 +179,13 @@ uint32_t  format_transportids(struct prout_param_descriptor *paramp)
 	return buff_offset;
 }
 
-void mpath_format_readkeys( struct prin_resp *pr_buff, int len, int noisy)
+static void mpath_format_readkeys(struct prin_resp *pr_buff)
 {
 	convert_be32_to_cpu(&pr_buff->prin_descriptor.prin_readkeys.prgeneration);
 	convert_be32_to_cpu(&pr_buff->prin_descriptor.prin_readkeys.additional_length);
 }
 
-void mpath_format_readresv(struct prin_resp *pr_buff, int len, int noisy)
+static void mpath_format_readresv(struct prin_resp *pr_buff)
 {
 
 	convert_be32_to_cpu(&pr_buff->prin_descriptor.prin_readkeys.prgeneration);
@@ -196,7 +194,7 @@ void mpath_format_readresv(struct prin_resp *pr_buff, int len, int noisy)
 	return;
 }
 
-void mpath_format_reportcapabilities(struct prin_resp *pr_buff, int len, int noisy)
+static void mpath_format_reportcapabilities(struct prin_resp *pr_buff)
 {
 	convert_be16_to_cpu(&pr_buff->prin_descriptor.prin_readcap.length);
 	convert_be16_to_cpu(&pr_buff->prin_descriptor.prin_readcap.pr_type_mask);
@@ -204,7 +202,7 @@ void mpath_format_reportcapabilities(struct prin_resp *pr_buff, int len, int noi
 	return;
 }
 
-void mpath_format_readfullstatus(struct prin_resp *pr_buff, int len, int noisy)
+static void mpath_format_readfullstatus(struct prin_resp *pr_buff)
 {
 	int num, k, tid_len_len=0;
 	uint32_t fdesc_count=0;
@@ -361,7 +359,7 @@ retry :
 	condlog(3, "%s: duration = %u (ms)", dev, io_hdr.duration);
 	condlog(4, "%s: persistent reservation in: requested %d bytes but got %d bytes)", dev, mx_resp_len, got);
 
-	status = mpath_translate_response(dev, io_hdr, &Sensedata, noisy);
+	status = mpath_translate_response(dev, io_hdr, &Sensedata);
 
 	if (status == MPATH_PR_SENSE_UNIT_ATTENTION && (retry > 0))
 	{
@@ -389,16 +387,16 @@ retry :
 	switch (rq_servact)
 	{
 		case MPATH_PRIN_RKEY_SA :
-			mpath_format_readkeys(resp, got, noisy);
+			mpath_format_readkeys(resp);
 			break;
 		case MPATH_PRIN_RRES_SA :
-			mpath_format_readresv(resp, got, noisy);
+			mpath_format_readresv(resp);
 			break;
 		case MPATH_PRIN_RCAP_SA :
-			mpath_format_reportcapabilities(resp, got, noisy);
+			mpath_format_reportcapabilities(resp);
 			break;
 		case MPATH_PRIN_RFSTAT_SA :
-			mpath_format_readfullstatus(resp, got, noisy);
+			mpath_format_readfullstatus(resp);
 	}
 
 out:
@@ -407,7 +405,7 @@ out:
 }
 
 int mpath_translate_response (char * dev, struct sg_io_hdr io_hdr,
-			      SenseData_t *Sensedata, int noisy)
+			      SenseData_t *Sensedata)
 {
 	condlog(3, "%s: status driver:%02x host:%02x scsi:%02x", dev,
 			io_hdr.driver_status, io_hdr.host_status ,io_hdr.status);
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
