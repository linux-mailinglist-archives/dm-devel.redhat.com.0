Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9857F103A83
	for <lists+dm-devel@lfdr.de>; Wed, 20 Nov 2019 13:59:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574254761;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JjbYIXcz8rESj3wKyXBPWhTHr/GX2R3vyMxyV8ZTJdM=;
	b=MN8WX/dIE+uzgyaIiCfanh73JnzDFdS+MlIskAycQyzIWyuhNzzSA8ZiQ4xzCqw65wL1Kq
	dE4aU+tyLA7HW8XyHKTbVuXcv1YVwpwnAAxz3YtAPi82KkbeukSqeE727LCoJnKnkWI2+i
	jXeNH+sro40tm+cPHgLgw7P/oyg6+dg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-mOawdHq7OkSog_0PHtXB-w-1; Wed, 20 Nov 2019 07:59:18 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 370F8803421;
	Wed, 20 Nov 2019 12:59:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B094C28DD0;
	Wed, 20 Nov 2019 12:59:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A920A18089CD;
	Wed, 20 Nov 2019 12:58:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAKCwX5O032517 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 20 Nov 2019 07:58:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EBEEB2166BD5; Wed, 20 Nov 2019 12:58:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E716A2166BDA
	for <dm-devel@redhat.com>; Wed, 20 Nov 2019 12:58:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 823FE8007DB
	for <dm-devel@redhat.com>; Wed, 20 Nov 2019 12:58:30 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-358-2vUNdqFEO2e1usM7jBp3lQ-1;
	Wed, 20 Nov 2019 07:58:27 -0500
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 20 Nov 2019 12:57:47 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 20 Nov 2019 12:33:17 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.8.14) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 20 Nov 2019 12:33:17 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (10.175.223.16) by
	DM5PR18MB2136.namprd18.prod.outlook.com (52.132.142.25) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2474.17; Wed, 20 Nov 2019 12:33:16 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1db:c70a:b831:8150]) by
	DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1db:c70a:b831:8150%5]) with mapi id 15.20.2451.031;
	Wed, 20 Nov 2019 12:33:16 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [PATCH 5/5] libmultipath: fix ALUA autodetection when paths are
	down
Thread-Index: AQHVm8LTZSwmpYg+qkiMmyfbu1NdLg==
Date: Wed, 20 Nov 2019 12:33:15 +0000
Message-ID: <9dbb15bcf8c527c950876505aaf52e0ea606cb5e.camel@suse.com>
References: <20191115143403.31692-1-martin.wilck@suse.com>
	<20191115143403.31692-6-martin.wilck@suse.com>
	<20191119222954.GM30153@octiron.msp.redhat.com>
