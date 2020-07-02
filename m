Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 96F9F2122AB
	for <lists+dm-devel@lfdr.de>; Thu,  2 Jul 2020 13:53:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-V5JldeV3O-asO8AmSuIFvQ-1; Thu, 02 Jul 2020 07:52:56 -0400
X-MC-Unique: V5JldeV3O-asO8AmSuIFvQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D17E3107ACF4;
	Thu,  2 Jul 2020 11:52:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2ADE52B4BC;
	Thu,  2 Jul 2020 11:52:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 27C781809547;
	Thu,  2 Jul 2020 11:52:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 062BqSvb014337 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 07:52:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C12B9200AC2B; Thu,  2 Jul 2020 11:52:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC2A52144B47
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 11:52:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A76CE185A78B
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 11:52:26 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [51.163.158.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-311-r9BCjL0uOMm0Aksrx7khcQ-1;
	Thu, 02 Jul 2020 07:52:24 -0400
X-MC-Unique: r9BCjL0uOMm0Aksrx7khcQ-1
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-5-jc4bDyL4P_uKyKpPXT9M4A-1; Thu, 02 Jul 2020 13:52:22 +0200
X-MC-Unique: jc4bDyL4P_uKyKpPXT9M4A-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB7PR04MB4073.eurprd04.prod.outlook.com (2603:10a6:5:17::10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20;
	Thu, 2 Jul 2020 11:52:21 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593%3]) with mapi id 15.20.3131.035;
	Thu, 2 Jul 2020 11:52:21 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [dm-devel] [PATCH 2/3] libmutipath: don't close fd on
	dm_lib_release
Thread-Index: AQHWAvDVMPVBmrxKu0ahxytrCBthq6j0yJkA
Date: Thu, 2 Jul 2020 11:52:21 +0000
Message-ID: <4eaae3bfe0c383d23a839483e88ec093883f4e5a.camel@suse.com>
References: <1585083834-14237-1-git-send-email-bmarzins@redhat.com>
	<1585083834-14237-2-git-send-email-bmarzins@redhat.com>
	<ebfcb22b005314635b77e4820e205971d708d07d.camel@suse.com>
	<20200325205255.GB17313@octiron.msp.redhat.com>
	<20200325220045.GC17313@octiron.msp.redhat.com>
