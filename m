Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 29080E0872
	for <lists+dm-devel@lfdr.de>; Tue, 22 Oct 2019 18:14:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571760865;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=B9i3wy1PCxQw0YGHqGN2sizLAefN0v736nzz5N9287M=;
	b=g2Bg10oS8a6eqeDK9mttZyEQRGgTNsv7dxWgsDgOEl+2UWhWbDA71QgLoAmQuuq63sNst3
	3DbFz1JRCFfvvM20AR6TAnOqRpSg3EpLGzZYhQhcjV5Jl3sSG59yar5rE01Fhlsd/fJtWn
	2zWfueaNmGQt3jKk1tRO/ZZSHA/dP9s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-IXf4pHERPUicNjcAQp2NDA-1; Tue, 22 Oct 2019 12:14:23 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6995780183D;
	Tue, 22 Oct 2019 16:14:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5517060559;
	Tue, 22 Oct 2019 16:14:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B79404EE68;
	Tue, 22 Oct 2019 16:14:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9MGDrZE012349 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 22 Oct 2019 12:13:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9F1016012D; Tue, 22 Oct 2019 16:13:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36F4D6012E;
	Tue, 22 Oct 2019 16:13:48 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 200CF4E926;
	Tue, 22 Oct 2019 16:13:30 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Tue, 22 Oct 2019 16:13:05 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Tue, 22 Oct 2019 16:07:13 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Tue, 22 Oct 2019 16:07:13 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3319.namprd18.prod.outlook.com (52.132.245.20) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.16; Tue, 22 Oct 2019 16:07:12 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.028;
	Tue, 22 Oct 2019 16:07:12 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>, "bvanassche@acm.org"
	<bvanassche@acm.org>, "christophe.varoqui@opensvc.com"
	<christophe.varoqui@opensvc.com>
Thread-Topic: [dm-devel] [PATCH 45/72] libmultipath: fix -Wsign-compare
	warnings with snprintf()
Thread-Index: AQHVgUP/vRjgspJFLEGusG/rLD5KFg==
Date: Tue, 22 Oct 2019 16:07:12 +0000
Message-ID: <f895f01df7c429abf4a32a395764513c92ecc3af.camel@suse.com>
References: <20191012212703.12989-1-martin.wilck@suse.com>
	<20191012212703.12989-46-martin.wilck@suse.com>
	<34e6fc87-10f6-efd7-c8df-710e56cc1956@acm.org>
In-Reply-To: <34e6fc87-10f6-efd7-c8df-710e56cc1956@acm.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [90.186.0.223]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 747b159e-231d-4408-7307-08d75709e634
x-ms-traffictypediagnostic: CH2PR18MB3319:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CH2PR18MB3319F200B113CB2EEB81002CFC680@CH2PR18MB3319.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(189003)(199004)(6436002)(256004)(476003)(14444005)(71200400001)(71190400001)(4001150100001)(2616005)(486006)(66446008)(64756008)(76116006)(66946007)(91956017)(446003)(11346002)(478600001)(66066001)(25786009)(229853002)(305945005)(7736002)(6512007)(66476007)(6306002)(6486002)(2501003)(99286004)(66556008)(2906002)(36756003)(8676002)(81156014)(81166006)(6116002)(3846002)(102836004)(118296001)(2201001)(316002)(4326008)(8936002)(110136005)(5660300002)(86362001)(6506007)(26005)(76176011)(14454004)(186003)(53546011)(6246003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3319;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4qErtas98s1CaGrFuT3/QqB1ts28LTxcJJ9I4JfQ0lhmwxEe+vqLfKdyCnmnMY3IZM8yGejnKEVFsOI9RJWjx0hL5pYwfOVjF+uNxKkSTkE1Jsxx/dOVNtB5g2hukpAUHF7MdGKdLWQ2vRWXjlQBlFrKdhvT51z7qZ9YgP1/myb0Z+4wyagzdgITzWBXUJHkSi7WxMFsPKX3kA2f5tm0m95Ad4UGaUQ3TmbFjvI28/Qn/zyTXsXmMKtdQqfwzF5bFVMihRnDtx2C2DnJ+Stmhb/q25C3acz1jxDhO9KrZf8YXsD/LoQaiXgWwXHNxG/dEAF8BCJB7r8Dp924zrhBVOE1zu9ank+qHEInH+EtQSYMmglHz84vAuWE30qRr17u8tAURcqRsg2lM5LDI0ZGP4YAmTTp86RhqILsjiT0WvMFeP+2b+FWZ3v8MiC4xa4No/CXFHutm4E2YXKQ+NqvfHscFEfY+vSCJGPvA6IfRvM=
x-ms-exchange-transport-forked: True
Content-ID: <FF43030E8FDC4D4D92D040C11F44CDD0@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 747b159e-231d-4408-7307-08d75709e634
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 16:07:12.3494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cgj66RWvE6+x1HYqyDD/tojVssjx8YUtBhGGvzOCdirlQh63ZSu5lHWd/KVuIE0joQ0M8t7HG600pumkkNG4wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3319
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.38]); Tue, 22 Oct 2019 16:13:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Tue, 22 Oct 2019 16:13:47 +0000 (UTC) for IP:'15.124.64.67'
	DOMAIN:'m9a0002g.houston.softwaregrp.com'
	HELO:'m9a0002g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.67
	m9a0002g.houston.softwaregrp.com 15.124.64.67
	m9a0002g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9MGDrZE012349
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 45/72] libmultipath: fix -Wsign-compare
 warnings with snprintf()
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: IXf4pHERPUicNjcAQp2NDA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hello Bart,

On Sat, 2019-10-12 at 15:59 -0700, Bart Van Assche wrote:
> On 2019-10-12 14:28, Martin Wilck wrote:
> > -=09if (snprintf(buf, bufsiz, "%s%s%d", mapname, delim, part) >=3D
> > bufsiz)
> > +=09if (snprintf(buf, bufsiz, "%s%s%d", mapname, delim, part)
> > +=09    >=3D (int)bufsiz)
> >  =09=09return 0;
>=20
> Please don't insert casts like this. I think enabling -Wsign-compare
> is
> wrong because it makes the source code ugly.

The casts make it explicit which signedness is intended, which is a
good thing IMO, better than the compiler trying to figure it out
using implicit type conversion. Enabling the warning will help avoid
subtle programming errors in the future, by forcing us to think twice
about signedness. Considering that, isn't this ugliness - which I don't
dispute - a relatively minor issue?

In this particular case, we're dealing with a historically-caused
property of snprintf(), as you are probably aware=20
(https://stackoverflow.com/questions/45740276/why-does-printf-return-an-int=
-instead-of-a-size-t-in-c),
so I'd argue the ugliness is forced upon us, sort of.

We can hide the ugliness in a macro if you prefer. Actually, we have
safe_snprintf() already. We just need to use it in all places where
this kind of comparison is made. Would that be acceptable to you?

Thanks,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

