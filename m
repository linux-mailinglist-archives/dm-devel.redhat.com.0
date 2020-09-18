Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 31B0C26F766
	for <lists+dm-devel@lfdr.de>; Fri, 18 Sep 2020 09:52:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-GNjfEMhgP8mS3pDjIA8r-A-1; Fri, 18 Sep 2020 03:52:23 -0400
X-MC-Unique: GNjfEMhgP8mS3pDjIA8r-A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A67005703A;
	Fri, 18 Sep 2020 07:52:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DBE473660;
	Fri, 18 Sep 2020 07:52:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E584183D043;
	Fri, 18 Sep 2020 07:52:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08I7pwTv023416 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Sep 2020 03:51:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1319610A1428; Fri, 18 Sep 2020 07:51:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DA0210A1424
	for <dm-devel@redhat.com>; Fri, 18 Sep 2020 07:51:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFBE7900C6A
	for <dm-devel@redhat.com>; Fri, 18 Sep 2020 07:51:55 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [51.163.158.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-338-1p7DtdMDPfWUb-BFLq3Oyg-1;
	Fri, 18 Sep 2020 03:51:51 -0400
X-MC-Unique: 1p7DtdMDPfWUb-BFLq3Oyg-1
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur02lp2050.outbound.protection.outlook.com [104.47.5.50])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-19-AsEefHizMtmQJOCAvcySRA-1; Fri, 18 Sep 2020 09:51:48 +0200
X-MC-Unique: AsEefHizMtmQJOCAvcySRA-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB6PR0401MB2357.eurprd04.prod.outlook.com (2603:10a6:4:4b::17)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17;
	Fri, 18 Sep 2020 07:51:47 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::f1a9:5330:1129:da6a]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::f1a9:5330:1129:da6a%7]) with mapi id 15.20.3391.014;
	Fri, 18 Sep 2020 07:51:47 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [PATCH 1/3] multipath: add libmpathvalid library
Thread-Index: AQHWi6mHZ16Z9nyl9Eu3JKZ8ynuaHalrUUMAgAIyrQCAAIXZAA==
Date: Fri, 18 Sep 2020 07:51:47 +0000
Message-ID: <4b65fb0cf70f139f2fa06b61c2a092038038a170.camel@suse.com>
References: <1600206312-6497-1-git-send-email-bmarzins@redhat.com>
	<1600206312-6497-2-git-send-email-bmarzins@redhat.com>
	<940b5f7e1202f27a55f58417314c45e441679535.camel@suse.com>
	<20200917235242.GT11108@octiron.msp.redhat.com>
