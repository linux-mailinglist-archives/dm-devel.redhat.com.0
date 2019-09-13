Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8344CB19AE
	for <lists+dm-devel@lfdr.de>; Fri, 13 Sep 2019 10:33:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4240D308FBFC;
	Fri, 13 Sep 2019 08:33:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66FC55C219;
	Fri, 13 Sep 2019 08:33:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D88C42551B;
	Fri, 13 Sep 2019 08:33:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8D8UsWL009972 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 13 Sep 2019 04:30:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 474743CCE; Fri, 13 Sep 2019 08:30:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx29.extmail.prod.ext.phx2.redhat.com
	[10.5.110.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABDB319C5B;
	Fri, 13 Sep 2019 08:30:51 +0000 (UTC)
Received: from m4a0040g.houston.softwaregrp.com
	(m4a0040g.houston.softwaregrp.com [15.124.2.86])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9AD8718C892F;
	Fri, 13 Sep 2019 08:30:46 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0040g.houston.softwaregrp.com WITH ESMTP; 
	Fri, 13 Sep 2019 08:29:48 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Fri, 13 Sep 2019 08:29:06 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.8.14) by
	M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Fri, 13 Sep 2019 08:29:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=VwHu7vzPl/RDskK15BwIjjfuBcwiYwgD5gB3JmAG7AcMvGoTDMT8h3gIZHrz53/K8RiX5eJUno2qZbJf0scWd1hvX5vZU3YwbfPgiuiZ1hL35de+fcD6f6+R45WCTEouJlmwGmcG9NpYwjyb0jHW8mwggbaHlJ3txYGuL8XwoyhyEq3NUJ8smwdtQNkx3LoEQYccZkcR9B6y/wwV+x0jTICGxLEoIT/yLyPPFCzbkVt373RtwZjSh3Wbkizkax+XdC0nkLTzr1hxFOMEk4yml52edE6ShMqPHOsIa/xuVBG38w6SxbK/0svbUXmIaCzRbgNDhIOoQnqKIhMwNnLuTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=o1NB6MCTOKO1JmEiZVxwFutvFWaRpI7IorY9W6Hm1/4=;
	b=n+fJF2yifYxh2icPThyZ1/aQQ3Tia0Nala/ycSE+g5rYy5NwxWEHsc8XjG3oxvUXiQnwPCYSDKEakruVOsgYqF6nLcyDlhYAfOYg1CTvy9Fo7iO0wkf5QusctzVFS39RJoz3oQ9oobMN7QQUuzceWJ0INOKwIkMmjoytMkrYgprnVBrGQiT8fPZSuPnovZmPEA4jQ0zrp11VKuPePN/NUxJ00s1oY5j25FP1AC4hpjvFpxK5ULuxKrsa56k9hN2L2Qvll5q8nP0PnMhwapWE9MRPfCwFc2RmrDHcm0ZHE/lrtCRjZC2fG9Ps+EMSrK1LH0bGZwCeV1gfnJeHVKv3vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3253.namprd18.prod.outlook.com (52.132.245.91) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2241.18; Fri, 13 Sep 2019 08:28:59 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::d507:1099:1d46:c025]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::d507:1099:1d46:c025%6]) with mapi id 15.20.2241.018;
	Fri, 13 Sep 2019 08:28:59 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 4/4] libmultipath: fix mpcontext initialization
