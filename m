Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E718C32F22D
	for <lists+dm-devel@lfdr.de>; Fri,  5 Mar 2021 19:10:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614967809;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=17unMIvcyxLQrcIwWXt+5UZzj2j6H8JC/LDRGEN1w/w=;
	b=R6iFTLBG6ERsHsqXtF92UpQo2cQ/Q94ZOtoVoFkDlWvffoe1TWjuM/Fq3bCnDaYql2rCFY
	/o9VreN9Ic9ydndUCuQKxMJ51v6kOkqzB5z6EV+Sr18tRSbd8ZOXeuu30Pd8vZPnAkf2rG
	gpIGmL+IJlwY0wKjiNyky3Vy+UL9dR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-8ED5jyxvM0i_XQUYUPAQKA-1; Fri, 05 Mar 2021 13:10:06 -0500
X-MC-Unique: 8ED5jyxvM0i_XQUYUPAQKA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9F8D8015A0;
	Fri,  5 Mar 2021 18:10:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D273C6B8DC;
	Fri,  5 Mar 2021 18:09:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5BA451809C86;
	Fri,  5 Mar 2021 18:09:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 125I9iTX025430 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 5 Mar 2021 13:09:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 62DCF10550BA; Fri,  5 Mar 2021 18:09:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8FDC10023B2;
	Fri,  5 Mar 2021 18:09:38 +0000 (UTC)
Date: Fri, 5 Mar 2021 13:09:38 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <20210305180938.GA21127@redhat.com>
References: <20210302190555.201228400@debian-a64.vm>
	<33fa121a-88a8-5c27-0a43-a7efc9b5b3e3@linux.alibaba.com>
	<alpine.LRH.2.02.2103030505460.29593@file01.intranet.prod.int.rdu2.redhat.com>
	<157a750d-3d58-ae2e-07f1-b677c1b471c7@linux.alibaba.com>
	<bd447632-f174-e6f2-ddf8-d5385da13f6b@redhat.com>
	<fc9707dc-0a21-90d3-ed4f-e201406c50eb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fc9707dc-0a21-90d3-ed4f-e201406c50eb@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, caspar@linux.alibaba.com, io-uring@vger.kernel.org,
	linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
	JeffleXu <jefflexu@linux.alibaba.com>, hch@lst.de
Subject: Re: [dm-devel] [PATCH 4/4] dm: support I/O polling
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 05 2021 at 12:56pm -0500,
Heinz Mauelshagen <heinzm@redhat.com> wrote:

>=20
> On 3/5/21 6:46 PM, Heinz Mauelshagen wrote:
> >On 3/5/21 10:52 AM, JeffleXu wrote:
> >>
> >>On 3/3/21 6:09 PM, Mikulas Patocka wrote:
> >>>
> >>>On Wed, 3 Mar 2021, JeffleXu wrote:
> >>>
> >>>>
> >>>>On 3/3/21 3:05 AM, Mikulas Patocka wrote:
> >>>>
> >>>>>Support I/O polling if submit_bio_noacct_mq_direct returned non-empt=
y
> >>>>>cookie.
> >>>>>
> >>>>>Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> >>>>>
> >>>>>---
> >>>>>=A0 drivers/md/dm.c |=A0=A0=A0 5 +++++
> >>>>>=A0 1 file changed, 5 insertions(+)
> >>>>>
> >>>>>Index: linux-2.6/drivers/md/dm.c
> >>>>>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>>--- linux-2.6.orig/drivers/md/dm.c=A0=A0=A0 2021-03-02
> >>>>>19:26:34.000000000 +0100
> >>>>>+++ linux-2.6/drivers/md/dm.c=A0=A0=A0 2021-03-02 19:26:34.000000000=
 +0100
