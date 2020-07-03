Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 98417213B7D
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jul 2020 16:06:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-Q7gSN0aGMfWf4Cd_PDIH6g-1; Fri, 03 Jul 2020 10:06:42 -0400
X-MC-Unique: Q7gSN0aGMfWf4Cd_PDIH6g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 634BE7BAE;
	Fri,  3 Jul 2020 14:06:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AAA871EE;
	Fri,  3 Jul 2020 14:06:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C491A1809547;
	Fri,  3 Jul 2020 14:06:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 063E67wt010160 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 10:06:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 15104110F0C0; Fri,  3 Jul 2020 14:06:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FD59110F0BC
	for <dm-devel@redhat.com>; Fri,  3 Jul 2020 14:06:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0C018EF3A3
	for <dm-devel@redhat.com>; Fri,  3 Jul 2020 14:06:04 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [62.140.7.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-143-UEXaa3-JOOK20DYCh0empw-1;
	Fri, 03 Jul 2020 10:06:02 -0400
X-MC-Unique: UEXaa3-JOOK20DYCh0empw-1
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur03lp2051.outbound.protection.outlook.com [104.47.10.51])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-18-6jO2JhXCN4OGZuL1HBrUlQ-1; Fri, 03 Jul 2020 16:05:58 +0200
X-MC-Unique: 6jO2JhXCN4OGZuL1HBrUlQ-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB7PR04MB5385.eurprd04.prod.outlook.com (2603:10a6:10:83::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24;
	Fri, 3 Jul 2020 14:05:58 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593%3]) with mapi id 15.20.3153.028;
	Fri, 3 Jul 2020 14:05:58 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [dm-devel] [PATCH 2/3] libmutipath: don't close fd on
	dm_lib_release
Thread-Index: AQHWAvDVMPVBmrxKu0ahxytrCBthq6j0yJkAgACKFACAAS2VAA==
Date: Fri, 3 Jul 2020 14:05:57 +0000
Message-ID: <69ee475e7cc3cfdacca20701ac0b44000ed33443.camel@suse.com>
References: <1585083834-14237-1-git-send-email-bmarzins@redhat.com>
	<1585083834-14237-2-git-send-email-bmarzins@redhat.com>
	<ebfcb22b005314635b77e4820e205971d708d07d.camel@suse.com>
	<20200325205255.GB17313@octiron.msp.redhat.com>
	<20200325220045.GC17313@octiron.msp.redhat.com>
	<4eaae3bfe0c383d23a839483e88ec093883f4e5a.camel@suse.com>
	<20200702200632.GH11089@octiron.msp.redhat.com>
