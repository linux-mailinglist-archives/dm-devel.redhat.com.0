Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 305D0EDA97
	for <lists+dm-devel@lfdr.de>; Mon,  4 Nov 2019 09:31:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572856260;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=q6mWutuXOr+nTNUFiPfdnEbCWT20wQQZtgFDlY/B+Z8=;
	b=B9rLgmzEarw8oJ+6F/zSG6mCCTLPf+61RZeN8oIoQ3ZuowAnsNP/8O71yLb8QWzAP21OKs
	+UTtqubZpozlJfyuZ5iIEY0rZIeOlMHR/1ESvGLlx3OEAeLxTVgAKq8LZR/DHVHTbgv5EB
	kJq8O7AFTY2dAliDZmwhhDT9XmgKuzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-rpr5yLJ9PuGiFCBOLITlbA-1; Mon, 04 Nov 2019 03:30:54 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A965A1800D78;
	Mon,  4 Nov 2019 08:30:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53E9526FAF;
	Mon,  4 Nov 2019 08:30:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD8B318089C8;
	Mon,  4 Nov 2019 08:30:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA48UG8h029267 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 4 Nov 2019 03:30:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E76D81001DD7; Mon,  4 Nov 2019 08:30:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B7ED1001B36;
	Mon,  4 Nov 2019 08:30:14 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BEFD73086243;
	Mon,  4 Nov 2019 08:30:07 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Mon,  4 Nov 2019 08:29:04 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Mon, 4 Nov 2019 08:29:22 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.8.13) by
	M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Mon, 4 Nov 2019 08:29:22 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3206.namprd18.prod.outlook.com (52.132.247.79) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.24; Mon, 4 Nov 2019 08:29:21 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::9917:1509:5d1:6f89]) by CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::9917:1509:5d1:6f89%6]) with mapi id 15.20.2408.024;
	Mon, 4 Nov 2019 08:29:21 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [PATCH 16/72] libmultipath: make path_discovery()
	pthread_cancel()-safe
Thread-Index: AQHVgUPqnzv3jnlGqEilDNHk61rXRA==
Date: Mon, 4 Nov 2019 08:29:21 +0000
Message-ID: <1dafb5da296c6eec383213ec04dcf399fe45c0f6.camel@suse.com>
References: <20191012212703.12989-1-martin.wilck@suse.com>
	<20191012212703.12989-17-martin.wilck@suse.com>
	<20191030145333.GN25414@octiron.msp.redhat.com>
In-Reply-To: <20191030145333.GN25414@octiron.msp.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2.206.153.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18edd756-563a-44ae-d16b-08d7610117a6
x-ms-traffictypediagnostic: CH2PR18MB3206:
x-microsoft-antispam-prvs: <CH2PR18MB3206A3BC7E9D40C5DD90731EFC7F0@CH2PR18MB3206.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0211965D06
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(376002)(39860400002)(346002)(396003)(199004)(189003)(256004)(66066001)(476003)(14454004)(26005)(478600001)(8676002)(81156014)(3846002)(6116002)(99286004)(11346002)(86362001)(446003)(4326008)(229853002)(6512007)(36756003)(2501003)(2616005)(6486002)(5660300002)(118296001)(486006)(6436002)(6916009)(316002)(6506007)(5640700003)(186003)(2906002)(54906003)(1730700003)(81166006)(6246003)(8936002)(71200400001)(71190400001)(305945005)(66446008)(76116006)(64756008)(66476007)(76176011)(66946007)(2351001)(91956017)(4001150100001)(66556008)(25786009)(7736002)(102836004)(14444005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3206;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TQnH351x3OF6ABTPZiIwjiUdlIxJJUvUevkQo/W4pp/vCXzg3V8f38YA4/lVaLoGoXm8a8zcSuXjz6I6e7giuMpBX8ojnEqn1bLK8cyIj0i1RHEVumXxxTF1vjP2u6dqz0PY2W0fWcA/zim6TDVN1daUrBkNLSBzQRSW+VN4hIo6qFp6VCudM3QSe4yH3QUCschJYwGot2i0oriFOC0teZ0OEWxXD8iqShYofv7Gu+Po/XgJSTHsrdbk1hV7a3DrtOI/s/wT/Zozy3bqYjYmrHbQ4Uj0xLvnN3G7nJBFdafjkpp+69jTXPkJWAMaebHbKw+Zl4RyaA25izFU3/hxsZ9uF/4BlcgXmesyq20O3IG88yCRcNTsL39aotOfatDC8ytZajtmq0nVfnsx7MscEW/iqTIIHxldwibachtBdJrflvSTXtk7kGL+NyYMq2uE
x-ms-exchange-transport-forked: True
Content-ID: <E780AEFB409EB5488FA4192F92BFD6F3@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 18edd756-563a-44ae-d16b-08d7610117a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2019 08:29:21.2896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dbe1d1vRoMnXmRRMMwpHtjOOexL/txcSyre0cXh97GhiYUEsGx6Oo+3JL0l2JaNa9luxr3mwkChslaRGW3uKbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3206
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Mon, 04 Nov 2019 08:30:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Mon, 04 Nov 2019 08:30:13 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xA48UG8h029267
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 16/72] libmultipath: make path_discovery()
 pthread_cancel()-safe
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
X-MC-Unique: rpr5yLJ9PuGiFCBOLITlbA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi Ben,

thanks for looking into this.

