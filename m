Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F1CD28AD
	for <lists+dm-devel@lfdr.de>; Thu, 10 Oct 2019 14:04:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 28196190C030;
	Thu, 10 Oct 2019 12:04:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2C125DC1E;
	Thu, 10 Oct 2019 12:04:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC4ED1803517;
	Thu, 10 Oct 2019 12:04:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9AC42UU015369 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Oct 2019 08:04:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8EB3A60BF4; Thu, 10 Oct 2019 12:04:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87C8160BE1
	for <dm-devel@redhat.com>; Thu, 10 Oct 2019 12:04:02 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B5E1965F4B
	for <dm-devel@redhat.com>; Thu, 10 Oct 2019 12:04:00 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f22so6498670wmc.2
	for <dm-devel@redhat.com>; Thu, 10 Oct 2019 05:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=YwX4Bs/6u7BTZ/jTQVuwi4gnRh8Xxd95tonq1NFRFfs=;
	b=uo5oW59657/AL5dVpYe/m58ExmMpMBQExMlklxpYYgd386FlgktRGreGewjtAH6NRi
	t97AX5dJkZGkwaUHV1Iy/1NDFoJQbFGAEpgpJpfA0nJJ2HlLnIkPAGn7taeXSMl03I33
	nxids19Mk08W0mTGBDJ77/friqS9ySvrK8w5+d/TSnuf767CtS3w0X1uAwTpQfkLvgBG
	csVk1SGEtFKqta9ycGhgNgxyvDVKyfuLTMa10MTAfqTw3yaUm5rzHNRyi1bcHKj1Eskk
	/HPEfVM5ghRwf65Tn0h/Y8F/OcxqT1xit38yU98BKEPDu6v9tnFuxSRUNsHG8R/85b1u
	5J9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=YwX4Bs/6u7BTZ/jTQVuwi4gnRh8Xxd95tonq1NFRFfs=;
	b=uGFKxM1SZG2M0RVUJAiyNJjswFRoCkmu4+kjgQ6YG+ckCTA753IJ0p4q0wZZjMLjVc
	uWvy+MKxOQVjmAtgjw+GO6zqbGs/JOUBi3VPaJ26rNjBtcX/tYlaQAn0cIwQjwyIRzoS
	EIHottgOj57YNvlubempFgQP1NDTqP39mfdWWYlZRr3xhOPnUTMtcx5RZK5q9TOGvnkx
	KrxX+aYQ3aYLzrv5UNbSl2SAI+Qh0UhtvQBfBG8f1MH3DIpDW0HVQ8fvUYrfa+Dt6zXC
	WM6xrOLQKvB3c3iGOxFLpSGOIA4oVzd2B8uGrS8y0CNRoL4gf+Pp8copOELfr5k2+0jV
	fKuQ==
X-Gm-Message-State: APjAAAX9Y5LVYZFiIP3TunMMziV/nRDjr0qnE9LFjfPhQ4yzmE1AOdy7
	59d7DzkWT0FN2KrSqpRVXm/apw==
X-Google-Smtp-Source: APXvYqz40X/eqKbHLDjJVhSKpX6oIHXto72jiEYNlAqit2pp/T/n63SVEYFOM3uF1I1nOukP979Qjw==
X-Received: by 2002:a1c:9d4a:: with SMTP id g71mr7804651wme.26.1570709039384; 
	Thu, 10 Oct 2019 05:03:59 -0700 (PDT)
