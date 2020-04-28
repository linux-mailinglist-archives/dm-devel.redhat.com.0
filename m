Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 76ED71BCF1C
	for <lists+dm-devel@lfdr.de>; Tue, 28 Apr 2020 23:51:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588110665;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bkCB+VpTRLvDShTCLARu7NVNRKHQVsmpR4sZRuBt8Vk=;
	b=UqTQkESYQPxKKmWM2lMH0Dc8vM2VhTRrLGH42xe9viHgpESf4xCRMEnbcGPA3/tf8jqKo+
	6CLQER0fSu4lZEEJzm1EUoNxhe+VebzGH8JKuzssWxmjEbaFCR55SUBHwmcmdxeCyw95uS
	bpJKkg8p77ssXvS6M6Dy7Q1SJ0pi/yk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-mEPa75BBNfqeqCXqgtQ4rQ-1; Tue, 28 Apr 2020 17:51:02 -0400
X-MC-Unique: mEPa75BBNfqeqCXqgtQ4rQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27F2A8014D5;
	Tue, 28 Apr 2020 21:50:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D55F19C4F;
	Tue, 28 Apr 2020 21:50:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AFB001809542;
	Tue, 28 Apr 2020 21:50:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03SLokX8020017 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Apr 2020 17:50:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 968D72166B28; Tue, 28 Apr 2020 21:50:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 914082166BA3
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 21:50:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A28A80CDAF
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 21:50:44 +0000 (UTC)
Received: from m9a0013g.houston.softwaregrp.com
	(m9a0013g.houston.softwaregrp.com [15.124.64.91]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-217-2wUFwVI_NjqJPN7JMS9WOQ-1;
	Tue, 28 Apr 2020 17:50:41 -0400
X-MC-Unique: 2wUFwVI_NjqJPN7JMS9WOQ-1
Received: FROM m9a0013g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0013g.houston.softwaregrp.com WITH ESMTP; 
	Tue, 28 Apr 2020 21:49:54 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Tue, 28 Apr 2020 21:48:04 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Tue, 28 Apr 2020 21:48:04 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com (2603:10b6:4:62::23)
	by DM5PR1801MB1865.namprd18.prod.outlook.com (2603:10b6:4:69::13)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22;
	Tue, 28 Apr 2020 21:48:03 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710]) by
	DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710%7]) with mapi id 15.20.2937.023;
	Tue, 28 Apr 2020 21:48:03 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [dm-devel] [RFC PATCH v2 0/3] multipath: new path validation
	library
