Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 085D0D52EE
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:47:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E0A5A3CD81;
	Sat, 12 Oct 2019 21:47:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30CCD6092F;
	Sat, 12 Oct 2019 21:47:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC2794EE50;
	Sat, 12 Oct 2019 21:47:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLW2Df007141 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:32:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D231660468; Sat, 12 Oct 2019 21:32:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx23.extmail.prod.ext.phx2.redhat.com
	[10.5.110.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D5316017E;
	Sat, 12 Oct 2019 21:32:00 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0BBBC1056F8F;
	Sat, 12 Oct 2019 21:31:59 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:31:05 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:55 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.10) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=GYEIBbhi1LVuJl/H75G9xXv4E5EBFRYpdj5y+zqU3SBPl3HkcyMNsJf+LBepos7Jj3cAmtt+MAwWUQizwbvxfmAE5DdnkWyxpfPaWsw6SH9ohBb+3z4DEXrAdSDjzgxCbvfTIu2gscv4ilKln7RUVCn2DamhpRyEhxTw7qVEsshlvEucvP6MVQgpNoAvepbuZ9oqHyBzdVhFPheeTnW7salM5mSnZRsed0x5WlYaKO1ubyX94RYyI+RgLwRsa0f1xRLT88Blnh6BgKpX8K3cp7XgIwLmIi+oxjPBiTADfacqQZUHwvSCXgxIiU9JSyEZKJHTeIjQ6bCO87+vIRMyYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=PzehQcr6XhR59XkuZ8b28tHqiMu+68QegYqOU7vxmu0=;
	b=BulV1RQ7NVi7yPOzkwEsgeqVynInvir6nfDtuOS0iX7900ZWUJydlwscgmncQmYhuaNVmPuh6tJieW5PHwir4pT79tEWx3oWN74kfdiN8S3zkOHTdTp59Xg2abV+8zMgqUZxyGnVsCgeJTepteIPR+8T6zEGt6Y8V7Um9dqtD1wekSkABocEMKvG9yVBZUuY85Rkc9O/+f5mfoB8OgfTzSHD5+u+MswS0klMoA35iEvl5aALAqsfCOh28STyFXntgpnEYT31cUtrD8v4svPKwTpUCcT1a38LVyNstdq+I94gPWCYvQpJFaA/xB2JZYPp0MalZtGz9zFgNoxXOXuPRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:51 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:51 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 40/72] libmpathpersist: fix copy-paste error in
	mpath_format_readresv()
Thread-Index: AQHVgUP81wjpo5ZFmU2s8Y3Vv6JHpA==
Date: Sat, 12 Oct 2019 21:28:27 +0000
Message-ID: <20191012212703.12989-41-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 8989bbca-f9b8-4d87-88f0-08d74f5b1e8f
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB33171CBD9862E831012BC493FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
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
x-microsoft-antispam-message-info: wfvYzh6ax3NDj/Yvnh2ihJ/1GWHoFWpTRB/k3iVqmh1oNKVOWdRIMqdFq2GVaEBjR7Om4yU62OMGXGQAycQGT60cKWyJc4X2+RQFL2ruP6+SNQVVnIaBmWtvARvUtOh0JTceRxuHjSR9sGrfCdaJsWmM6jyyaBI7pC9MlZX0wgunnIgZ+/H2DQApJgdnR7LDD6Wiui+WiWGB9EdYlx8nezXu3bJOQqBogjPgZVIj1A9Bfs82a2OadsOZlknkmBq1UItXzQ122/rf7YUhnB2bQJe+8eZIdfuRuI7WkDHd53xGOMCKFWmxH+xSSwYkG3lZnTripkMhZLzJCIbY3HFuVUeKX9C6CYD+xH5ZRmKgn3yXIqjNJFfCmqjF1/pIteE18J9EpPEKfBqzut06zUcGYpR0KPQV07fMwsHRgByoS/g=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8989bbca-f9b8-4d87-88f0-08d74f5b1e8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:27.2144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dvy3Y8h7sbbjtJ+t7xISXou4Axu/eM9lmp/ilfa3OO0GhvylfXGfoZoS8H9VkGvR1flqRv6iwtgSBbIXrj6OEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.64]); Sat, 12 Oct 2019 21:31:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]);
	Sat, 12 Oct 2019 21:31:59 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.64
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLW2Df007141
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 40/72] libmpathpersist: fix copy-paste error in
 mpath_format_readresv()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]); Sat, 12 Oct 2019 21:47:44 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

This would swap bytes for the wrong field.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmpathpersist/mpath_pr_ioctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libmpathpersist/mpath_pr_ioctl.c b/libmpathpersist/mpath_pr_ioctl.c
index 209892f6..05b30b56 100644
--- a/libmpathpersist/mpath_pr_ioctl.c
+++ b/libmpathpersist/mpath_pr_ioctl.c
@@ -188,8 +188,8 @@ static void mpath_format_readkeys(struct prin_resp *pr_buff)
 static void mpath_format_readresv(struct prin_resp *pr_buff)
 {
 
-	convert_be32_to_cpu(&pr_buff->prin_descriptor.prin_readkeys.prgeneration);
-	convert_be32_to_cpu(&pr_buff->prin_descriptor.prin_readkeys.additional_length);
+	convert_be32_to_cpu(&pr_buff->prin_descriptor.prin_readresv.prgeneration);
+	convert_be32_to_cpu(&pr_buff->prin_descriptor.prin_readresv.additional_length);
 
 	return;
 }
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