Received: from [10.94.250.119] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	r10sm6913687wml.46.2019.10.10.05.03.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Oct 2019 05:03:58 -0700 (PDT)
To: Guruswamy Basavaiah <guru2018@gmail.com>, Mike Snitzer <snitzer@redhat.com>
References: <CAHSpA58dehDfou0ogCYnkziBt4oU5yo1SGHLhJb7vFKy9HhJPQ@mail.gmail.com>
	<db9a2b56-244b-1285-208c-14944f559f36@arrikto.com>
	<CAHSpA58H_Vuhub6Eqqmi2QZ2g4AAUX8KCCUMzMvyc87hDaVDKg@mail.gmail.com>
	<1b2b06a1-0b68-c265-e211-48273f26efaf@arrikto.com>
	<CAHSpA59rG7qhEDjtUUTNv5evyWHS_iTL0o8utRCr9MQvMDsEgw@mail.gmail.com>
	<e15bb4d9-d19b-f954-f71d-2985dd6e455a@arrikto.com>
	<20191009141308.GA1670@redhat.com>
	<d6aaebd8-ed3e-2e6a-14ea-33bf023ee4bb@arrikto.com>
	<20191009160446.GA2284@redhat.com>
	<CAHSpA59T+JCR+_3ZCYShXa6GtQddAcaQE0OP5GWbSEG0qMAQOg@mail.gmail.com>
	<CAHSpA5_miJX74Th-_hinLr_q-sVR2G3M-_aS2c2fJBSr1eDnfg@mail.gmail.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <ecf3c2cc-a0c0-ec34-7a74-8d715f774df9@arrikto.com>
Date: Thu, 10 Oct 2019 15:03:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAHSpA5_miJX74Th-_hinLr_q-sVR2G3M-_aS2c2fJBSr1eDnfg@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------AA5F9247E26B92ACF447464E"
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 10 Oct 2019 12:04:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Thu, 10 Oct 2019 12:04:01 +0000 (UTC) for IP:'209.85.128.66'
	DOMAIN:'mail-wm1-f66.google.com' HELO:'mail-wm1-f66.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: -0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.66 mail-wm1-f66.google.com 209.85.128.66
	mail-wm1-f66.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, agk@redhat.com, iliastsi@arrikto.com
Subject: Re: [dm-devel] Fix "dm kcopyd: Fix bug causing workqueue stalls"
 causes dead lock
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Thu, 10 Oct 2019 12:04:27 +0000 (UTC)

This is a multi-part message in MIME format.
--------------AA5F9247E26B92ACF447464E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 10/10/19 9:34 AM, Guruswamy Basavaiah wrote:
> Hello,
> We use 4.4.184 in our builds and the patch fails to apply.
> Is it possible to give a patch for 4.4.x branch ?
Hi Guru,

I attach the two patches fixing the deadlock rebased on the 4.4.x branch.

Nikos

