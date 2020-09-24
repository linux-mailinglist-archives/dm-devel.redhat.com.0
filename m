Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 93A9C27792D
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 21:23:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-4JEU9RS9NWeXWHbvME0TsQ-1; Thu, 24 Sep 2020 15:22:55 -0400
X-MC-Unique: 4JEU9RS9NWeXWHbvME0TsQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41B06801002;
	Thu, 24 Sep 2020 19:22:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 641205D9D2;
	Thu, 24 Sep 2020 19:22:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A017244A5E;
	Thu, 24 Sep 2020 19:22:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OJMYXm005280 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 15:22:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B09A4115E0C; Thu, 24 Sep 2020 19:22:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AAAD3115E08
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 19:22:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1908F811E76
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 19:22:30 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [62.140.7.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-190-SVZeEATbMmCqFui130rW0A-1;
	Thu, 24 Sep 2020 15:22:28 -0400
X-MC-Unique: SVZeEATbMmCqFui130rW0A-1
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur03lp2053.outbound.protection.outlook.com [104.47.9.53])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-40-OMVelFMiOf6A-7M4pArlKg-1; Thu, 24 Sep 2020 21:22:23 +0200
X-MC-Unique: OMVelFMiOf6A-7M4pArlKg-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DBBPR04MB6268.eurprd04.prod.outlook.com (2603:10a6:10:cc::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11;
	Thu, 24 Sep 2020 19:22:21 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::f1a9:5330:1129:da6a]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::f1a9:5330:1129:da6a%7]) with mapi id 15.20.3391.027;
	Thu, 24 Sep 2020 19:22:21 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [dm-devel] [RFC PATCH v2 0/3] add library to check if device is
	a valid path
Thread-Index: AQHWki+ErlMHDCZoc0mvVLY9K+HV1Kl3chCAgACJfoCAADAcgA==
Date: Thu, 24 Sep 2020 19:22:21 +0000
Message-ID: <53ad2ea2f8457030eac247420fcc564bd5608ab8.camel@suse.com>
References: <1600923569-17412-1-git-send-email-bmarzins@redhat.com>
	<01ce499f8c7a7248f560066054ba4dd922bbc338.camel@suse.com>
	<20200924163007.GG11108@octiron.msp.redhat.com>
