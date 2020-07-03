Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 356CE213C72
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jul 2020 17:18:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-AHXjmWtJOBGluBB3OaoJBQ-1; Fri, 03 Jul 2020 11:18:56 -0400
X-MC-Unique: AHXjmWtJOBGluBB3OaoJBQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE353107ACF2;
	Fri,  3 Jul 2020 15:18:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B43F71664;
	Fri,  3 Jul 2020 15:18:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6265E1809557;
	Fri,  3 Jul 2020 15:18:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 063FD4eV017601 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 11:13:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 36D15218ADC4; Fri,  3 Jul 2020 15:13:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31F31200ACC5
	for <dm-devel@redhat.com>; Fri,  3 Jul 2020 15:13:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0830924900
	for <dm-devel@redhat.com>; Fri,  3 Jul 2020 15:13:01 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [51.163.158.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-291-Klyd4_OCMXyTFDVs7hsOXA-1;
	Fri, 03 Jul 2020 11:12:59 -0400
X-MC-Unique: Klyd4_OCMXyTFDVs7hsOXA-1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-15-cTHjb3JfPjaU4qurfA_gJw-1; Fri, 03 Jul 2020 17:12:56 +0200
X-MC-Unique: cTHjb3JfPjaU4qurfA_gJw-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB8PR04MB5865.eurprd04.prod.outlook.com (2603:10a6:10:a6::31) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27;
	Fri, 3 Jul 2020 15:12:54 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593%3]) with mapi id 15.20.3153.028;
	Fri, 3 Jul 2020 15:12:54 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [dm-devel] [PATCH 0/7] Fix muitpath/multipathd flush issue
Thread-Index: AQHWRQbaV48I+cUSsEqBTrzd+h1sK6jeE96AgACYCACAACIPAIAAMiuAgBRJeACAAGo9gIAAmZaAgAAwm4CAABhEAIAAMTYAgAFHSoA=
Date: Fri, 3 Jul 2020 15:12:54 +0000
Message-ID: <be1e8d96543bc86a6a194bb9c708fba91878d9c9.camel@suse.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<f60b8ea30ee0ce68a46ce8f5c9ebaee6314d57e4.camel@suse.com>
	<20200618180458.GI5894@octiron.msp.redhat.com>
	<c5e95e7bc75b11e811854ff0b0988ff19ef45e13.camel@suse.com>
	<20200618230625.GJ5894@octiron.msp.redhat.com>
	<5357998bd17e1147fd3a6615e03251d1aa4900d8.camel@suse.com>
	<20200702031449.GB29962@octiron.msp.redhat.com>
	<8158d509bca2cae483d553defdd1eb378c16d813.camel@suse.com>
	<20200702151829.GA11089@octiron.msp.redhat.com>
	<cd568c7aabaa102db8ef6ba8ceb87b96d62f632c.camel@suse.com>
	<20200702194128.GG11089@octiron.msp.redhat.com>