On Wed, 2019-10-30 at 09:53 -0500, Benjamin Marzinski wrote:
> On Sat, Oct 12, 2019 at 09:27:57PM +0000, Martin Wilck wrote:
> > From: Martin Wilck <mwilck@suse.com>
> >=20
> > The udev_enumerate and udev_device refs wouldn't be released
> > if the thread was cancelled. Fix it.
> >=20
> > Signed-off-by: Martin Wilck <mwilck@suse.com>
> > ---
> >  libmultipath/discovery.c | 51 +++++++++++++++++++++++++++++++-----
> > ----
> >  1 file changed, 40 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> > index e68b0e9f..d217ca92 100644
> > --- a/libmultipath/discovery.c
> > +++ b/libmultipath/discovery.c
> > @@ -140,19 +140,47 @@ path_discover (vector pathvec, struct config
> > * conf,
> >  =09return pathinfo(pp, conf, flag);
> >  }
> > =20
> > +static void cleanup_udev_enumerate_ptr(void *arg)
> > +{
> > +=09struct udev_enumerate *ue;
> > +
> > +=09if (!arg)
> > +=09=09return;
> > +=09ue =3D *((struct udev_enumerate**) arg);
> > +=09if (ue)
> > +=09=09(void)udev_enumerate_unref(ue);
> > +}
> > +
> > +static void cleanup_udev_device_ptr(void *arg)
> > +{
> > +=09struct udev_device *ud;
> > +
> > +=09if (!arg)
> > +=09=09return;
> > +=09ud =3D *((struct udev_device**) arg);
> > +=09if (ud)
> > +=09=09(void)udev_device_unref(ud);
> > +}
> > +
> >  int
> >  path_discovery (vector pathvec, int flag)
> >  {
> > -=09struct udev_enumerate *udev_iter;
> > +=09struct udev_enumerate *udev_iter =3D NULL;
> >  =09struct udev_list_entry *entry;
> > -=09struct udev_device *udevice;
> > +=09struct udev_device *udevice =3D NULL;
> >  =09struct config *conf;
> > -=09const char *devpath;
> >  =09int num_paths =3D 0, total_paths =3D 0, ret;
> > =20
> > +=09pthread_cleanup_push(cleanup_udev_enumerate_ptr, &udev_iter);
> > +=09pthread_cleanup_push(cleanup_udev_device_ptr, &udevice);
> > +=09conf =3D get_multipath_config();
> > +=09pthread_cleanup_push(put_multipath_config, conf);
> > +
> >  =09udev_iter =3D udev_enumerate_new(udev);
> > -=09if (!udev_iter)
> > -=09=09return -ENOMEM;
> > +=09if (!udev_iter) {
> > +=09=09ret =3D -ENOMEM;
> > +=09=09goto out;
> > +=09}
> > =20
> >  =09if (udev_enumerate_add_match_subsystem(udev_iter, "block") < 0
> > ||
> >  =09    udev_enumerate_add_match_is_initialized(udev_iter) < 0 ||
> > @@ -165,6 +193,8 @@ path_discovery (vector pathvec, int flag)
> >  =09udev_list_entry_foreach(entry,
> >  =09=09=09=09udev_enumerate_get_list_entry(udev_iter
> > )) {
> >  =09=09const char *devtype;
> > +=09=09const char *devpath;
> > +
> >  =09=09devpath =3D udev_list_entry_get_name(entry);
> >  =09=09condlog(4, "Discover device %s", devpath);
> >  =09=09udevice =3D udev_device_new_from_syspath(udev, devpath);
> > @@ -175,19 +205,18 @@ path_discovery (vector pathvec, int flag)
> >  =09=09devtype =3D udev_device_get_devtype(udevice);
> >  =09=09if(devtype && !strncmp(devtype, "disk", 4)) {
> >  =09=09=09total_paths++;
> > -=09=09=09conf =3D get_multipath_config();
> > -=09=09=09pthread_cleanup_push(put_multipath_config,
> > conf);
>=20
> Why move grabbing the config RCU lock out of the loop?=20

Yes, that was the idea.

> All things being
> equal, it seems like we'd rather hold this for less time, and
> rcu_read_lock() is designed to be lightweight, so calling it more
> times
> shouldn't be an issue.=20

It's not the execution time of rcu_read_lock() that I'm concerned
about.=20

In this particular loop, my estimate is that >90% of time is spent in
path_discover()/pathinfo(), so time-during-which-lock-is-held-wise, we
gain little by taking and releasing the RCU lock in every iteration.=20

Right, we might catch a configuration change _earlier_ if we release
the lock between pathinfo() invocations. But - do we actually want
that? This lock protects us against corruption of the multipathd
configuration, basically against someone calling "multipathd
reconfigure" while our code is running. But if the configuration ins
really changed, what we're currently doing is vain anyway - once the
configure() call is finished, we will go through yet another full
reconfigure cycle. IOW: Do we seriously want to call pathinfo() for the
different paths in the system with  different configuration, once with
and once without "user_friendly_names", for example?

Given that the code we're talking about is only called from
reconfigure(), multipath_conf having just been reassigned, IMO it's an
improvement to hold the lock through the entire loop. It might even be
good to hold the lock for the complete invocation of configure(), but I
haven't thought about that in detail yet.

Does this make sense?

Besides, to my taste at least, it improves readability of the code to
move get_multipath_config() out of certain loops.

Thanks,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