In-Reply-To: <20200924163007.GG11108@octiron.msp.redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5
x-originating-ip: [90.186.0.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97c5aa92-ce0e-4a17-cfe3-08d860bf290f
x-ms-traffictypediagnostic: DBBPR04MB6268:
x-microsoft-antispam-prvs: <DBBPR04MB6268A5DBF8D72F5B5BAFCCB6FC390@DBBPR04MB6268.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: kUqCwwoP9i4glRx2/PbQcViJLClIi23d8vqKpmsvCAJtygW3aeikgSnQbRmBI0hHoKKOzm/45AZx8mq5S3hXzEZo4EQUPHPod9BoAjw8tmaESe/NYTjwxXV5UTn6lrnb4F227zGXW0xSOSe/6T5HEt58CfDxXaa6DNf50V438kVqBjkrTn5KeFQoFonOxG5VU+BM7JtR+d0SgKvbQAr274wtqBVClt6+tTEQB6U0XrpyR2auhyQ1xtMNCvM9YeUDEit/xo0ORERPWbFqoyQbXmmSoK8/7kDALC3ssZ+R6/at8k0j68YH+dU/PmUhcAial+1ffhv68qq9f63CVyWOUA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(136003)(396003)(39860400002)(376002)(366004)(346002)(66574015)(6506007)(6486002)(186003)(2906002)(6512007)(26005)(478600001)(83380400001)(8936002)(66476007)(64756008)(76116006)(66946007)(6916009)(2616005)(316002)(86362001)(5660300002)(36756003)(66446008)(71200400001)(450100002)(66556008)(91956017)(44832011)(8676002)(4326008);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata: AF76oRZ4rwGuYSHPTPxnXvPpod0MO1SzLOKy26kpOfT95FFb6Q63fLKEajuadQzb48G3vNbQYHwiOzExOyJs2J+2c14ZfoDuMYgXHT3usTXzL1Jl59vXMoorcPVwWJFxzno9fLY69JU322OwvrpDEAj+JPkpkBsacxRHOwztJLhaVWZX/hB0zgdIyWOsPlq+RJmCj1bbFy520nHDriMciNp5CkPdIz5DNRAL2M1HW9kTStsnY+vW8Iz1Q0aVl5h8AVgBR4z6ku7U0ZZiXuR/zl6xoSkqpn/vogKMz3QCLzcj3v0gisaB0cmFK0UsIGSfnnKZs5FWANdKpGh/AvH4/3vywcreBwah2ZxIwzKpHuM9A50fZFRS+PjjyJNvXncX/TPpAdaTUMkj8iTdF7LbvnFWEGIQdNlCmsLzlIpCwHFK9NCubIsT5hvnKM1UiEtJApMs8nGLbyc3TJ/SaI4CD0dFspNK1EWdCsDlix3TxS8MLRMu+0j9N77vgbNJoddZMcl7+P1012QWxpQ6/MIdemOnX/zZw+dAUb017rVrazy5NW/3vQdzcrJtJ8JAO6tVjkjE6LJlsT8dQkLzFGWbww/wekjHlVaE3GGEYzUM5c9+yDGOz5B7TISUGFLkrui8JkB5d7JEfrFUEglhmerGqg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c5aa92-ce0e-4a17-cfe3-08d860bf290f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2020 19:22:21.5977 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6JKiU/LcdbC41/jhX7qqAzJtv+zoTYT8nvTl323L5Xhqdl9dGFfdkfNUE47LWM/+GiuAU471WfK/iCxIwHEMJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6268
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08OJMYXm005280
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH v2 0/3] add library to check if device is
 a valid path
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <C2F8931456399F47BD648CD6C6BE8A31@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-09-24 at 11:30 -0500, Benjamin Marzinski wrote:
> On Thu, Sep 24, 2020 at 08:18:02AM +0000, Martin Wilck wrote:
> > On Wed, 2020-09-23 at 23:59 -0500, Benjamin Marzinski wrote:
> > >=20
> > > The second patch adds get_uid fallback code for dasd devices. The
> > > third
> > > patch just changes the get_uid log level for devices configured
> > > with
> > > uid_attribute "". This is because it is currently necessary to
> > > configure
> > > multipath with
> > >=20
> > > overrides {
> > >         uid_attribute ""
> > > }
> > >=20
> > > to claim multipath devices with SID (instead of using
> > > multipath.rules),
> > > since SID doesn't currently get the UID information itself, and
> > > it is
> > > called by udev before this information is added to the udev
> > > database.
> > >=20
> >=20
> > This makes me wonder how SID and multipathd are supposed to
> > coexist.
> > We wouldn't want this overrides directive for multipathd itself,
> > would
> > we?
>=20
> Don't we need it to be used by everything?  We certainly don't want
> multipathd to get a different value for the wwid than SID has. It
> seems
> like all programs that access the multipath devices should use the
> same
> method to get the WWIDs.

Well, as soon as SID is authoritative for the question whether or not a
device should be multipathed, this is certainly true.

That would mean, then, that multipath-tools would abandon the current
philosophy of relying on udev, and attempt to derive device properties
directly from sysfs instead. That makes a certain amount of sense to
me, even though it's contrary to what we've been doing the last years.
Relying on udev is not without issues, as we both know. uevents being
delayed or never delivered is one problem, the other is the fact that
udev rules can be customized without limits, leading to a
profliferation of variables and configuration options. All this has
historical reasons, today we could very well obtain almost all device
attributes we need directly from sysfs.

... but I gather that this is a temporary scenario ...=20

> The long term solution is that SID will call out to the devices, and
> grab these uid attributes, just like udev currently does. It already
> does this for the blkid values. When SID is running, these udev rules
> will be disabled, and SID will provide udev with this data. So
> eventually, multipath won't need any configuration changes to work
> with
> SID. setting this overrides line is just a stop-gap, so that people
> can
> test SID and multipath now.

So, SID will call into libmultipath via libmpathvalid, udev will obtain
the properties from SID, and multipathd will fetch them from udev in
turn? Or will multipathd talk directly to SID? I seem to be missing the
overall picture.

Anyway, if you can live with simply adding an "overrides" statement to
multipath.conf for SID at the current stage, fine with me.

Forgot to say: ACK for this series from me, with the exception of the
minor nit I had on #3.

Regards,
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

