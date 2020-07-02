Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C8A4B2129FB
	for <lists+dm-devel@lfdr.de>; Thu,  2 Jul 2020 18:45:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-7sZM__osOzW6q6clo-Ibog-1; Thu, 02 Jul 2020 12:45:54 -0400
X-MC-Unique: 7sZM__osOzW6q6clo-Ibog-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6463313E9C3;
	Thu,  2 Jul 2020 16:45:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 373D35C1C5;
	Thu,  2 Jul 2020 16:45:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA3056C9C6;
	Thu,  2 Jul 2020 16:45:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 062GjUPb030633 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 12:45:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 39C76207ADFE; Thu,  2 Jul 2020 16:45:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33F97207AEB9
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 16:45:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C70E2185A78B
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 16:45:27 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [62.140.7.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-478-ADg0jVMsOMq-apcsmzdisw-1;
	Thu, 02 Jul 2020 12:45:25 -0400
X-MC-Unique: ADg0jVMsOMq-apcsmzdisw-1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-26-DaRz32UPPTGuHeeoolWArQ-1; Thu, 02 Jul 2020 18:45:23 +0200
X-MC-Unique: DaRz32UPPTGuHeeoolWArQ-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB8PR04MB6476.eurprd04.prod.outlook.com (2603:10a6:10:104::32)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23;
	Thu, 2 Jul 2020 16:45:22 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593%3]) with mapi id 15.20.3131.035;
	Thu, 2 Jul 2020 16:45:22 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [dm-devel] [PATCH 0/7] Fix muitpath/multipathd flush issue
Thread-Index: AQHWRQbaV48I+cUSsEqBTrzd+h1sK6jeE96AgACYCACAACIPAIAAMiuAgBRJeACAAGo9gIAAmZaAgAAwm4CAABhEAA==
Date: Thu, 2 Jul 2020 16:45:21 +0000
Message-ID: <cd568c7aabaa102db8ef6ba8ceb87b96d62f632c.camel@suse.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<f60b8ea30ee0ce68a46ce8f5c9ebaee6314d57e4.camel@suse.com>
	<20200618180458.GI5894@octiron.msp.redhat.com>
	<c5e95e7bc75b11e811854ff0b0988ff19ef45e13.camel@suse.com>
	<20200618230625.GJ5894@octiron.msp.redhat.com>
	<5357998bd17e1147fd3a6615e03251d1aa4900d8.camel@suse.com>
	<20200702031449.GB29962@octiron.msp.redhat.com>
	<8158d509bca2cae483d553defdd1eb378c16d813.camel@suse.com>
	<20200702151829.GA11089@octiron.msp.redhat.com>
