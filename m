Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E6622212355
	for <lists+dm-devel@lfdr.de>; Thu,  2 Jul 2020 14:29:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-Ur2tgmVKNreOPYG9A8Keng-1; Thu, 02 Jul 2020 08:29:46 -0400
X-MC-Unique: Ur2tgmVKNreOPYG9A8Keng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2A25EC1A6;
	Thu,  2 Jul 2020 12:29:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F5F82B5BB;
	Thu,  2 Jul 2020 12:29:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D8C0C180CB27;
	Thu,  2 Jul 2020 12:29:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 062COfBr020070 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 08:24:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 78B94207AD3D; Thu,  2 Jul 2020 12:24:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60195207AC6C
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 12:24:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A3C28007B3
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 12:24:38 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [62.140.7.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-99-qOYh6kdKMjS_kG-fOPs01Q-1;
	Thu, 02 Jul 2020 08:24:36 -0400
X-MC-Unique: qOYh6kdKMjS_kG-fOPs01Q-1
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
	(mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-18-kpIZHkAQMuWLGiqKbJop0A-1; Thu, 02 Jul 2020 14:24:34 +0200
X-MC-Unique: kpIZHkAQMuWLGiqKbJop0A-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB7PR04MB4620.eurprd04.prod.outlook.com (2603:10a6:5:39::28) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20;
	Thu, 2 Jul 2020 12:24:32 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593%3]) with mapi id 15.20.3131.035;
	Thu, 2 Jul 2020 12:24:32 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [dm-devel] [PATCH 0/7] Fix muitpath/multipathd flush issue
Thread-Index: AQHWRQbaV48I+cUSsEqBTrzd+h1sK6jeE96AgACYCACAACIPAIAAMiuAgBRJeACAAGo9gIAAmZaA
Date: Thu, 2 Jul 2020 12:24:32 +0000
Message-ID: <8158d509bca2cae483d553defdd1eb378c16d813.camel@suse.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<f60b8ea30ee0ce68a46ce8f5c9ebaee6314d57e4.camel@suse.com>
	<20200618180458.GI5894@octiron.msp.redhat.com>
	<c5e95e7bc75b11e811854ff0b0988ff19ef45e13.camel@suse.com>
	<20200618230625.GJ5894@octiron.msp.redhat.com>
	<5357998bd17e1147fd3a6615e03251d1aa4900d8.camel@suse.com>
	<20200702031449.GB29962@octiron.msp.redhat.com>