Thread-Index: AQHVag1KRoqjXBBEcUKAILD89qqSEg==
Date: Fri, 13 Sep 2019 08:28:59 +0000
Message-ID: <a7b7b31b82369a51e9490c1a6fd7ce770be3bfbe.camel@suse.com>
References: <1568155161-9343-1-git-send-email-bmarzins@redhat.com>
	<1568155161-9343-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1568155161-9343-5-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [90.186.0.117]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55bbb54b-0206-4df6-8fe4-08d738246d40
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3253; 
x-ms-traffictypediagnostic: CH2PR18MB3253:
x-microsoft-antispam-prvs: <CH2PR18MB325360B4D14A02CFEA485178FCB30@CH2PR18MB3253.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0159AC2B97
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(199004)(189003)(53936002)(6506007)(6512007)(71200400001)(71190400001)(8936002)(2501003)(36756003)(6246003)(66476007)(66556008)(64756008)(66446008)(25786009)(81166006)(305945005)(81156014)(6116002)(229853002)(4326008)(7736002)(118296001)(66946007)(2906002)(66066001)(76116006)(11346002)(446003)(76176011)(91956017)(476003)(186003)(26005)(2616005)(256004)(8676002)(6486002)(3846002)(86362001)(6436002)(110136005)(316002)(5660300002)(486006)(99286004)(478600001)(102836004)(14454004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3253;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6VKuSMXllajbn38I7gIvnH4xIo32ninEwuDItrvL3TUp3bMFuy3/2PCXlqo8/Mkv2OHAyVAY713ZlFRk/NN0gY2j4zphmHHitgkhUj2qhj20mYp1/YbfCjMrvvo+cLoCAMg2rhznnYrFMSdtf74dgyp9e20KW6TdilWR5ZqUR0Y80HH6sA7Mt0TgoSHA7PYlie7De/I47gMXrFVrNd/qWpQjZFrF5HhhkqMFqBc5d6q0P/s1oGrHvb1rDKH4zrfq0f52vmGKYYdOGFQevJCiKxGub/LrlmSWC4Pe04Geodeu+KR4ueWXdaj0YoTkyWSccH1V/kBxMZX38+UH4mhhalIznT4Fzsb/6zG6BNbyzEAZuDjvgbdHMikmuuOUxakOg1t45wFuODgMmqeJForqYpVxqIgw/Aw2NnfDs5LPXII=
x-ms-exchange-transport-forked: True
Content-ID: <B0A02253C443C74FAD92DC3F381D4ABE@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 55bbb54b-0206-4df6-8fe4-08d738246d40
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2019 08:28:59.8060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thFXnJx3OZleDdfdwRriH3AKKNeVcrEFzuenku2JyRc30KxYO1dA3EL+ctpVX0mmyY1eietltPEmwuyk0pjYZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3253
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.70]); Fri, 13 Sep 2019 08:30:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]);
	Fri, 13 Sep 2019 08:30:51 +0000 (UTC) for IP:'15.124.2.86'
	DOMAIN:'m4a0040g.houston.softwaregrp.com'
	HELO:'m4a0040g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.86
	m4a0040g.houston.softwaregrp.com 15.124.2.86
	m4a0040g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.70
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x8D8UsWL009972
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 4/4] libmultipath: fix mpcontext
	initialization
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Fri, 13 Sep 2019 08:33:37 +0000 (UTC)

On Tue, 2019-09-10 at 17:39 -0500, Benjamin Marzinski wrote:
> If a path is discovered before there is a multipath device for it to
> belong to, the checker will not have its mpcontext initialized, even
> if
> that path later belongs to a multipath device. A checker's mpcontext
> is
> only set when the checker is selected, and is set to NULL if there is
> no
> multipath device associated with the path. This only impacts the emc
> checker. However, it makes the emc checker unable to determine if a
> passive path is connected to an inactive snapshot or not.
> 
> This can be solved by adding a new checker class function, mp_init().
> This is called when the checker is first initialized, and whenever
> the
> checker is called, if the checker's mpcontext hasn't been
> initialized.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/checkers.c              | 29
> ++++++++++++++++++++++++++--
>  libmultipath/checkers.h              |  1 +
>  libmultipath/checkers/cciss_tur.c    |  5 +++++
>  libmultipath/checkers/directio.c     |  5 +++++
>  libmultipath/checkers/emc_clariion.c |  7 +++++++
>  libmultipath/checkers/hp_sw.c        |  5 +++++
>  libmultipath/checkers/rdac.c         |  5 +++++
>  libmultipath/checkers/readsector0.c  |  5 +++++
>  libmultipath/checkers/tur.c          |  5 +++++
>  libmultipath/discovery.c             |  2 ++
>  10 files changed, 67 insertions(+), 2 deletions(-)
> 

I see the problem and agree the solution is correct. But I'd prefer if
the mp_init() method was optional and, if not defined in the
libcheckX.so, would simply be set to NULL. So you wouldn't need to
define empty methods for all checkers except emc. 

checker_mp_init() checks for mp_init() being non-NULL anyway.

Thanks,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
