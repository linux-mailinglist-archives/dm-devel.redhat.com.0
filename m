Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id B0E5B192C4C
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 16:24:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585149888;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=w1Hal969nbPjsObAAnecnKjAs91VjEX20MXty6hXk2M=;
	b=Jb3t1nf056OZOGeYD2lXgbDrLy0HDLXw9frNfoqWM37F7qaY5mLByDxPvJutXdyLAFFbVW
	MBvWEW5ck5cg7sdcxh1kK7wvP+DZn8sYYiGIACxLuBuBhRwY8IN9ePt3lkPsJAJbIPK97M
	CwP330ckgIFIMFxybhF/o+xxdcU0rMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-Ftvha2DONkijwluFRpoBOQ-1; Wed, 25 Mar 2020 11:24:46 -0400
X-MC-Unique: Ftvha2DONkijwluFRpoBOQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 686F3107ACC4;
	Wed, 25 Mar 2020 15:24:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60D06BBBDD;
	Wed, 25 Mar 2020 15:24:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C220C182B00E;
	Wed, 25 Mar 2020 15:24:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02PFO0Jp012052 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 11:24:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 107EA2022EA5; Wed, 25 Mar 2020 15:24:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BC3A20230A9
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 15:23:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B2EF80029A
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 15:23:57 +0000 (UTC)
Received: from m9a0014g.houston.softwaregrp.com
	(m9a0014g.houston.softwaregrp.com [15.124.64.90]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-236-S5zLGBfGOWeKoTmA94LnpA-1;
	Wed, 25 Mar 2020 11:23:55 -0400
X-MC-Unique: S5zLGBfGOWeKoTmA94LnpA-1
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0014g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 25 Mar 2020 15:22:36 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 25 Mar 2020 15:16:51 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.11) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 25 Mar 2020 15:16:51 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (2603:10b6:3:14a::16)
	by DM5PR18MB0954.namprd18.prod.outlook.com (2603:10b6:3:2f::13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20;
	Wed, 25 Mar 2020 15:16:50 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1ec:4fbe:928d:8675]) by
	DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1ec:4fbe:928d:8675%9]) with mapi id 15.20.2856.019;
	Wed, 25 Mar 2020 15:16:50 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 2/3] libmutipath: don't close fd on dm_lib_release
Thread-Index: AQHWAiBot6EMLtzokkChtQqIN4eLNqhZbJCA
Date: Wed, 25 Mar 2020 15:16:50 +0000
Message-ID: <ebfcb22b005314635b77e4820e205971d708d07d.camel@suse.com>
References: <1585083834-14237-1-git-send-email-bmarzins@redhat.com>
	<1585083834-14237-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1585083834-14237-2-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4
x-originating-ip: [92.211.129.134]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02fa48f0-ce81-4635-58c5-08d7d0cf8ae8
x-ms-traffictypediagnostic: DM5PR18MB0954:
x-microsoft-antispam-prvs: <DM5PR18MB0954B0C072AEB5574FBFB3DCFCCE0@DM5PR18MB0954.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(71200400001)(316002)(36756003)(5660300002)(110136005)(6512007)(64756008)(66476007)(6486002)(66446008)(76116006)(91956017)(66556008)(66946007)(2906002)(4326008)(81166006)(8936002)(8676002)(2616005)(26005)(478600001)(6506007)(186003)(66574012)(86362001)(81156014);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB0954;
	H:DM5PR18MB1355.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rH4ul34b3s/rM7a8SLyFWnWIZX5T9lOtyxfghDqpXfXw9+WNLsHVzmLZ5o+IFpCdNmig0n894ma125ozPKpMdZSiJh8usT7O0KM4ijqJ1yB4iGHeonGcbLyckEIs1boBVh6FbZDCYyM4HtG4YceG/tDXgAwKkSGjFfKZCI5Rjrz/qU9vQYpRFB8Db5hKtnWmg71jyWcA7VhVL9Ri27izrMzucINolnicw7/Es0gkt5QDZSxQ3zh47HuXB3QtuS7BCNUc77KIP0jdK4MbYqp8eKqea9zI9w9Mj7oYcNMSwgqRT43LgZBtZltI/5kUSb1DgNRz3VGtKhWusx2bvklz8kILNFwer8+8IvpLq3z+Jl0e96umPMZdYuw7tdWLmo6cSe6VaSo8470pByMY0FRchKy33m2Rc/CE6Xg1V3PhTX3XpFoakcmzarr7jS8RUOSv
x-ms-exchange-antispam-messagedata: iC5DhTqSUFbdOdkc5EB3spuUcfIMeZeNADZW6Os+tnuj1ZFsWcgBDqNSEsMcEN/DkfjRWX2VOq8qv0dzXfaKQPtSXtr4ncPG5pymVifXdwSu3Jn/U/qap/ssWYJ8jJOCj+wF/qUa8RcExTObKmP33w==
x-ms-exchange-transport-forked: True
Content-ID: <80FDBD23751841418EAA875693D719CA@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 02fa48f0-ce81-4635-58c5-08d7d0cf8ae8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 15:16:50.2385 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7zg2FrBHEQ9t7xrQtK1hPBI7Xj+B/ITx7bxdAw67ymzvP0h3J51YEULD2WIE0+gRDYabTO6IgDEYtr+KuyeBOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB0954
X-OriginatorOrg: suse.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02PFO0Jp012052
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/3] libmutipath: don't close fd on
	dm_lib_release
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-03-24 at 16:03 -0500, Benjamin Marzinski wrote:
> If dm_hold_control_open() isn't set, when dm_lib_release() is called,
> it
> will close the control fd. The control fd will get re-opened on the
> next
> dm_task_run() call, but if there is a dm_task_run() call already
> in progress in another thread, it can fail. Since many of the
> device-mapper callouts happen with the vecs lock held, this wasn't
> too
> noticeable, but there is code that calls dm_task_run() without the
> vecs lock held, notably the dmevent waiter code.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/devmapper.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
> index bed8ddc6..d96472fe 100644
> --- a/libmultipath/devmapper.c
> +++ b/libmultipath/devmapper.c
> @@ -254,6 +254,7 @@ void libmp_dm_init(void)
>  =09memcpy(conf->version, version, sizeof(version));
>  =09put_multipath_config(conf);
>  =09dm_init(verbosity);
> +=09dm_hold_control_dev(1);
>  =09dm_udev_set_sync_support(libmp_dm_udev_sync);
>  }

AFAICS, this function has been in libdm since 1.02.111. We support
1.02.89 (if all features enabled, otherwise even older). Perhaps we
should make this function call conditional on the libdm verson?

But perhaps more importantly, why do we still need to call
dm_lib_release()? AFAICS it's only needed for systems that have no udev
support for creating device nodes (to call update_devs() via
dm_lib_release()), and we don't support that anymore anyway, do we?=20

Since 26c4bb0, we're always setting the
DM_UDEV_DISABLE_LIBRARY_FALLBACK flag, and the cookie, too
(we aren't setting it for DM_DEVICE_RELOAD, but it isn't needed for
that, either, since no device nodes need to be created or removed); so
dm_lib_release() should really have no effect.

Regards
Martin

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