In-Reply-To: <20200702194128.GG11089@octiron.msp.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3
x-originating-ip: [94.218.227.113]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a98937a5-fe4a-4ee0-599c-08d81f638fc9
x-ms-traffictypediagnostic: DB8PR04MB5865:
x-microsoft-antispam-prvs: <DB8PR04MB58657847B99C9CD827917361FC6A0@DB8PR04MB5865.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 045315E1EE
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cknbPFtN6IGyP1jXQOXBbTYsU5zFkNeJcc6ukZW555DA1BnrUgvXA7Vh6LbxnialIZh8Zwf/6Q1hwKlsmw9R1EVb8kGNAJLnMBXNLA+4/1WVm3BqabWWEzR9KLxlRsj/VP222M4i3QWo8seHskV845XXJ9ugiLMOCkYwRn6NTky5peAKqJjtC9thKhYA31g+boV1MDz+gD75Z6jmlgdTmOTdq9KgyVogTLVh3CY+YT6aUIPgaAC7xWX3G8+bojw/FqSvmOZvbdLgEe8QOhoDhkLpDXqCty9bo9OYggeT7VBZWVZJPspO4nDok08gTEI3bYhRk3b6u5pG1id6e+tyrw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(39860400002)(136003)(346002)(396003)(376002)(366004)(6916009)(66574015)(8676002)(450100002)(8936002)(478600001)(5660300002)(2906002)(2616005)(66946007)(71200400001)(76116006)(66476007)(66556008)(66446008)(6486002)(54906003)(64756008)(6512007)(26005)(186003)(91956017)(86362001)(316002)(36756003)(6506007)(83380400001)(4326008);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: uY6lmJ61I9nt5+PkjTeG7o6DjBj0kB0Qd0XiwR1GJ4/Bnq3ir3/Ye4pZ8D0XWgQTQIWN8LuzGcbyBFjCgu5o7sCydL4dshdrRVe4UDakGxDVQASC7khHjvXcINsKT5U9KC6C6YckFlPZUE+8R++VYK80TjpAkgPCdG5UxGxs//gA+byrQrtaByWC+HsCDhO+STUfnX3Ubj6MXoCL72B3caCXcE45kFOnUClgNKigB+0Miexy4gOCJ8d/DEGPilgIe3T1TO6SCYJiNkxnFGR5NIfT6k9tzaIJy4Q2W0KjGto+DeW7FBtIQ9OMfdpOmH8dERmgfmj9wuoZslEd3xpwaOgevhwOQmP25GjM5GR9neGjdr6ozH/LRSaTkhJyjbcbIu7SKJ2uys/h3nDmo5I1iPp17Cl5DKEJplnL3+rP/QoMGQUUM7I+d34WM+qHh/RSAWSlSCo39zOqxhqh9VRPLvNPtWKtqMFOS87zt8onR3lAgBSjJMnYNyYj809Vy2Ax
x-ms-exchange-transport-forked: True
Content-ID: <F721C18136F61A4398649A7210E2932C@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a98937a5-fe4a-4ee0-599c-08d81f638fc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2020 15:12:54.6076 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RucPHGb7dhpYxBXvO6SJ6hqcoBUGKZhSCiJq7pzdVADv1xqlqqv2ZRYwU2cWCQsj/EkqBSnZWHMb/8/EG3SQ8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5865
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 063FD4eV017601
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/7] Fix muitpath/multipathd flush issue
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-07-02 at 14:41 -0500, Benjamin Marzinski wrote:
> On Thu, Jul 02, 2020 at 04:45:21PM +0000, Martin Wilck wrote:
> >=20
> > What's wrong with deferred remove? After all, the user explicitly
> > asked
> > for a flush. As long as some other process has the device open, it
> > won't be removed. That's why I like the O_EXCL idea, which will
> > allow
> > small programs like blkid to access the device, but will cause all
> > attempts to mount or add stacked devices to fail until the device
> > is
> > actually removed. I see no reason no to do this, as it's a race
> > anyway
> > if some other process opens the device when we're supposed to flush
> > it
> > and the opencount already dropped to 0. By using O_EXCL, we just
> > increase multipathd's chances to win the race and do what the user
> > asked for.
>=20
> I'm not actually a fan of deferred remove in general. It leaves the
> device in this weird state were it is there but no longer openable.=20

Ok, I didn't expect that ;-)

AFAICS, devices in DEFERRED REMOVE state are actually still openable. I
just tested this once more on a 5.3 kernel.

As long as the device is opened by some process and thus not removed,
it can be opened by other processes, and is not deleted until the last
opener closes it. It's even possible to create new device mapper layers
like kpartx partitions on top of a DM device in DEFERRED REMOVE state.

> I
> wish I had originally dealt with deferred removes by having
> multipathd
> occasionally try to flush devices with no paths, or possibly listen
> for
> notifications that the device has been closed, and flush then.
>=20
> My specific objections here are that not all things that open a
> device
> for longer than an instant do so with O_EXCL.  So it's very possible
> that you run "multipath -F", it returns having removed a number of
> unused devices.  But some of the devices it didn't remove were opened
> without O_EXCL, and they will stick around for a while, and then
> suddenly disappear.  Even if they don't say around for that long,
> this
> is a can still effect scripts or other programs that are expecting to
> check the device state immediately after calling multipath -F, and
> having it not change a second or so later. So far multipath -f/-F
> will
> not return until it has removed all the removeable devices (and
> waited
> for them to be removed from udev). I think it should stay this way.

I see. That's a valid point. IMHO it'd be better if the kernel didn't
allow any new access to devices in "deferred remove" state, and
possibly sent a REMOVE uevent and hide the device immediately after the
deferred remove ioctl.=20

That would also be closer to how "lazy umount" (umount -l) behaves.
But I'm certainly overlooking some subtle semantic issues.=20

@Mike, Zdenek: perhaps you can explain why "deferred remove" behaves
like this?

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