> 
> patching Logs.
> patching file drivers/md/dm-snap.c
> Hunk #1 succeeded at 19 (offset 1 line).
> Hunk #2 succeeded at 105 (offset -1 lines).
> Hunk #3 succeeded at 157 (offset -4 lines).
> Hunk #4 succeeded at 1206 (offset -120 lines).
> Hunk #5 FAILED at 1508.
> Hunk #6 succeeded at 1412 (offset -124 lines).
> Hunk #7 succeeded at 1425 (offset -124 lines).
> Hunk #8 FAILED at 1925.
> Hunk #9 succeeded at 1866 with fuzz 2 (offset -255 lines).
> Hunk #10 succeeded at 2202 (offset -294 lines).
> Hunk #11 succeeded at 2332 (offset -294 lines).
> 2 out of 11 hunks FAILED -- saving rejects to file drivers/md/dm-snap.c.rej
> 
> Guru
> 
> On Thu, 10 Oct 2019 at 01:33, Guruswamy Basavaiah <guru2018@gmail.com> wrote:
>>
>> Hello Mike,
>>  I will get the testing result before end of Thursday.
>> Guru
>>
>> On Wed, 9 Oct 2019 at 21:34, Mike Snitzer <snitzer@redhat.com> wrote:
>>>
>>> On Wed, Oct 09 2019 at 11:44am -0400,
>>> Nikos Tsironis <ntsironis@arrikto.com> wrote:
>>>
>>>> On 10/9/19 5:13 PM, Mike Snitzer wrote:> On Tue, Oct 01 2019 at  8:43am -0400,
>>>>> Nikos Tsironis <ntsironis@arrikto.com> wrote:
>>>>>
>>>>>> On 10/1/19 3:27 PM, Guruswamy Basavaiah wrote:
>>>>>>> Hello Nikos,
>>>>>>>  Yes, issue is consistently reproducible with us, in a particular
>>>>>>> set-up and test case.
>>>>>>>  I will get the access to set-up next week, will try to test and let
>>>>>>> you know the results before end of next week.
>>>>>>>
>>>>>>
>>>>>> That sounds great!
>>>>>>
>>>>>> Thanks a lot,
>>>>>> Nikos
>>>>>
>>>>> Hi Guru,
>>>>>
>>>>> Any chance you could try this fix that I've staged to send to Linus?
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.4&id=633b1613b2a49304743c18314bb6e6465c21fd8a
>>>>>
>>>>> Shiort of that, Nikos: do you happen to have a test scenario that teases
>>>>> out this deadlock?
>>>>>
>>>>
>>>> Hi Mike,
>>>>
>>>> Yes,
>>>>
>>>> I created a 50G LV and took a snapshot of the same size:
>>>>
>>>>   lvcreate -n data-lv -L50G testvg
>>>>   lvcreate -n snap-lv -L50G -s testvg/data-lv
>>>>
>>>> Then I ran the following fio job:
>>>>
>>>> [global]
>>>> randrepeat=1
>>>> ioengine=libaio
>>>> bs=1M
>>>> size=6G
>>>> offset_increment=6G
>>>> numjobs=8
>>>> direct=1
>>>> iodepth=32
>>>> group_reporting
>>>> filename=/dev/testvg/data-lv
>>>>
>>>> [test]
>>>> rw=write
>>>> timeout=180
>>>>
>>>> , concurrently with the following script:
>>>>
>>>> lvcreate -n dummy-lv -L1G testvg
>>>>
>>>> while true
>>>> do
>>>>  lvcreate -n dummy-snap -L1M -s testvg/dummy-lv
>>>>  lvremove -f testvg/dummy-snap
>>>> done
>>>>
>>>> This reproduced the deadlock for me. I also ran 'echo 30 >
>>>> /proc/sys/kernel/hung_task_timeout_secs', to reduce the hung task
>>>> timeout.
>>>>
>>>> Nikos.
>>>
>>> Very nice, well done.  Curious if you've tested with the fix I've staged
>>> (see above)?  If so, does it resolve the deadlock?  If you've had
>>> success I'd be happy to update the tags in the commit header to include
>>> your Tested-by before sending it to Linus.  Also, any review of the
>>> patch that you can do would be appreciated and with your formal
>>> Reviewed-by reply would be welcomed and folded in too.
>>>
>>> Mike
>>
>>
>>
>> --
>> Guruswamy Basavaiah
> 
> 
> 

--------------AA5F9247E26B92ACF447464E
Content-Type: text/x-patch;
	name="0001-dm-snapshot-introduce-account_start_copy-and-account.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="0001-dm-snapshot-introduce-account_start_copy-and-account.pa";
	filename*1="tch"

>From 5b1ae3cfc07e53e6e6e37f9f40b074dd7a8536b9 Mon Sep 17 00:00:00 2001
From: Mikulas Patocka <mpatocka@redhat.com>
Date: Wed, 2 Oct 2019 06:14:17 -0400
Subject: [PATCH 1/2] dm snapshot: introduce account_start_copy() and
 account_end_copy()

This simple refactoring moves code for modifying the semaphore cow_count
into separate functions to prepare for changes that will extend these
methods to provide for a more sophisticated mechanism for COW
throttling.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Signed-off-by: Mike Snitzer <snitzer@redhat.com>
---
 drivers/md/dm-snap.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm-snap.c b/drivers/md/dm-snap.c
