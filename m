Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAACC47F0
	for <lists+dm-devel@lfdr.de>; Wed,  2 Oct 2019 08:50:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E4648980F5;
	Wed,  2 Oct 2019 06:50:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6779E1C928;
	Wed,  2 Oct 2019 06:50:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B217718089C8;
	Wed,  2 Oct 2019 06:50:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x926oMve014175 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Oct 2019 02:50:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 78BE43CCA; Wed,  2 Oct 2019 06:50:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99322261B3;
	Wed,  2 Oct 2019 06:50:19 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D355D8553B;
	Wed,  2 Oct 2019 06:50:17 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Wed,  2 Oct 2019 06:49:39 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 2 Oct 2019 06:48:13 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.72.14) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 2 Oct 2019 06:48:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=VpWCg3h0NfgLQZdZ1opX0iQr7c04UzZPvP7oPScsaBPsXeZfzqP7cPDpAvWUOWMFokj9zb4NF17Q0PA/SMgjJfWW7SdH9oUpY+xQJnhS43n9noYM23KlQ8wiK2iVkah3YSL475WGX8bhN7rf20kCr7IDYDHvQd22kobkrW66iTO7goX130ha3G/OsQFt03+x/Ui0cVyxzRdD42DIX3R1RlsjzGpY8vobIBgarvOzZDf6c+S5wH04GMqVMFhzzfbGHnNZpYJuoDiggykPhQSWqUtSD62xbmqGYtuG6F1EsUHSs1M4IRibG/+OZyLev/EpyCEIIfw3FxCCpzA02LBSmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=x8DNeyq/jyTax+sQjremKpWYtjVCezN0pvfubGWpj8Q=;
	b=CDxBbRyACogQ5ArFBybez/XvU62OFHhNgj1pYMd+ajGHu0ydV8YzvXtN7dk5UghJP874tTuyu8/b4F8p//fNYRdKa9IKjwmhET66P7li4YBtlGjUCCwTL6/SBM0P3MaxNHWIBXzzk2aI7Ju82Cv3OkCPEKKMRU7zP+04e5DS3F8rjN/C0uxE4DSQZ9ndlE0bV1PrLz2jFzuYGQQkUIX4JocCUP00Y19QOq1p4kj16ISeIiXddbB7cYpGiuwektxNx7JjFQImMaM+c3k0dd34PNoAIumSySSe5v7d7nJNvkqP/fAHm/AmZEQvZ4vlma3Kf+tVQjADeBHt/QQdWBmM8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3176.namprd18.prod.outlook.com (52.132.244.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2305.20; Wed, 2 Oct 2019 06:48:03 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2305.017;
	Wed, 2 Oct 2019 06:48:03 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Chongyun Wu
	<wu.chongyun@h3c.com>
Thread-Topic: [PATCH 0/3] Rebased multipath-tools patches
Thread-Index: AQHVeO1Wlc0YGgmw8Eqj/oacEHUOHA==
Date: Wed, 2 Oct 2019 06:48:02 +0000
Message-ID: <20191002064655.2669-1-martin.wilck@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR07CA0111.eurprd07.prod.outlook.com
	(2603:10a6:207:7::21) To CH2PR18MB3349.namprd18.prod.outlook.com
	(2603:10b6:610:28::19)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2.203.223.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c9511bf-6ce7-4b5b-b2f5-08d747047892
x-ms-traffictypediagnostic: CH2PR18MB3176:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3176A13F6CA98D7672ED8962FC9C0@CH2PR18MB3176.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(189003)(199004)(6506007)(110136005)(25786009)(5660300002)(66066001)(4744005)(2906002)(316002)(102836004)(478600001)(14454004)(52116002)(26005)(4326008)(99286004)(6486002)(186003)(81166006)(81156014)(8936002)(50226002)(6116002)(6512007)(54906003)(66446008)(64756008)(66946007)(14444005)(256004)(386003)(3846002)(107886003)(44832011)(8676002)(2616005)(66556008)(6436002)(66476007)(476003)(71200400001)(1076003)(86362001)(71190400001)(36756003)(486006)(305945005)(7736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3176;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t5xWMi94yADNBd1tuHVDjhpPCOr9vT8FehYq/20TB9gY7tefzUW6rqEMRs15Zd4nFaVXxF8Zu2B84slmueO+DSpOHa5uPC3XZB6sXHGwxGK3uMYr+isQCujubSXwM5gljDQ4435/iBXUqWsa4nahuU3LJ+0q5GOYYD1ToH4z9zwhL9do4qqmlbwg8jsaIzbEfotxooxTcpI9zKAnatfgJYwQ6P8ooDZ731inwTeaJL91gHYMnYmH221eVX2uByoMs//O/qDM/P1u0Jy5WExlfF+2gEiEaqrrwEY3oy1+nEblu3wgF4Cj5Gn2y3WS/yu16PSeLftmexL0T8852jqOG9qg7+4Dml7PrvW5xYAwaRRbQFoZlslGZPnQ98BrxyatFicMZ3lMtneql1PGwDihTIhikkZ/7hrY3KJNwXVJpO4=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9511bf-6ce7-4b5b-b2f5-08d747047892
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 06:48:02.8783 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f+GIvC5dbXf89VZCUzWMjlA6KBUiDfo/qcDH2js8LYrTMi0JP3YuaQfkNBJL4PiuRmPfqz6SXBMUQwlfF4ZnKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3176
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.28]); Wed, 02 Oct 2019 06:50:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Wed, 02 Oct 2019 06:50:18 +0000 (UTC) for IP:'15.124.64.67'
	DOMAIN:'m9a0002g.houston.softwaregrp.com'
	HELO:'m9a0002g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.67
	m9a0002g.houston.softwaregrp.com 15.124.64.67
	m9a0002g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x926oMve014175
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 0/3] Rebased multipath-tools patches
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]); Wed, 02 Oct 2019 06:50:35 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Hi Christophe,

here are the three patches that needed rebasing after
your last merge.

Regards,
Martin


Chongyun Wu (1):
  multipathd: "san_path_err" failure optimization

Martin Wilck (2):
  multipath.conf: add "enable_foreign" parameter
  multipath.conf.5: document foreign library support

 libmultipath/config.h      |  1 +
 libmultipath/defaults.h    |  2 ++
 libmultipath/dict.c        |  6 +++++
 libmultipath/foreign.c     | 53 +++++++++++++++++++++++++++++++++++---
 libmultipath/foreign.h     |  3 ++-
 multipath/main.c           |  2 +-
 multipath/multipath.conf.5 | 40 ++++++++++++++++++++++++++++
 multipathd/main.c          | 19 +++++++++++++-
 8 files changed, 119 insertions(+), 7 deletions(-)

-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
