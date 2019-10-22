Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3463AE0D5D
	for <lists+dm-devel@lfdr.de>; Tue, 22 Oct 2019 22:37:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571776626;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jqjEeiFv3HwHOKiYsi63hs8d3cCJEkEmEjG8fH38Ysw=;
	b=faSBu6YPD6uHE1aCktlX5fl1ASr8cxeYsiCIB0qzEYel5Bu6YI0TzcudeJjuM/uJU54+Ij
	T9EroqgNQ9g9zRxK4mc/594zfUtVk0IC2zGvIH2t4QZ7yCv9PoSaIZfoRIX5vOw9vN3IyX
	PYZ608sv1CSfiaWbVCL8yn0YsIfOehE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-Pku9nQOoPjGAo8GrVZWVJg-1; Tue, 22 Oct 2019 16:37:04 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6E79107AD31;
	Tue, 22 Oct 2019 20:36:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 773AD1001B22;
	Tue, 22 Oct 2019 20:36:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ACDE84EE68;
	Tue, 22 Oct 2019 20:36:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9MKaTPu023245 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 22 Oct 2019 16:36:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1CC06614DE; Tue, 22 Oct 2019 20:36:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B25E60619;
	Tue, 22 Oct 2019 20:36:26 +0000 (UTC)
Received: from m9a0001g.houston.softwaregrp.com
	(m9a0001g.houston.softwaregrp.com [15.124.64.66])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1ABC3078479;
	Tue, 22 Oct 2019 20:36:09 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0001g.houston.softwaregrp.com WITH ESMTP; 
	Tue, 22 Oct 2019 20:35:43 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Tue, 22 Oct 2019 20:34:29 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.12) by
	M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Tue, 22 Oct 2019 20:34:29 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3336.namprd18.prod.outlook.com (52.132.231.211) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2367.24; Tue, 22 Oct 2019 20:34:22 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.028;
	Tue, 22 Oct 2019 20:34:22 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>, "bvanassche@acm.org"
	<bvanassche@acm.org>, "christophe.varoqui@opensvc.com"
	<christophe.varoqui@opensvc.com>
Thread-Topic: [dm-devel] [PATCH 45/72] libmultipath: fix -Wsign-compare
	warnings with snprintf()
Thread-Index: AQHVgUP/vRjgspJFLEGusG/rLD5KFg==
Date: Tue, 22 Oct 2019 20:34:21 +0000
Message-ID: <690ab1be1dc189c6efebf5fb953f31f9f0341286.camel@suse.com>
References: <20191012212703.12989-1-martin.wilck@suse.com>
	<20191012212703.12989-46-martin.wilck@suse.com>
	<34e6fc87-10f6-efd7-c8df-710e56cc1956@acm.org>
	<f895f01df7c429abf4a32a395764513c92ecc3af.camel@suse.com>
	<42e85b61-3f38-af4e-a485-1ba230506d0f@acm.org>
In-Reply-To: <42e85b61-3f38-af4e-a485-1ba230506d0f@acm.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [90.186.0.223]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d999414b-cd0f-4a3d-3a7d-08d7572f38d9
x-ms-traffictypediagnostic: CH2PR18MB3336:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CH2PR18MB3336BD62C9896C64EB176A44FC680@CH2PR18MB3336.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39860400002)(396003)(376002)(136003)(366004)(346002)(52314003)(189003)(199004)(25786009)(36756003)(316002)(2906002)(110136005)(4001150100001)(256004)(66066001)(71200400001)(71190400001)(6246003)(76176011)(2501003)(6116002)(26005)(99286004)(186003)(6512007)(4326008)(118296001)(966005)(102836004)(7736002)(6436002)(305945005)(6486002)(229853002)(6506007)(6306002)(3846002)(14454004)(53546011)(2616005)(486006)(476003)(11346002)(66446008)(91956017)(2201001)(8936002)(478600001)(76116006)(446003)(64756008)(81166006)(66476007)(66556008)(86362001)(81156014)(8676002)(5660300002)(66946007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3336;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jdnm+3OR3l0k5jsB+1M7V52Zgpm6bC35Phuf1WsSnsBbdCOD3bVaJd89bpfHqHiLdxkt8MjnsE0vN1RoiA/QoN5ipXY3SewBDMcSY7tsCwpj2v3Gnc5xZROE2fk58KpTvemy0ctXIfBXe3Z/GHe6WW1TagxL/rcPr0jatMqY078k4xZb8NI3cah9x72fWwSSMJ1/qA1sdy62Fc4q6fn/74p+sMf7hP3+BOy/5OVtnrs6ZO5Yrh8pQe5HvUH0liC8+AK9jlcgpYbmAO97GcyuxEBFdrLNiTEOImMdEPMMf4EnDdlKgDDt4regi+maAU3XwP/fIGuQNJJdiQf5wgQ26rhRI+K4ogxAmtx6slemel4OiXdt22KCnwtDSo18RQiktN/REM0WkgqMN8W3UqtpzK6gmEwuo6LjsvgTVDKqUbv8gO9gjUWNn1RfX3lq5rhyp7wUR+CbBpm+UOtT6+skz+WayN6/1OVwIfqjX4KpjdA=
x-ms-exchange-transport-forked: True
Content-ID: <D189813CC7E6714DBF77E8B71FEA1A9F@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d999414b-cd0f-4a3d-3a7d-08d7572f38d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 20:34:22.2455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OUle6VGHfOSob/JvBwcfzswAvBT0+Ejxl2FfUiQ5O00ICunQQXhxpapD46fwu773zAJnhTXjvF5oF7rfjHXLnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3336
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.41]); Tue, 22 Oct 2019 20:36:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Tue, 22 Oct 2019 20:36:25 +0000 (UTC) for IP:'15.124.64.66'
	DOMAIN:'m9a0001g.houston.softwaregrp.com'
	HELO:'m9a0001g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.66
	m9a0001g.houston.softwaregrp.com 15.124.64.66
	m9a0001g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9MKaTPu023245
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Pku9nQOoPjGAo8GrVZWVJg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-10-22 at 09:47 -0700, Bart Van Assche wrote:
> On 2019-10-22 09:07, Martin Wilck wrote:
> >=20
> > In this particular case, we're dealing with a historically-caused
> > property of snprintf(), as you are probably aware=20
> > (
> > https://stackoverflow.com/questions/45740276/why-does-printf-return-an-=
int-instead-of-a-size-t-in-c
> > ),
> > so I'd argue the ugliness is forced upon us, sort of.
> >=20
> > We can hide the ugliness in a macro if you prefer. Actually, we
> > have
> > safe_snprintf() already. We just need to use it in all places where
> > this kind of comparison is made. Would that be acceptable to you?
>=20
> Hi Martin,
>=20
> Have you considered to use asprintf() instead of snprintf() and a
> check
> whether the output buffer overflows? I think the former is a more
> elegant solution.

Most uses of snprintf() are in libmultipath printing code, where items
are printed sequentially into a big buffer, advancing the buffer
pointer on the way. asprintf() doesn't match that use case well,
AFAICS. But in some other places, switching to asprintf would certainly
make sense. Anyway, I'd like to do that in a separate patch set if you
don't mind; this one is big enough already.

Thanks,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