In-Reply-To: <20200917235242.GT11108@octiron.msp.redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5
x-originating-ip: [90.186.0.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 994615c2-7d4a-4cd9-a759-08d85ba7b1f9
x-ms-traffictypediagnostic: DB6PR0401MB2357:
x-microsoft-antispam-prvs: <DB6PR0401MB235724C1110EE304ADD7E5C8FC3F0@DB6PR0401MB2357.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pyyjy6pUjXI2tEPZvjfV5xMcv37GldBZD7LipQb6WESHSuhO/1UG5NwIS4n8sIo2aZolGlnzDstnTmcBfk3YsMHMjGnsa1KzZcv78yfWokolUECCQNMwQOwRSvvIa18UgIVVcquFnLGRxj3rM4uqxEN8vYjdFcwtFG2ouUh74jwLTaf3vwgsiQb4YUdIrOj8Fjun6ZuqL0kmfZSV1m6p+vwb7mnWa9aJ+Jxd4xKQCqaO5U6nmHMF3YYkpS1oBwBBIfd2n7vL38X2VgGQWegCbkcGTvjaKrkn2jeYXPIJhvo0HdBY+3sHF7/jZjdnalmON5njoYqRQCSnV4SjBsAdWklCQZr+3w0bvBlQ9d6joKDnIZZAYvkJxhTjDAvlAq/C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(396003)(376002)(39860400002)(346002)(366004)(136003)(8676002)(2906002)(8936002)(2616005)(44832011)(4326008)(478600001)(6512007)(316002)(83380400001)(36756003)(26005)(186003)(71200400001)(64756008)(66556008)(66946007)(66476007)(66446008)(6506007)(91956017)(76116006)(54906003)(6916009)(86362001)(6486002)(5660300002);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: blQfJnD6m5ODgGpNyjhI8CLpV+SGtiOZ6mfqAkVuPjxrpps0IdbWGPmgG8rmhvu/MeIqbpdmVxiFp/GhcL9YXT+X9CCnB8RxFiGv6DTOsXkL+nGcTKfD+wYLTrgNnytONVe0pWSB46Z77/W2KS5LLdFC5MnwtktWM6RhJdevn5zxLXf3wMId4NzSKKVroS/6nh6qPQ0wiJIgkOHRgFARa2yZQpX5Bcm4Igs7EfShEsA4LHKHD2t/azQqFcfXDRlx7OA8yaxekm7iEcdPiBpdHTBqpY44YBPtsiV9rvq0v4XcB05eJ8/wHHI0TWncaBDeOJ4mVdqKxPtyQHUIjdW4wBK1MH5u0GOeWEsEbtVGcCQfGvg4VNp2J2oREpXdqtkzH1IyW0BqXUTiYUko/+1gCeEdZnzEc5JEr/Oknh4SLvGHWnK7MOM0zm6xYI0gw++W8xAINj5lOatDtGySUKUxojMY/P9Y4Z2UgPjhGjH/+7/W9Q5S3jR22kPI+N082HFtRdAOwoL/Ig9Nlk/ojrDXCu4WGAZBKfDxjAwB8WGk70zr2Z6hiR8GWmKpoXUk0mf8rNf7xj5LI5sQi614pakzVIuiFvaqN5/JykTMrMJTP2GWgS6Rb4WZm5g1srcXjnSsHOWt+3HCeWCuS6HsdtCQFA==
x-ms-exchange-transport-forked: True
Content-ID: <A509AA48A9405A4FBCB90690A2F92764@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 994615c2-7d4a-4cd9-a759-08d85ba7b1f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2020 07:51:47.5790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VMHro1BWQCtoO2Nf1YR+pupdaf0UFo7lB22kTqw6vwIQ565I0Kiil/p/ItjTYk9GZnMoXikBLaI0gfCpH0MAyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2357
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08I7pwTv023416
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/3] multipath: add libmpathvalid library
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On Thu, 2020-09-17 at 18:52 -0500, Benjamin Marzinski wrote:
> On Wed, Sep 16, 2020 at 02:18:49PM +0000, Martin Wilck wrote:
> > On Tue, 2020-09-15 at 16:45 -0500, Benjamin Marzinski wrote:
> > >=20
> > > +struct config;
> > > +extern struct config *mpathvalid_conf;
> >=20
> > What do you need this for?
>=20
> This isn't really necessary. Library users are expected to define
> methods like
>=20
> struct config *get_multipath_config(void)
> {
>         return mpathvalid_conf;
> }
>=20
> void put_multipath_config(__attribute__((unused))void *conf)
> {
>         /* Noop */
> }
>=20
> It would be possible to have mpathvalid_init() return
>=20
> struct config *
>=20
> and mpathvalid_exit() take that pointer. That would allow the caller
> to
> name their config pointer whatever they liked.  However the only
> thing
> that the caller can effect is the verbosity, so there's never really
> any
> point to have more than one config pointer.
>=20
> If you have objections, I can switch this to make the library use a
> user provided config pointer, instead of declaring one itself.

No, I'd rather not. I was mainly wondering why you export the pointer.
I believe that libmultipath's way to require the application to define
certain symbols is suboptimal, and I'd like to get rid of it (see my
other patch set). I can see that (as far as libmultipath is concerned)
this comes too late for sid, but I wouldn't want to repeat that design
decision again.

So, I guess exporting the pointer is just fine. Applications can still
define a symbol by the same name, overriding libmpathvalid's. It might
get problematic if sid will support runtime reconfiguration, like
multipathd. In that case it'd be better if you let the application
override get_multpath_config().

Martin

>=20
> -Ben
>=20
> =20
> > This looks good to me. It would be even better with a few unit
> > tests...
> >=20
> > Anyway, I've been working on a patch set to spare callers to define
> > the symbols {get,put}_multipath_config, udev, and logsink (we've
> > been
> > discussing that in the past). I'm going to submit it soon. I think
> > you
> > might be interested in that for this new library.
> >=20
> > Regards
> > Martin

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