Thread-Index: AQHWCYRGx1uZ32gP+k6Mqxr88CI7e6iPOlqA
Date: Tue, 28 Apr 2020 21:48:03 +0000
Message-ID: <d5ed73175bd95df6dd4086fc42d0a8536eae92bc.camel@suse.com>
References: <1585896641-22896-1-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1585896641-22896-1-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.1
x-originating-ip: [92.211.129.134]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6eac1ebe-aba9-4d68-032c-08d7ebbdd40b
x-ms-traffictypediagnostic: DM5PR1801MB1865:
x-microsoft-antispam-prvs: <DM5PR1801MB1865CF5364D5996F6D75439CFCAC0@DM5PR1801MB1865.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0387D64A71
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DM5PR1801MB1883.namprd18.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(478600001)(26005)(66476007)(6512007)(66556008)(66946007)(64756008)(4326008)(966005)(86362001)(66574012)(66446008)(2616005)(2906002)(76116006)(91956017)(8936002)(110136005)(8676002)(36756003)(186003)(6506007)(5660300002)(6486002)(71200400001)(316002);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 84KcA7dHZivuPF4rXCqCV9OcAUghbNTkbcXIUsROvk+jLiDJmPdUPKaMfRiuMh2uxmNb92BTiAhOSg3ct1Xc9NVPGJmEEHAHyLcOTeGukrs5Phu/ddV3TpyEPkz5BsDeCMr9Fjy62mEyiyoY8PKXuzpNraDzSip3aeGDVBs8bM4i0eC6tSKkL3lMRwwupXAWBtNNuEXD1oJLZruft6bf+XTnBkpFya71CSW27EIeEKjzQhOAYV+PA2lSScD5j4nr3CRc4cg/lUi4j4JbIlA57xxQuuy+WQBF54VDO00AUVgeGC7OVYapfh0tfpYYk1Ve+2dI9in9pydpuH72uO/7njfY/SycOtZ2bK2fimxqr0fM27TAizdIebY3WY1pV+2lOZO3yhE0obnyudbcXaIH/ngdODeysjfBO9pX+sYnWEwnRiWIc+4Krmk/KWQ4zu9P9YPzmbEjbw3oJEjcMayscM75uI2VRPxvkML+FZJK/8tREw+8CBTZYLnfV5FII7BTWVRe0zy9e9vvfLcEum4PUA==
x-ms-exchange-antispam-messagedata: FpUsGSmIPMWm60arxhMgQqAvA5fh3R7oqOE2ehBkULKciKXM8TkCeras47XPuA/aRZTIzH1RxAhCi5l/dKxdJQhIjXlGp7fPbqUVhLByxJa42cWBW/mfP409w1HKSbuoLZ6ezoxPFSaY7CZv5io0D/8QYelrLyeTfaR/wv6ttYr7Ad/ujNHD5ZFI3AtF4TadcV3OAGdyUHC0RXjhzQKhoonsz7KPUdEFCW1+RzFmI5mPplOZxSiNfOTQgpL6GbvEbCqzoBANy6/zCA1ccSDbZdy7sgI7+va7XpN1qfI2P+CbrAj+77GuJxXNRao7JeTIIeGpGcBdakLvfnRvsJU6Ywib0ttNnp2qHI9tUsSBc+ZzuStKffb1BLnyqeF4Wg9ViR/8xXXDcFGPdq7dEjfUHriQNphFppZsLMW5GqiMLJS2PQBoP1oez54XaIkeRIUIFJHD3xlWAtuT/EJNq3PeLcBqPwEdJLlHh+mHtagFKx9nIGqnzyURDP7/Qo9dWoQN39IibSFmsSZSqxCmKoAOKj9f2BSdx2wFooB6xx0d8wLGRjBiMFQpSPxBrXr13ut2G+10L/l8prGCdLm8FgODaXOs8thbhh9/TdLjWd9v7mBW2KfWt2xirZ2P2nTrjLep1GapaY/oyFyKKkzu7kcmevWMx1zXLBAaOsqD/R5umbysGMsw15kgLLWDBrlH+MnVLEsQkNgmz3yGRDnwxixz49CuOBpM+Q1ae564pK5m5WwH/R2Itqu5W2ZJLko9LdPMm8myZ9vmYYf51Fqf8gaA8BuKuFtgOEVivX0DhQhRrGU=
x-ms-exchange-transport-forked: True
Content-ID: <F8B0EF776909AE44812AB61EFD60F7A5@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eac1ebe-aba9-4d68-032c-08d7ebbdd40b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2020 21:48:03.3133 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vvfZICGKH7Q/3Ay1Rp1X+rtA1uF75TEf3h9d7dRHiuh/QxkPEFljy7TflTSczJZvmAf6lcTQd2zt6f3z9oQfhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1801MB1865
X-OriginatorOrg: suse.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03SLokX8020017
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH v2 0/3] multipath: new path validation
 library
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-04-03 at 01:50 -0500, Benjamin Marzinski wrote:
> This patchset is for a new library that programs can use to determine
> if a device belongs to multipath.  The primary user that this is
> intended for is SID, the Storage Instantiation Daemon
>=20
> https://github.com/sid-project
>=20
> Right now, this doesn't change our existing code to determine path
> ownership, and it doesn't do the exact same steps, although it is
> very
> close.  In the future, it would be possible to pull most of this code
> entirely into libmultipath, except for some wrappers, and use it for
> both methods.

I'd like to see how that's done. To reach that goal, we'd have to
eliminate the differences in the function's logic this way or that way.
Readability-wise, your new code is way better.

>   Obviously, this still needs man pages, and there are some
> helper functions for things like controlling multipath's logging that
> are missing, but I want to see if anyone has strong feelings about
> what
> this looks like.

As you're asking for it, I don't like the static linking linking of
libmultipath, which IMO unnecessarily complicates the multipath-tools
build. If this is what you need, why don't you simply pull multipath-
tools as-is into the SID source tree, e.g. with "git submodule", and
rebuild it there to you suit your needs? It's rather unlikely that
there will be other users of libmpathvalid besides SID any time time
soon.=20