In-Reply-To: <20200702151829.GA11089@octiron.msp.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3
x-originating-ip: [94.218.227.113]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5aa166c5-692d-47c1-0461-08d81ea74fd1
x-ms-traffictypediagnostic: DB8PR04MB6476:
x-microsoft-antispam-prvs: <DB8PR04MB6476F679400DCFA30B42BCFBFC6D0@DB8PR04MB6476.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0452022BE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jwDvf+FrNsXfywEpYzClVFUiOuHUncjNBoZffOqmndrIs6WNPcdi4LcHNsu4r6jQft9F+vOwneGhReIAb2ykQlt6qrUUvPhg84L2ubbbSOC5Kby5NIfSK4blMiSj4zbDpgvbmyMVYSzgW52o8cMBmyya7dmZ5LgYYkkv2AbVMn9KvVQ66LCItQXXcOEpwdX/+viaYScC8jNUsdapfKmFIjl1oPWbm1QEak4WcTTMi1Hb3BJ9h/ZycImWxOM3T+2uKC8OiNncaS97vP9ElEhh1a7qNTeHllvqIwiOqFMvhKf0NJpdkcDUuwpawA/hL6lAiRHXwfp0eJLi1N4aN9YFiwjQo4Oh0IgzB7QlR0r18RwziFVuHnrmJLeksAJmiC+vX753gh6ix5qyOzzLYduA4w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(396003)(376002)(136003)(39860400002)(346002)(366004)(71200400001)(26005)(478600001)(36756003)(6486002)(186003)(8936002)(2906002)(86362001)(66446008)(316002)(64756008)(5660300002)(6506007)(66556008)(83380400001)(66476007)(66946007)(2616005)(8676002)(4326008)(6916009)(91956017)(76116006)(450100002)(6512007)(966005);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: JKev/8J6UpUBVg+zHu2YH09HsXUTm8N5fNQXs7REbFIyZ2rFQqyKRL2oW6eo44g7OSG1rwv+i5d2w0bf5juG9XOJF7/FTYXie8J6ETLFzWCp7Q4YAl3OFl0HCJWPYv3bm2WFCpiPuRdFX7tRiK0VaNpkDtSx4ZFLJrQ2dQV1lzUxOEaBDKJ7GTuay0w9lT0ZL+rI71xc2xD8oiwFerBksjR6SMaXeDJw7YVPA2Z8xqU7LGg4Oy8qgrRfSGoSL5lUnjCH2CyhuNEBVcLD4YYxnHiwelLaWlKJ+owtioXa6Q6vsh9ZyPhsJw2WlP03LoA/EHaTOrp7KXpLdg4VhHbbwHwG1/+GCP8BH8Wxmpea+eKLUq91jfo/UbJWXa1G+n7KlLoIArSrgl+y2WiZceVuycwq7flfwfSwYjeFQ7wGlHc37N/mO9shH96Hj4Kl+iuPoG6GEkPDmyCVrpopBgZT5d0nR4zMnwr8E4blG2B7PTmTxxNGeLp5R4ViE55q2mWM
x-ms-exchange-transport-forked: True
Content-ID: <1883E6D4452DB44ABBE8A6AC5990AF16@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa166c5-692d-47c1-0461-08d81ea74fd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2020 16:45:21.9625 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J4z/r4ZwEsICrSImdeeanaVc1BlfLz7gM2DXUgvfirjBUDG1dydKOjqJhc8p/L6LLOQ+XvxQtlXch/Ge8m9YEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6476
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 062GjUPb030633
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-07-02 at 10:18 -0500, Benjamin Marzinski wrote:
> On Thu, Jul 02, 2020 at 12:24:32PM +0000, Martin Wilck wrote:
> > On Wed, 2020-07-01 at 22:14 -0500, Benjamin Marzinski wrote:
> > > On Wed, Jul 01, 2020 at 10:54:34PM +0200, Martin Wilck wrote:
> > > > On Thu, 2020-06-18 at 18:06 -0500, Benjamin Marzinski wrote:
> > > > > I uploaded the test program, aio_test:
> > > > > 
> > > > > https://github.com/bmarzins/test_programs.git
> > > > > 
> > > > > You just need to run in on a queueing multipath device with
> > > > > no
> > > > > active
> > > > > paths and an open count of 0. It will hang with the device
> > > > > open.
> > > > > Restore
> > > > > a path, and it will exit, and the open count will go to 0.
> > > > 
> > > > Tried it now, it behaves as you say. I admit I can't imagine
> > > > how
> > > > the
> > > > suspend/resume would improve anything here. Indeed, as you say,
> > > > it
> > > > opens 
> > > > up a race window. Another process might open the device while
> > > > it's suspended. Worse perhaps, once the device is resumed, an
> > > > uevent will be 
> > > > generated, and stacked devices might (in principle at least) be
> > > > recreated
> > > > before we get down to flush the map.
> > > > 
> > > > MAYBE the suspend/resume was necessary in the past because some
> > > > earlier 
> > > > kernels wouldn't immediately fail all outstanding commands
> > > > when 
> > > > queue_if_no_path was deactivated? (just speculating, I don't
> > > > know
> > > > if this
> > > > is the case).
> > > 
> > > If you disable queue_if_no_path and then do a suspend with
> > > flushing,
> > > you
> > > are guaranteed that the supend won't return until all the IO has
> > > completed or failed.
> > 
> > I just realized that if we suspend, we don't even need disable
> > queue_if_no_path, because the kernel does that automatically if a
> > "suspend with flush" is issued, and has been doing so basically
> > forever.
> > 
> > >   This would allow anything that was waiting on
> > > queued IO to have the IO failback, which could allow it to close
> > > the
> > > device in time for multipath to be able to remove it (obviously
> > > this
> > > is
> > > racey).  However, this assumes that you do your open checks after
> > > the
> > > suspend, which multipath no longer does.
> > >  I realize that multipath can't
> > > suspend until after it tries to remove the partition devices,
> > > otherwise
> > > those can get stuck. But there probably is some order that gets
> > > this
> > > all
> > > right-ish.
> > 
> > Our code is currently racy. IMO we should
> > 
> >  0 unset queue_if_no_path
> >  1 remove partition mappings
> >  2 open(O_EXCL|O_RDONLY) the device
> >  3 If this fails, in multipath, try again after a suspend/resume
> > cycle.
> >    In multipathd, I think we should just fail for now; perhaps
> > later
> >    we could handle the explicit "remove map" command like
> > multipath.
> >  4 If it fails again, bail out (in multipath, retry if asked to do
> > so)
> >  5 run a "deferred remove" ioctl
> >  6 close the fd, the dm device will now be removed "atomically".
> > 
> > This cuts down the race window to the minimum possible - after (2),
> > no
> > mounts / kpartx / lvm operations won't be possible any more.
> 
> I wasn't actually worried about someone wanting to use the device. In
> that case the remove should fail.  I was worried about things that
> would
> close the device, but couldn't because of queued IO.  
> The race I was
> talking about is that after whatever has the device open gets the IO
> error, it might not close the device before multipath checks the open
> count.