In-Reply-To: <20200702031449.GB29962@octiron.msp.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3
x-originating-ip: [94.218.227.113]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3bbbdac-6e35-4428-d1fa-08d81e82e009
x-ms-traffictypediagnostic: DB7PR04MB4620:
x-microsoft-antispam-prvs: <DB7PR04MB4620E18577E21984FDE8452BFC6D0@DB7PR04MB4620.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0452022BE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d7JKnHeQ/ddF/LBx444aHUAQZgRqESI51L1L0VR7qyjvHlhjDRslcp1PIDbgPqD0ljJYRMj2ykSlaD261T9qbVO5icmGwuIUyzMH4ul8F1fP9OAWLT2wr2n5dcrbKbIVhBAC5P52VJuWr+sC/Yx2klZPotmN4zwGY7iMHhjBR7p1eCJftHvc6lb7xLaoOLXcq+XBWXK7E6gu1VOe8hXM0gYsbhEKJeApB82zlxvhRojcL/p5ILJlQQGCpoVInWX8Vv5YlKWYMahn70HY3bPNkpbffADUSkaaHiMWhCs9j+dUHZvxAY/JVml1u9WGXHiW64omisx9NxoFcdyGC08snWb3JWW/zl+hHHnxeO7TIeT/OKWtr4iSQT1QZZ1EcWV4t1wANr/A6WYYWkiXsm9sNw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(136003)(366004)(39860400002)(346002)(396003)(376002)(6506007)(4326008)(2906002)(450100002)(966005)(316002)(6916009)(478600001)(6512007)(36756003)(6486002)(2616005)(71200400001)(5660300002)(26005)(186003)(66476007)(64756008)(66556008)(91956017)(8936002)(66446008)(66574015)(8676002)(76116006)(66946007)(86362001)(83380400001);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: vTtS5Pq/1gXZbAQjM8nn8HYjRHl86COGEi4I1iolghukWLgUXfVGSxcuSzqwC0bJXFeAlnRwS+xDeyb2/1UvQY5X1qmj0xYe5wympENoM/cMRWM2LdQFk8JWQMKcStxdNywyuQp2XfMezgBwfW+079v4ZD3FN+mmUgyDwV1B1QWTgA2yYPC84uPPEL4AmkWYTnHVx9jxYn1n1unSUaSmIof80JGC+LJtUu2kJViDa1U71Xm139YbshNiHhF+QjVzJahzs0duHP+1zetkBn+qnUtL1Rhj4akc0X+SABxjYC5N6YLucXjA0zxeE6UHOdJMsQkokn3i9uS4iCYu3z8HHbnX1+4UKMdrNU/W8hywIsmslt61jISvaL0f4Ze1p5FzFqHETX/od6HaFh8Vrd4ltnyC1CWw4YhzY3Jy8XCR10n5JQKrI5MEddA9b+jZj7rRsjW9AVk1LFR55CIVAOCzCAZhf1+3J3fJmg5QNSX+xYVZDe/No4h6nF9ByWW+Hrdz
x-ms-exchange-transport-forked: True
Content-ID: <3BE20DCC9E0B6044B88AAA9FA846710F@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3bbbdac-6e35-4428-d1fa-08d81e82e009
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2020 12:24:32.5337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Lbw/j53ubWp6ZAVTe/DEiI7eeZ7tLTxqxuni1YO5KHheMHCos4zSNcZlCiIWZ2IPZij14y/gzRfmLh6YAbRgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4620
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 062COfBr020070
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-07-01 at 22:14 -0500, Benjamin Marzinski wrote:
> On Wed, Jul 01, 2020 at 10:54:34PM +0200, Martin Wilck wrote:
> > On Thu, 2020-06-18 at 18:06 -0500, Benjamin Marzinski wrote:
> > > I uploaded the test program, aio_test:
> > >=20
> > > https://github.com/bmarzins/test_programs.git
> > >=20
> > > You just need to run in on a queueing multipath device with no
> > > active
> > > paths and an open count of 0. It will hang with the device open.
> > > Restore
> > > a path, and it will exit, and the open count will go to 0.
> >=20
> > Tried it now, it behaves as you say. I admit I can't imagine how
> > the
> > suspend/resume would improve anything here. Indeed, as you say, it
> > opens=20
> > up a race window. Another process might open the device while
> > it's suspended. Worse perhaps, once the device is resumed, an
> > uevent will be=20
> > generated, and stacked devices might (in principle at least) be
> > recreated
> > before we get down to flush the map.
> >=20
> > MAYBE the suspend/resume was necessary in the past because some
> > earlier=20
> > kernels wouldn't immediately fail all outstanding commands when=20
> > queue_if_no_path was deactivated? (just speculating, I don't know
> > if this
> > is the case).
>=20
> If you disable queue_if_no_path and then do a suspend with flushing,
> you
> are guaranteed that the supend won't return until all the IO has
> completed or failed.

I just realized that if we suspend, we don't even need disable
queue_if_no_path, because the kernel does that automatically if a
"suspend with flush" is issued, and has been doing so basically
forever.

>   This would allow anything that was waiting on
> queued IO to have the IO failback, which could allow it to close the
> device in time for multipath to be able to remove it (obviously this
> is
> racey).  However, this assumes that you do your open checks after the
> suspend, which multipath no longer does.
>  I realize that multipath can't
> suspend until after it tries to remove the partition devices,
> otherwise
> those can get stuck. But there probably is some order that gets this
> all
> right-ish.

Our code is currently racy. IMO we should

 0 unset queue_if_no_path
 1 remove partition mappings
 2 open(O_EXCL|O_RDONLY) the device
 3 If this fails, in multipath, try again after a suspend/resume cycle.
   In multipathd, I think we should just fail for now; perhaps later
   we could handle the explicit "remove map" command like multipath.
 4 If it fails again, bail out (in multipath, retry if asked to do so)
 5 run a "deferred remove" ioctl
 6 close the fd, the dm device will now be removed "atomically".

This cuts down the race window to the minimum possible - after (2), no
mounts / kpartx / lvm operations won't be possible any more.

When we remove the partition mappings, we could use the same technique
to avoid races on that layer. Unfortunately, a pending "deferred
remove" operation doesn't cause new open() or mount() calls to fail; if
it did, we could use a simpler approach.

> So, for a while now, the suspending has been doing nothing for
> us.  We
> could either try to reorder things so that we actually try to flush
> the
> queued IOs back first (with or without suspending), or we could just
> remove suspending and say that things are working fine the way they
> currently are.

What else can we do except suspend/resume to avoid racing with pending
close(), umount() or similar operations? Well, I guess if we open the
device anyway as I proposed, we could do an fsync() on it. That might
actually be better because it avoids the uevent being sent on resume.

We definitely can't suspend the map before we remove the partitions. We
could try a suspend/resume on the partition devices themselves (or
fsync()) if the opencount is > 0.

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