index 5d3797728b9c..a9c82fd036c6 100644
--- a/drivers/md/dm-snap.c
+++ b/drivers/md/dm-snap.c
@@ -1398,6 +1398,16 @@ static void snapshot_dtr(struct dm_target *ti)
 	kfree(s);
 }
 
+static void account_start_copy(struct dm_snapshot *s)
+{
+	down(&s->cow_count);
+}
+
+static void account_end_copy(struct dm_snapshot *s)
+{
+	up(&s->cow_count);
+}
+
 /*
  * Flush a list of buffers.
  */
@@ -1582,7 +1592,7 @@ static void copy_callback(int read_err, unsigned long write_err, void *context)
 		}
 		list_add(&pe->out_of_order_entry, lh);
 	}
-	up(&s->cow_count);
+	account_end_copy(s);
 }
 
 /*
@@ -1606,7 +1616,7 @@ static void start_copy(struct dm_snap_pending_exception *pe)
 	dest.count = src.count;
 
 	/* Hand over to kcopyd */
-	down(&s->cow_count);
+	account_start_copy(s);
 	dm_kcopyd_copy(s->kcopyd_client, &src, 1, &dest, 0, copy_callback, pe);
 }
 
@@ -1627,7 +1637,7 @@ static void start_full_bio(struct dm_snap_pending_exception *pe,
 	pe->full_bio_end_io = bio->bi_end_io;
 	pe->full_bio_private = bio->bi_private;
 
-	down(&s->cow_count);
+	account_start_copy(s);
 	callback_data = dm_kcopyd_prepare_callback(s->kcopyd_client,
 						   copy_callback, pe);
 
-- 
2.11.0


--------------AA5F9247E26B92ACF447464E
Content-Type: text/x-patch;
	name="0002-dm-snapshot-rework-COW-throttling-to-fix-deadlock.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="0002-dm-snapshot-rework-COW-throttling-to-fix-deadlock.patch"

>From cec63eda390b8759adf9c1888530b90b12a16903 Mon Sep 17 00:00:00 2001
From: Mikulas Patocka <mpatocka@redhat.com>
Date: Wed, 2 Oct 2019 06:15:53 -0400
Subject: [PATCH 2/2] dm snapshot: rework COW throttling to fix deadlock

Commit 721b1d98fb517a ("dm snapshot: Fix excessive memory usage and
workqueue stalls") introduced a semaphore to limit the maximum number of
in-flight kcopyd (COW) jobs.

The implementation of this throttling mechanism is prone to a deadlock:

1. One or more threads write to the origin device causing COW, which is
   performed by kcopyd.

2. At some point some of these threads might reach the s->cow_count
   semaphore limit and block in down(&s->cow_count), holding a read lock
   on _origins_lock.

3. Someone tries to acquire a write lock on _origins_lock, e.g.,
   snapshot_ctr(), which blocks because the threads at step (2) already
   hold a read lock on it.

4. A COW operation completes and kcopyd runs dm-snapshot's completion
   callback, which ends up calling pending_complete().
   pending_complete() tries to resubmit any deferred origin bios. This
   requires acquiring a read lock on _origins_lock, which blocks.

   This happens because the read-write semaphore implementation gives
   priority to writers, meaning that as soon as a writer tries to enter
   the critical section, no readers will be allowed in, until all
   writers have completed their work.

   So, pending_complete() waits for the writer at step (3) to acquire
   and release the lock. This writer waits for the readers at step (2)
   to release the read lock and those readers wait for
   pending_complete() (the kcopyd thread) to signal the s->cow_count
   semaphore: DEADLOCK.

The above was thoroughly analyzed and documented by Nikos Tsironis as
part of his initial proposal for fixing this deadlock, see:
https://www.redhat.com/archives/dm-devel/2019-October/msg00001.html

Fix this deadlock by reworking COW throttling so that it waits without
holding any locks. Add a variable 'in_progress' that counts how many
kcopyd jobs are running. A function wait_for_in_progress() will sleep if
'in_progress' is over the limit. It drops _origins_lock in order to
avoid the deadlock.

Reported-by: Guruswamy Basavaiah <guru2018@gmail.com>
Reported-by: Nikos Tsironis <ntsironis@arrikto.com>
Fixes: 721b1d98fb51 ("dm snapshot: Fix excessive memory usage and workqueue stalls")
Cc: stable@vger.kernel.org # v5.0+
Depends-on: 4a3f111a73a8c ("dm snapshot: introduce account_start_copy() and account_end_copy()")
Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Signed-off-by: Mike Snitzer <snitzer@redhat.com>
---
 drivers/md/dm-snap.c | 78 ++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 64 insertions(+), 14 deletions(-)

diff --git a/drivers/md/dm-snap.c b/drivers/md/dm-snap.c
index a9c82fd036c6..0141b7089506 100644
--- a/drivers/md/dm-snap.c
+++ b/drivers/md/dm-snap.c
@@ -19,7 +19,6 @@
 #include <linux/vmalloc.h>
 #include <linux/log2.h>
 #include <linux/dm-kcopyd.h>
-#include <linux/semaphore.h>
 
 #include "dm.h"
 
@@ -106,8 +105,8 @@ struct dm_snapshot {
 	/* The on disk metadata handler */
 	struct dm_exception_store *store;
 
-	/* Maximum number of in-flight COW jobs. */
-	struct semaphore cow_count;
+	unsigned in_progress;
+	struct wait_queue_head in_progress_wait;
 
 	struct dm_kcopyd_client *kcopyd_client;
 
@@ -158,8 +157,8 @@ struct dm_snapshot {
  */
 #define DEFAULT_COW_THRESHOLD 2048
 
-static int cow_threshold = DEFAULT_COW_THRESHOLD;
-module_param_named(snapshot_cow_threshold, cow_threshold, int, 0644);
+static unsigned cow_threshold = DEFAULT_COW_THRESHOLD;
+module_param_named(snapshot_cow_threshold, cow_threshold, uint, 0644);
 MODULE_PARM_DESC(snapshot_cow_threshold, "Maximum number of chunks being copied on write");
 
 DECLARE_DM_KCOPYD_THROTTLE_WITH_MODULE_PARM(snapshot_copy_throttle,
@@ -1207,7 +1206,7 @@ static int snapshot_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		goto bad_hash_tables;
 	}
 
-	sema_init(&s->cow_count, (cow_threshold > 0) ? cow_threshold : INT_MAX);
+	init_waitqueue_head(&s->in_progress_wait);
 
 	s->kcopyd_client = dm_kcopyd_client_create(&dm_kcopyd_throttle);
 	if (IS_ERR(s->kcopyd_client)) {
@@ -1395,17 +1394,54 @@ static void snapshot_dtr(struct dm_target *ti)
 
 	dm_put_device(ti, s->origin);
 
+	WARN_ON(s->in_progress);
+
 	kfree(s);
 }
 
 static void account_start_copy(struct dm_snapshot *s)
 {
-	down(&s->cow_count);
+	spin_lock(&s->in_progress_wait.lock);
+	s->in_progress++;
+	spin_unlock(&s->in_progress_wait.lock);
 }
 
 static void account_end_copy(struct dm_snapshot *s)
 {
-	up(&s->cow_count);
+	spin_lock(&s->in_progress_wait.lock);
+	BUG_ON(!s->in_progress);
+	s->in_progress--;
+	if (likely(s->in_progress <= cow_threshold) &&
+	    unlikely(waitqueue_active(&s->in_progress_wait)))
+		wake_up_locked(&s->in_progress_wait);
+	spin_unlock(&s->in_progress_wait.lock);
+}
+
+static bool wait_for_in_progress(struct dm_snapshot *s, bool unlock_origins)
+{
+	if (unlikely(s->in_progress > cow_threshold)) {
+		spin_lock(&s->in_progress_wait.lock);
+		if (likely(s->in_progress > cow_threshold)) {
+			/*
+			 * NOTE: this throttle doesn't account for whether
+			 * the caller is servicing an IO that will trigger a COW
+			 * so excess throttling may result for chunks not required
+			 * to be COW'd.  But if cow_threshold was reached, extra
+			 * throttling is unlikely to negatively impact performance.
+			 */
+			DECLARE_WAITQUEUE(wait, current);
+			__add_wait_queue(&s->in_progress_wait, &wait);
+			__set_current_state(TASK_UNINTERRUPTIBLE);
+			spin_unlock(&s->in_progress_wait.lock);
+			if (unlock_origins)
+				up_read(&_origins_lock);
+			io_schedule();
+			remove_wait_queue(&s->in_progress_wait, &wait);
+			return false;
+		}
+		spin_unlock(&s->in_progress_wait.lock);
+	}
+	return true;
 }
 
 /*
@@ -1423,7 +1459,7 @@ static void flush_bios(struct bio *bio)
 	}
 }
 
-static int do_origin(struct dm_dev *origin, struct bio *bio);
+static int do_origin(struct dm_dev *origin, struct bio *bio, bool limit);
 
 /*
  * Flush a list of buffers.
@@ -1436,7 +1472,7 @@ static void retry_origin_bios(struct dm_snapshot *s, struct bio *bio)
 	while (bio) {
 		n = bio->bi_next;
 		bio->bi_next = NULL;
-		r = do_origin(s->origin, bio);
+		r = do_origin(s->origin, bio, false);
 		if (r == DM_MAPIO_REMAPPED)
 			generic_make_request(bio);
 		bio = n;
@@ -1728,6 +1764,11 @@ static int snapshot_map(struct dm_target *ti, struct bio *bio)
 	if (!s->valid)
 		return -EIO;
 
+	if (bio_data_dir(bio) == WRITE) {
+		while (unlikely(!wait_for_in_progress(s, false)))
+			; /* wait_for_in_progress() has slept */
+	}
+
 	/* FIXME: should only take write lock if we need
 	 * to copy an exception */
 	down_write(&s->lock);
@@ -1877,7 +1918,7 @@ static int snapshot_merge_map(struct dm_target *ti, struct bio *bio)
 
 	if (bio_rw(bio) == WRITE) {
 		up_write(&s->lock);
-		return do_origin(s->origin, bio);
+		return do_origin(s->origin, bio, false);
 	}
 
 out_unlock:
@@ -2213,15 +2254,24 @@ static int __origin_write(struct list_head *snapshots, sector_t sector,
 /*
  * Called on a write from the origin driver.
  */
-static int do_origin(struct dm_dev *origin, struct bio *bio)
+static int do_origin(struct dm_dev *origin, struct bio *bio, bool limit)
 {
 	struct origin *o;
 	int r = DM_MAPIO_REMAPPED;
 
+again:
 	down_read(&_origins_lock);
 	o = __lookup_origin(origin->bdev);
-	if (o)
+	if (o) {
+		if (limit) {
+			struct dm_snapshot *s;
+			list_for_each_entry(s, &o->snapshots, list)
+				if (unlikely(!wait_for_in_progress(s, true)))
+					goto again;
+		}
+
 		r = __origin_write(&o->snapshots, bio->bi_iter.bi_sector, bio);
+	}
 	up_read(&_origins_lock);
 
 	return r;
@@ -2334,7 +2384,7 @@ static int origin_map(struct dm_target *ti, struct bio *bio)
 		dm_accept_partial_bio(bio, available_sectors);
 
 	/* Only tell snapshots if this is a write */
-	return do_origin(o->dev, bio);
+	return do_origin(o->dev, bio, true);
 }
 
 /*
-- 
2.11.0


--------------AA5F9247E26B92ACF447464E
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--------------AA5F9247E26B92ACF447464E--