In-Reply-To: <20191119222954.GM30153@octiron.msp.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2.206.153.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf5c2d01-e5e5-4687-11fc-08d76db5d140
x-ms-traffictypediagnostic: DM5PR18MB2136:
x-microsoft-antispam-prvs: <DM5PR18MB2136924BD690642FF283F7B1FC4F0@DM5PR18MB2136.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(189003)(199004)(25786009)(6246003)(3846002)(6116002)(6506007)(2501003)(99286004)(54906003)(26005)(186003)(316002)(256004)(14444005)(71190400001)(71200400001)(66066001)(6916009)(4326008)(36756003)(5660300002)(66556008)(5640700003)(66446008)(66946007)(64756008)(305945005)(478600001)(91956017)(76116006)(8936002)(7736002)(6512007)(6436002)(76176011)(446003)(1730700003)(81156014)(2351001)(11346002)(118296001)(6486002)(102836004)(2906002)(14454004)(81166006)(2616005)(8676002)(486006)(229853002)(86362001)(4001150100001)(66476007)(476003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB2136;
	H:DM5PR18MB1355.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F6O4oPsdCsuaLPEE64Q3OTt8nYIvOYnilFjtIKS8VJHlT67eKD7TvP9r1V6D7MoxSYc4q/oaqg6ZQbNvGzQruki/nA1FZbXIth10QoLh7KAWQxKHs8dlwvFa59fPDM58RICJrll0m3GIwPQOkxw3PESTgRFoPVsCaeTNPNvuGzpwLBs6IHjda8WRz+bw2pfxMImUYMHilAe0/cSqgZFkdJgOXmAGzpDQda8VMsMc7ucs6rWPnFH/xHhDImnMpKkXx/wZtMNAkPv/fdRFKatikJIMLdr1Ywqut8Pve7B3CJUj4DxTQx07BkKupzF+XY7utDHSpy80BrjbcQZUFuNvDuYzqgwh5/9h3wm1RlFvIr2SQpr1nHOhzTM6FFBk3NJy19C8R8mY+xmpO8kbSDzIzDYkMLpXuocjDc2nVQdb71i1qxtZnPlNAgIS+tuC5bFV
x-ms-exchange-transport-forked: True
Content-ID: <CF3135617BEDA44EBA033AAE456A943A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5c2d01-e5e5-4687-11fc-08d76db5d140
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 12:33:16.0570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hr2hux92u5loNqbM72XuPEgmQhaCZm2DoMNJQwFN27RqyNL37TP47OCQPGf7rG22RMoVb/ywRlOV1qwhaf72dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB2136
X-OriginatorOrg: suse.com
X-MC-Unique: 2vUNdqFEO2e1usM7jBp3lQ-1
X-MC-Unique: mOawdHq7OkSog_0PHtXB-w-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAKCwX5O032517
X-loop: dm-devel@redhat.com
Cc: "xose.vazquez@gmail.com" <xose.vazquez@gmail.com>,
	"wu.chongyun@h3c.com" <wu.chongyun@h3c.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"Bart.VanAssche@sandisk.com" <Bart.VanAssche@sandisk.com>
Subject: Re: [dm-devel] [PATCH 5/5] libmultipath: fix ALUA autodetection
 when paths are down
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
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-11-19 at 16:29 -0600, Benjamin Marzinski wrote:
> On Fri, Nov 15, 2019 at 02:41:54PM +0000, Martin Wilck wrote:
> > From: Martin Wilck <mwilck@suse.com>
> >=20
> > If a single path was offline when detect_alua() was called,
> > multipathd would assume ALUA was generally unsupported.
> >=20
> > Fix that by assuming that if at least one path has ALUA support and
> > no path explicitly does not have it, ALUA is supported.
> >=20
> > Signed-off-by: Martin Wilck <mwilck@suse.com>
> > ---
> >  libmultipath/discovery.c | 22 +++++++++++++++++++++-
> >  libmultipath/propsel.c   | 20 +++++++++++++++++---
> >  2 files changed, 38 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> > index 4288c9fd..5f41dcb7 100644
> > --- a/libmultipath/discovery.c
> > +++ b/libmultipath/discovery.c
> > @@ -871,6 +871,10 @@ get_serial (char * str, int maxlen, int fd)
> >  =09return 1;
> >  }
> > =20
> > /*
> > + * Side effect: sets pp->tpgs if it could be determined.
> > + * If ALUA calls fail because paths are unreachable, pp->tpgs
> > remains unchanged.
> > + */
> >  static void
> >  detect_alua(struct path * pp)
> >  {
> > @@ -881,12 +885,28 @@ detect_alua(struct path * pp)
> >  =09if (sysfs_get_timeout(pp, &timeout) <=3D 0)
> >  =09=09timeout =3D DEF_TIMEOUT;
> > =20
> > -=09if ((tpgs =3D get_target_port_group_support(pp, timeout)) <=3D 0) {
> > +=09tpgs =3D get_target_port_group_support(pp, timeout);
> > +=09if (tpgs =3D=3D -RTPG_INQUIRY_FAILED)
> > +=09=09return;
> > +=09else if (tpgs <=3D 0) {
> >  =09=09pp->tpgs =3D TPGS_NONE;
> >  =09=09return;
> >  =09}
> > +
> > +=09if (pp->fd =3D=3D -1 || pp->offline)
> > +=09=09return;
> > +
> =20
> This is just a nitpick, but won't tpgs already be
> -RTPG_INQUIRY_FAILED
> if pp->fd =3D=3D -1. This check makes more sense before
> get_target_port_group_support().

Not really, because get_target_port_group_support() normally obtains
INQUIRY data from sysfs, which can return something reasonable even
if fd =3D=3D -1 (e.g. if the path is temporarily offline). In particular,
it could indicate that the device has no TPGS support. That's why I
call it first.

Regards,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