Understood.

> Also, I'm not sure that resume helps us, since that will trigger
> uevents, which will open the device again.

Not sure if I understand correctly: It's possible to just suspend/flush
and then remove the device, without resuming. But that's dangerous,
because if some process opens the device while it's resumed, even if
it's just for reading a single block (think blkid), the open will
succeed, the IO will hang, the opencount will be increased, and the
REMOVE ioctl will fail. Therefore I think *if* we suspend we should
also resume. But I concur wrt the uevent, of course.

> > When we remove the partition mappings, we could use the same
> > technique
> > to avoid races on that layer. Unfortunately, a pending "deferred
> > remove" operation doesn't cause new open() or mount() calls to
> > fail; if
> > it did, we could use a simpler approach.
> > 
> > > So, for a while now, the suspending has been doing nothing for
> > > us.  We
> > > could either try to reorder things so that we actually try to
> > > flush
> > > the
> > > queued IOs back first (with or without suspending), or we could
> > > just
> > > remove suspending and say that things are working fine the way
> > > they
> > > currently are.
> > 
> > What else can we do except suspend/resume to avoid racing with
> > pending
> > close(), umount() or similar operations? Well, I guess if we open
> > the
> > device anyway as I proposed, we could do an fsync() on it. That
> > might
> > actually be better because it avoids the uevent being sent on
> > resume.
> 
> yeah. I think that simply disabling queueing and doing an fsync() is
> probably better than suspending. If new IO comes in after that, then
> something IS using the device, and we don't want to remove it. In
> multipath, maybe:
> 
> 1. disable queueing
> 2. remove partition mappings
> 3. open device
> 4. flush
> 5. check if we are the only opener.
> 	If not, and there are retries left... goto 4? sleep and
> recheck?
> 	we don't want to wait if the answer is that they device really
> 	is in use.
> 6. close device
> 7. remove device
> 
> Possibly the solution to not wanting to wait when a device is in use
> is
> that we could add an option to multipath to distinguish between the
> way
> flushing works now, where we check early if the device is in use, and
> just bail if it is, and a more aggressive attempt at remove that
> might
> take longer if used on devices that are in use.

What's wrong with deferred remove? After all, the user explicitly asked
for a flush. As long as some other process has the device open, it
won't be removed. That's why I like the O_EXCL idea, which will allow
small programs like blkid to access the device, but will cause all
attempts to mount or add stacked devices to fail until the device is
actually removed. I see no reason no to do this, as it's a race anyway
if some other process opens the device when we're supposed to flush it
and the opencount already dropped to 0. By using O_EXCL, we just
increase multipathd's chances to win the race and do what the user
asked for.

To make sure we're on the same boat: this is a topic for a separate
patch set IMO, I'm not expecting you to fix it in a v3.

Cheers,
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