In-Reply-To: <20200325220045.GC17313@octiron.msp.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3
x-originating-ip: [94.218.227.113]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3066d8a8-3cde-41f7-7375-08d81e7e60d9
x-ms-traffictypediagnostic: DB7PR04MB4073:
x-microsoft-antispam-prvs: <DB7PR04MB4073E103F7ABA358E813DF33FC6D0@DB7PR04MB4073.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0452022BE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JkE6T1Hg2fOahYeX6Ek25b7ubLeJUGigm6sw7eb5qHXoUJ+P858ptEsoUf76LBN2+m/SCqgs7Uc8llu5BETGktoFyKSgS6UH29RT12xshbtI8nXJzXx5obDtaaFtu2BA+BOyku3/6CJkrqMnfZaFmA+LhVagemb7JRW4zaZrnb8yg3qtQ4ewvFWujsSroT6fRn14sTGp/NyWXfU+feD5scqjX4fevNCJqlrb1TMeglGT/qwkhD2uKDlMN0qTRmDHi4SIp+J2uU+mevcqxXta7TNRaqj9twYOewED27wICLpCf92IiO22bNqunGplC5Ei3mF/I9JMsnpta8iXJrRoPQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(376002)(396003)(366004)(136003)(346002)(39860400002)(6512007)(26005)(186003)(76116006)(64756008)(91956017)(66476007)(66556008)(66446008)(66946007)(71200400001)(6486002)(316002)(36756003)(86362001)(6506007)(83380400001)(4326008)(2906002)(5660300002)(478600001)(6916009)(450100002)(8936002)(66574015)(8676002)(2616005);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: YY/1KhK6bD0dx0fzrXspgj+MAgIh0jLEMuBa208BUy0GNcPGBOGzNL+S9Ei/wtHV7VxN8WR3ncmXAmAPTWUe6uUMEB0sw2yMsm7MKHekbIf425PMYFXnaHAcIDQQRF5LLGuPKiIV8tIXyKM6e7yu9EQyUudZKUR9dYrsxEdj7cKeaeicOBygRmB8KLCpJzloRbFpyhfROyhsu+8QqGkOGQqjENJI9mJqsAOLQcV38ubafmYGFrSxqaB6al0HdLqDLqrvannSa/epPaCDJSPqHfe3UCSiqb8WK1WpIZTOBwJjj2wggoBMqG4utn3yFpmzXNKvQJlYX8npUtICz2GhlP1n9up9P5Xt8FmdEOvSn7Dd1KAerru+JAB9apeDbPwRuIpCjfMmU2uTwVVa9012eA+7BNm3erpQIxguWm21YMaBf/Xvn4zVkZYJm0WzSDuNoe8nBn57p52bE9maaAse6nbu312kNKm9C1Jf9ZT0VOtZEGuCoyRiMcv2vy3MWbbh
x-ms-exchange-transport-forked: True
Content-ID: <F5CB63BF0157EC43A8B4E9F7ED9226D7@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3066d8a8-3cde-41f7-7375-08d81e7e60d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2020 11:52:21.1501 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VSHw4d1OUe2szgGAjDZvhVd/vSN82CXNygVeTYz9XBIb5vzIKn6SkcwXdgjFNoPPUNACrsmp7LAK8hmlJjKxBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4073
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 062BqSvb014337
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-03-25 at 17:00 -0500, Benjamin Marzinski wrote:
> On Wed, Mar 25, 2020 at 03:52:55PM -0500, Benjamin Marzinski wrote:
> > On Wed, Mar 25, 2020 at 03:16:50PM +0000, Martin Wilck wrote:
> > > On Tue, 2020-03-24 at 16:03 -0500, Benjamin Marzinski wrote:
> > >=20
> > > AFAICS, this function has been in libdm since 1.02.111. We
> > > support
> > > 1.02.89 (if all features enabled, otherwise even older). Perhaps
> > > we
> > > should make this function call conditional on the libdm verson?
> > >=20
> > > But perhaps more importantly, why do we still need to call
> > > dm_lib_release()? AFAICS it's only needed for systems that have
> > > no udev
> > > support for creating device nodes (to call update_devs() via
> > > dm_lib_release()), and we don't support that anymore anyway, do
> > > we?=20
> > >=20
> > > Since 26c4bb0, we're always setting the
> > > DM_UDEV_DISABLE_LIBRARY_FALLBACK flag, and the cookie, too
> > > (we aren't setting it for DM_DEVICE_RELOAD, but it isn't needed
> > > for
> > > that, either, since no device nodes need to be created or
> > > removed); so
> > > dm_lib_release() should really have no effect.
> > >=20
> > > Regards
> > > Martin
> >=20
> > Good call. I'll redo this patch.
>=20
> Actually, I've changed my mind. Calling dm_lib_release() lets us
> release
> the memory that device-mapper uses to store all the node ops that it
> was saving up.  Without calling dm_lib_release(), AFAICS, that memory
> keeps growing until the daemon exits.

Sorry for coming back to this so late. I've just stared at the libdm
code again.=20

We always set DM_UDEV_DISABLE_LIBRARY_FALLBACK. In the standard CREATE
and REMOVE cases, libdm doesn't stack any operations if this flag is
set. The only exceptions are=20

 a) RESUME operations with DM_ADD_NODE_ON_RESUME set. This happens
implicity when we create new maps
 b) RENAME operations

In both cases, we call dm_udev_wait() after the libdm operation, which
calls update_devs() and should thus have the same effect as
dm_lib_release(). IOW, I still believe we don't need to call
dm_lib_release() any more.

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

