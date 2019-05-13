Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D13271BB9B
	for <lists+dm-devel@lfdr.de>; Mon, 13 May 2019 19:15:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C6F081DFE;
	Mon, 13 May 2019 17:15:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABE2810018E0;
	Mon, 13 May 2019 17:15:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9F33B41F58;
	Mon, 13 May 2019 17:15:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4DHFN9I000975 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 May 2019 13:15:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 74AE71902C; Mon, 13 May 2019 17:15:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95F3F18E51;
	Mon, 13 May 2019 17:15:20 +0000 (UTC)
Date: Mon, 13 May 2019 13:15:19 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20190513171519.GA26166@redhat.com>
References: <CAD=FV=VOAjgdrvkK8YKPP-8zqwPpo39rA43JH2BCeYLB0UkgAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=VOAjgdrvkK8YKPP-8zqwPpo39rA43JH2BCeYLB0UkgAQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Vito Caputo <vcaputo@pengaru.com>, LKML <linux-kernel@vger.kernel.org>,
	Tim Murray <timmurray@google.com>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	dm-devel@redhat.com, Guenter Roeck <groeck@chromium.org>, tj@kernel.org
Subject: Re: [dm-devel] Problems caused by dm crypt: use WQ_HIGHPRI for the
 IO and crypt workqueues
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Mon, 13 May 2019 17:15:41 +0000 (UTC)

On Mon, May 13 2019 at 12:18pm -0400,
Doug Anderson <dianders@chromium.org> wrote:

> Hi,
> 
> I wanted to jump on the bandwagon of people reporting problems with
> commit a1b89132dc4f ("dm crypt: use WQ_HIGHPRI for the IO and crypt
> workqueues").
> 
> Specifically I've been tracking down communication errors when talking
> to our Embedded Controller (EC) over SPI.  I found that communication
> errors happened _much_ more frequently on newer kernels than older
> ones.  Using ftrace I managed to track the problem down to the dm
> crypt patch.  ...and, indeed, reverting that patch gets rid of the
> vast majority of my errors.
> 
> If you want to see the ftrace of my high priority worker getting
> blocked for 7.5 ms, you can see:
> 
> https://bugs.chromium.org/p/chromium/issues/attachmentText?aid=392715
> 
> 
> In my case I'm looking at solving my problems by bumping the CrOS EC
> transfers fully up to real time priority.  ...but given that there are
> other reports of problems with the dm-crypt priority (notably I found
> https://bugzilla.kernel.org/show_bug.cgi?id=199857) maybe we should
> also come up with a different solution for dm-crypt?
> 

And chance you can test how behaviour changes if you remove
WQ_CPU_INTENSIVE? e.g.:

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 692cddf3fe2a..c97d5d807311 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -2827,8 +2827,7 @@ static int crypt_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 
 	ret = -ENOMEM;
 	cc->io_queue = alloc_workqueue("kcryptd_io/%s",
-				       WQ_HIGHPRI | WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM,
-				       1, devname);
+				       WQ_HIGHPRI | WQ_MEM_RECLAIM, 1, devname);
 	if (!cc->io_queue) {
 		ti->error = "Couldn't create kcryptd io queue";
 		goto bad;
@@ -2836,11 +2835,10 @@ static int crypt_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 
 	if (test_bit(DM_CRYPT_SAME_CPU, &cc->flags))
 		cc->crypt_queue = alloc_workqueue("kcryptd/%s",
-						  WQ_HIGHPRI | WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM,
-						  1, devname);
+						  WQ_HIGHPRI | WQ_MEM_RECLAIM, 1, devname);
 	else
 		cc->crypt_queue = alloc_workqueue("kcryptd/%s",
-						  WQ_HIGHPRI | WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM | WQ_UNBOUND,
+						  WQ_HIGHPRI | WQ_MEM_RECLAIM | WQ_UNBOUND,
 						  num_online_cpus(), devname);
 	if (!cc->crypt_queue) {
 		ti->error = "Couldn't create kcryptd queue";

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