In-Reply-To: <20200702200632.GH11089@octiron.msp.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3
x-originating-ip: [94.218.227.113]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00affc07-8392-4ac9-6f3f-08d81f5a35b1
x-ms-traffictypediagnostic: DB7PR04MB5385:
x-microsoft-antispam-prvs: <DB7PR04MB538513B2D6E32F37FDF95E6AFC6A0@DB7PR04MB5385.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 045315E1EE
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t/CZkR7fdrf+pnjWF79//mqiMHsMKEu8On095Ft64egfNsqtm7lBzYxKLHlgcWC8WxzRa9aqG2s0DK1DhEdA4cuo9eyheqnRwsRtQEbZf1R+W8McQCQ+VKz4N15ygWYr+FMVygTThMn4b+/pY5I7qtK5SJPC1t2VA81mnUOyyo+byvtUClsZMv/kI0FZDMqUD34K5zf7W0j1obO3Dj/GTF5Mpid6fXWJOX67L9VqHjmIkuKta9n2p7R7rBJgPF7Eq+lNTjsMVa+CId1jrNIdxqQVe3PnVHY8Wz/r95NWzID6YN61EnXLgpMUfaQJLaukSutb1oFjgT/zOrywY8q9QQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(136003)(396003)(346002)(39860400002)(366004)(376002)(83380400001)(6916009)(2616005)(2906002)(26005)(478600001)(36756003)(76116006)(316002)(6486002)(66946007)(66476007)(86362001)(66556008)(64756008)(91956017)(66446008)(6506007)(71200400001)(186003)(8936002)(6512007)(5660300002)(8676002)(450100002)(4326008)(66574015);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: ECiLA05abNyr0wuVjTY5ddiB5qD/WruT5sbYAxhcdaQqhDPcgfePMn24O3ZkVTFA2a5MmLExrhUQ9WM1ys+4jk29Q3wZ0402KncKZpg8LuGC13iZBszm7w4S4PtBcNsMEnXY57cLQlY+2rV2BBeKqfiTZhqIjojpo/ksE94CCsQgd6j/s6BOJXxDXDiiAKbuO5JyeUh/C1mjD0m8kSUJW3I85BO3gf/ONVGKdCN+ZMfbdD+EcXiBhKfIXT26lnWWg7Tq1A4qF8bmnR5ur+M3hXMX0RKvVPxng5uZbmsWvRmgHxbwSp5KDEWem0zFZGLknnuelFItsTCr/nRiOx50Iw8Y1QgZehzoyqdeuyBIFtZ//h12oqfjp+ZIDGioJHzDCOTWGoup2LWE21iSgIwfFCZ3FF7p29t4djpY1kIG2lxAVxDjaiW+K2yJsg51VndVeYfuLvBzKhX554IW5INd5/6CuUnGkuBivGNA08hHuVdavo/sn8mq9EHDb1IY5w/q
x-ms-exchange-transport-forked: True
Content-ID: <BAD31EFE809A6447886A7865E1369B73@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00affc07-8392-4ac9-6f3f-08d81f5a35b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2020 14:05:58.0893 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tN7hEPrAxVuWn/9scIITwj5uKatvOJhCE0VJMUxGHXU47VNyGtawpCL0cV/mICcwr74QMhiLDCLgqV5Xmufqlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5385
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 063E67wt010160
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-07-02 at 15:06 -0500, Benjamin Marzinski wrote:
> On Thu, Jul 02, 2020 at 11:52:21AM +0000, Martin Wilck wrote:
> > On Wed, 2020-03-25 at 17:00 -0500, Benjamin Marzinski wrote:
> > > On Wed, Mar 25, 2020 at 03:52:55PM -0500, Benjamin Marzinski
> > > wrote:
> > > > On Wed, Mar 25, 2020 at 03:16:50PM +0000, Martin Wilck wrote:
> > > > > On Tue, 2020-03-24 at 16:03 -0500, Benjamin Marzinski wrote:
> > > > >=20
> > > > > AFAICS, this function has been in libdm since 1.02.111. We
> > > > > support
> > > > > 1.02.89 (if all features enabled, otherwise even older).
> > > > > Perhaps
> > > > > we
> > > > > should make this function call conditional on the libdm
> > > > > verson?
> > > > >=20
> > > > > But perhaps more importantly, why do we still need to call
> > > > > dm_lib_release()? AFAICS it's only needed for systems that
> > > > > have
> > > > > no udev
> > > > > support for creating device nodes (to call update_devs() via
> > > > > dm_lib_release()), and we don't support that anymore anyway,
> > > > > do
> > > > > we?=20
> > > > >=20
> > > > > Since 26c4bb0, we're always setting the
> > > > > DM_UDEV_DISABLE_LIBRARY_FALLBACK flag, and the cookie, too
> > > > > (we aren't setting it for DM_DEVICE_RELOAD, but it isn't
> > > > > needed
> > > > > for
> > > > > that, either, since no device nodes need to be created or
> > > > > removed); so
> > > > > dm_lib_release() should really have no effect.
> > > > >=20
> > > > > Regards
> > > > > Martin
> > > >=20
> > > > Good call. I'll redo this patch.
> > >=20
> > > Actually, I've changed my mind. Calling dm_lib_release() lets us
> > > release
> > > the memory that device-mapper uses to store all the node ops that
> > > it
> > > was saving up.  Without calling dm_lib_release(), AFAICS, that
> > > memory
> > > keeps growing until the daemon exits.
> >=20
> > Sorry for coming back to this so late. I've just stared at the
> > libdm
> > code again.=20
> >=20
> > We always set DM_UDEV_DISABLE_LIBRARY_FALLBACK. In the standard
> > CREATE
> > and REMOVE cases, libdm doesn't stack any operations if this flag
> > is
> > set. The only exceptions are=20
> >=20
> >  a) RESUME operations with DM_ADD_NODE_ON_RESUME set. This happens
> > implicity when we create new maps
> >  b) RENAME operations
> >=20
> > In both cases, we call dm_udev_wait() after the libdm operation,
> > which
> > calls update_devs() and should thus have the same effect as
> > dm_lib_release(). IOW, I still believe we don't need to call
> > dm_lib_release() any more.
>=20
> Sure. But can we leave this patch as is, and remove those calls in a
> different patch?

Of course. It's not important, either. I just wanted to make sure
we agree on the technical side.

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