To put it more provocatively: I can see the benefit of this patch set
for SID, but what's the benefit for multipath-tools?

OTOH, multipath-tools *would* benefit if we used this as an incentive
to cleanup our libraries, first by cleaning up the "multipath -u"
logic, and later perhaps even so that SID (and other applications)
could simply link with -lmultipath without polluting its namespace in
inacceptible ways.

> I also have two more changes that I want to make to the multipath
> code,
> to make path validation do less unnecessary work, which aren't in
> this
> patchset.
>=20
> 1. I want to remove the lock file from the failed wwids code. I don't
> see how it actually stops any races, and it means that simply reading
> a file, can trigger delays and writes (albeit to a memory base fs).

The main idea of the "locking" was that I wanted to create the actual
failed_wwids file atomically, using link(2). open_file() is
unfortunately not atomical at all. If we look into these issues, we
should put open_file() on the table, IMO.

Rather than creating that "lock" file and linking to it, we might=20
create "/dev/shm/multipath/failed_wwids/$PID" (just as a 0-byte file,
not with open_file()) and rename it to $WWID atomically.

Moreover, it's possible (though not common) that multipath and
multipathd simultaneously try to set up a certain map. In that case,
one process would likely get an error. But you are right, the actual
race isn't prevented; for that we'd need to handle EEXIST in
dm_addmap_create().=20

> 2. I want to deprecate getuid_callout.  Once this is gone, you will
> be
> able to call pathinfo and get a path's WWID, without ever needing to
> open the path.

It's already been deprecated since 2013. Unfortunately I used it for
the hwtable test because it takes a free-form string argument; so if we
rip it out, we need to rewrite that test.

Best Regards,
Martin


>=20
> changes in v2:
> 0002: make sysfs_is_multipathed only read the sysfs file once, as
> suggested by Martin.
>=20
> 0003: dm_is_mpath_uuid() is now dm_map_present_by_uuid(). The library
> includes a new function mpath_get_mode(), to get the find_multipaths
> mode, and the modes now include MPATH_FIND. mpath_is_path() now
> accepts
> an array of mpath_infos, which the caller can use to pass the
> previous
> path wwids. This allows mpath_is_path() to return MPATH_IS_VALID for
> paths if there already is another path with that wwid.
>=20
> However, mpath_is_path() still treats MPATH_SMART and MPATH_FIND the
> same.  I tried to make them work differently, but I realized that I
> need
> a way to signal that the MPATH_FIND path didn't fail because it was
> blacklisted, but instead because it needed another paths. Otherwise
> the
> caller won't know that it needs to save the wwid to check when later
> paths appear. This is exactly what MPATH_IS_MAYBE_VALID means. In the
> multipath -u code, the only difference between the find_multipaths
> "on"
> and "smart" case is what to do when a path that needs another path
> appears for the first time.  Dealing with this difference is the
> responsiblity of the caller of the mpathvalid library.
> mpath_get_mode(),
> will let it know what the configured find_multipaths mode is.
>=20
> Benjamin Marzinski (3):
>   libmultipath: make libmp_dm_init optional
>   libmultipath: make sysfs_is_multipathed able to return wwid
>   multipath: add libmpathvalid library
>=20
>  Makefile                            |   1 +
>  Makefile.inc                        |   1 +
>  libmpathvalid/Makefile              |  38 ++++++
>  libmpathvalid/libmpathvalid.version |   7 +
>  libmpathvalid/mpath_valid.c         | 198
> ++++++++++++++++++++++++++++
>  libmpathvalid/mpath_valid.h         |  56 ++++++++
>  libmultipath/Makefile               |   1 +
>  libmultipath/devmapper.c            |  66 +++++++++-
>  libmultipath/devmapper.h            |   4 +-
>  libmultipath/sysfs.c                |  24 +++-
>  libmultipath/sysfs.h                |   2 +-
>  multipath/main.c                    |   7 +-
>  12 files changed, 391 insertions(+), 14 deletions(-)
>  create mode 100644 libmpathvalid/Makefile
>  create mode 100644 libmpathvalid/libmpathvalid.version
>  create mode 100644 libmpathvalid/mpath_valid.c
>  create mode 100644 libmpathvalid/mpath_valid.h
>=20

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