> >>>>>@@ -1682,6 +1682,11 @@ static void __split_and_process_bio(stru
> >>>>>=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> >>>>>=A0=A0=A0=A0=A0 }
> >>>>>=A0 +=A0=A0=A0 if (ci.poll_cookie !=3D BLK_QC_T_NONE) {
> >>>>>+=A0=A0=A0=A0=A0=A0=A0 while (atomic_read(&ci.io->io_count) > 1 &&
> >>>>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 blk_poll(ci.poll_queue, =
ci.poll_cookie, true)) ;
> >>>>>+=A0=A0=A0 }
> >>>>>+
> >>>>>=A0=A0=A0=A0=A0 /* drop the extra reference count */
> >>>>>=A0=A0=A0=A0=A0 dec_pending(ci.io, errno_to_blk_status(error));
> >>>>>=A0 }
> >>>>It seems that the general idea of your design is to
> >>>>1) submit *one* split bio
> >>>>2) blk_poll(), waiting the previously submitted split bio complets
> >>>No, I submit all the bios and poll for the last one.
> >>>
> >>>>and then submit next split bio, repeating the above process.
> >>>>I'm afraid
> >>>>the performance may be an issue here, since the batch every time
> >>>>blk_poll() reaps may decrease.
> >>>Could you benchmark it?
> >>I only tested dm-linear.
> >>
> >>The configuration (dm table) of dm-linear is:
> >>0 1048576 linear /dev/nvme0n1 0
> >>1048576 1048576 linear /dev/nvme2n1 0
> >>2097152 1048576 linear /dev/nvme5n1 0
> >>
> >>
> >>fio script used is:
> >>```
> >>$cat fio.conf
> >>[global]
> >>name=3Diouring-sqpoll-iopoll-1
> >>ioengine=3Dio_uring
> >>iodepth=3D128
> >>numjobs=3D1
> >>thread
> >>rw=3Drandread
> >>direct=3D1
> >>registerfiles=3D1
> >>hipri=3D1
> >>runtime=3D10
> >>time_based
> >>group_reporting
> >>randrepeat=3D0
> >>filename=3D/dev/mapper/testdev
> >>bs=3D4k
> >>
> >>[job-1]
> >>cpus_allowed=3D14
> >>```
> >>
> >>IOPS (IRQ mode) | IOPS (iopoll mode (hipri=3D1))
> >>--------------- | --------------------
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 213k |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
19k
> >>
> >>At least, it doesn't work well with io_uring interface.
> >>
> >>
> >
> >
> >Jeffle,
> >
> >I ran your above fio test on a linear LV split across 3 NVMes to
> >second your split mapping
> >(system: 32 core Intel, 256GiB RAM) comparing io engines sync,
> >libaio and io_uring,
> >the latter w/ and w/o hipri (sync+libaio obviously w/o
> >registerfiles and hipri) which resulted ok:
> >
> >
> >
> >sync=A0 |=A0 libaio=A0 |=A0 IRQ mode (hipri=3D0) | iopoll (hipri=3D1)
> >------|----------|---------------------|----------------- 56.3K
> >|=A0=A0=A0 290K=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 329K |=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 351K I can't second
> >your drastic hipri=3D1 drop here...
>=20
>=20
> Sorry, email mess.
>=20
>=20
> sync =A0 |=A0 libaio=A0 |=A0 IRQ mode (hipri=3D0) | iopoll (hipri=3D1)
> -------|----------|---------------------|-----------------
> 56.3K=A0 |=A0=A0=A0 290K=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 329K |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 351K
>=20
>=20
>=20
> I can't second your drastic hipri=3D1 drop here...

I think your result is just showcasing your powerful system's ability to
poll every related HW queue.. whereas Jeffle's system is likely somehow
more constrained (on a cpu level, memory, whatever).

My basis for this is that Mikulas' changes simply always return an
invalid cookie (BLK_QC_T_NONE) for purposes of intelligent IO polling.

Such an implementation is completely invalid.

I discussed with Jens and he said:
"it needs to return something that f_op->iopoll() can make sense of.
otherwise you have no option but to try everything."

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

