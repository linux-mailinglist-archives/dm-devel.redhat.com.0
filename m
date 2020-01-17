Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9D635140FB2
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jan 2020 18:15:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579281354;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JqbYeJYivcOUNRzXrvBUzBnAMexhOqMsmACdLGnrnYk=;
	b=b0MvG0g9YcoCRq+i9UTt+9/lGiPGLJ0+fDwNxehW/R3RY+9L97TWEJHIEeFBVHtEBTm0Op
	plHuWqZkivtiQkBNFBrK3TSLDgJR8Dc+NxZQm9VW68VUrwB8kYDP2hS7lEDo/oKeAvcU+j
	87hqV79vdHzkHu+wKh6n2YtfH7S3Guc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-hgBwD0nxMcmx2lcgVrJsSg-1; Fri, 17 Jan 2020 12:15:52 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92A2A108597A;
	Fri, 17 Jan 2020 17:15:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 084C381212;
	Fri, 17 Jan 2020 17:15:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE5CC18089CD;
	Fri, 17 Jan 2020 17:15:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00HHEqEJ023676 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 Jan 2020 12:14:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C8F8D202A941; Fri, 17 Jan 2020 17:14:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C32C1202A940
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 17:14:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D6E281C892
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 17:14:50 +0000 (UTC)
Received: from m4a0072g.houston.softwaregrp.com
	(m4a0072g.houston.softwaregrp.com [15.124.2.130]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-148-lvqmrobeNyWAx8h9DiTFwQ-1;
	Fri, 17 Jan 2020 12:14:48 -0500
Received: FROM m4a0072g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0072g.houston.softwaregrp.com WITH ESMTP; 
	Fri, 17 Jan 2020 17:13:28 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Fri, 17 Jan 2020 17:02:29 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.8.12) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Fri, 17 Jan 2020 17:02:29 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (10.175.223.16) by
	DM5PR18MB1625.namprd18.prod.outlook.com (10.175.225.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2644.20; Fri, 17 Jan 2020 17:02:28 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::946a:bcb6:670b:8e86]) by
	DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::946a:bcb6:670b:8e86%12]) with mapi id 15.20.2644.015;
	Fri, 17 Jan 2020 17:02:28 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 10/15] libmultipath: change how the checker async is set
Thread-Index: AQHVzVflDGS9aKaEdU2ac8v/kfTy0w==
Date: Fri, 17 Jan 2020 17:02:27 +0000
Message-ID: <6f1d40b5dcaba49653c3221304248b13fccafd0d.camel@suse.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-11-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1579227500-17196-11-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2.203.211.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6352cd90-38e7-49f5-7e8c-08d79b6f085e
x-ms-traffictypediagnostic: DM5PR18MB1625:
x-microsoft-antispam-prvs: <DM5PR18MB16254289D68120836B885246FC310@DM5PR18MB1625.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0285201563
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(199004)(189003)(4326008)(478600001)(316002)(110136005)(81166006)(4744005)(8676002)(36756003)(81156014)(8936002)(5660300002)(6512007)(71200400001)(91956017)(66556008)(6506007)(6486002)(64756008)(76116006)(66946007)(186003)(26005)(86362001)(66476007)(2616005)(66446008)(2906002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1625;
	H:DM5PR18MB1355.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jEN/XshuJ75s8N9G4+zbCk2Z3HmfI+QeSARt8Kx4Y/QFYKck1jwuBUAxrhakF1gMjGExQUS+Vc13ZaxhT0wiojRSKtUMnxLl1NGAiHYdPeliAvtG8kGki0qnCNcyWRsqS56+sXNBXrpZMoa1X+qmEx4+ITIB9QyzcI5oYUvLF6HLa0hpQOPgF6WkmVsouB0K/mzEM/RjNVH0DGBijfSySDEwUlWhDJwu2ibE5pmWDxjNSEoVnY68L2iNdq5St0S0xKPOIhQjMifnxQ3Bkkw3eu2eIcIcAI1+ZaiW6GuKY3sjSYi0UzbxZM4lKnthhD5Bn9Qd291J6lcbhsVsIJfz36oBhlQO+gWSrBQg1sxh/miDWgrH1SS1Mj/qwYdn7bvlPd9IqUXHaUU3hpT3liDBVXAHm3a+e5GzqWtyHzMPdxVBC6kqAGhWHFHXtTuvxAKI
x-ms-exchange-transport-forked: True
Content-ID: <58455056AC826649A7D2B75E2A775A68@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6352cd90-38e7-49f5-7e8c-08d79b6f085e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2020 17:02:27.8770 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kit1Egu+jpRL5K1Zfo/xPqb8iuE+e+noF1g/jAgasXqediOLN2RAz/gPm8fbAw8YzlwyzK13VmAeMQE1ztrbqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1625
X-OriginatorOrg: suse.com
X-MC-Unique: lvqmrobeNyWAx8h9DiTFwQ-1
X-MC-Unique: hgBwD0nxMcmx2lcgVrJsSg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00HHEqEJ023676
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 10/15] libmultipath: change how the checker
	async is set
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-01-16 at 20:18 -0600, Benjamin Marzinski wrote:
> The way that the checkers async mode worked in multipathd didn't make
> much sense. When multipathd starts up, all checker classes are in the
> sync mode, and any pathinfo() calls on devices would run the checker
> in
> sync mode. However, the First time a checker class was used in
> checkerloop, it would set that checker class to async (assuming
> force_sync wasn't set).  After that, no matter when a checker from
> that
> class was called, it would always run in async mode.  Multipathd
> doesn't
> need to run checkers in sync mode at all, so don't.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmpathpersist/mpath_persist.c |  2 +-
>  libmultipath/discovery.c        | 10 ++++------
>  multipath/main.c                |  1 +
>  3 files changed, 6 insertions(+), 7 deletions(-)
> 

Reviewed-by: Martin Wilck <mwilck@suse.com>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

