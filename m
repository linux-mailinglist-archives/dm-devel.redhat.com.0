Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C90D3F5D
	for <lists+dm-devel@lfdr.de>; Fri, 11 Oct 2019 14:20:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A2EEF81DF7;
	Fri, 11 Oct 2019 12:20:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 017756012A;
	Fri, 11 Oct 2019 12:20:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CF2D318005A0;
	Fri, 11 Oct 2019 12:20:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9BCH8aw002235 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 11 Oct 2019 08:17:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B149A6061E; Fri, 11 Oct 2019 12:17:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA67660872
	for <dm-devel@redhat.com>; Fri, 11 Oct 2019 12:17:06 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5D6D03162916
	for <dm-devel@redhat.com>; Fri, 11 Oct 2019 12:17:04 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y19so11689019wrd.3
	for <dm-devel@redhat.com>; Fri, 11 Oct 2019 05:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=b6dhXIw2rgdHnTBvb+u85BhcTVOX5/m3XpfjNOLgLyI=;
	b=ZAGdNMunnee0BfIhD2p8YV2NM44w62A2MqDhLwE+nFePOvmx3u93RmOHgITQHe90oq
	ObiDEX2MBqTOcn0cENRk79IXvtmo83ijltbZotzaDsIEtp8bVLQVBIlHI1FUjrzp2FID
	ru9+CMUeOPj5JX+LWqxKqCNP8UkfReznpNiGiY8IMaF9R6YixCPAIqKHNthpEI6mw6Xd
	w+BquLgg4K9ouQlcOFd7nbjaIACHfdJ9m+qplHjriX4TwNel/7I3p+XXQyeeP75XH5s3
	wfFjO3jnX7HkusnJ6UDYX0LLc8xfzMgltIeICzpowzVtehXLXqKOt0QZQUJwBlwxyKEr
	m+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=b6dhXIw2rgdHnTBvb+u85BhcTVOX5/m3XpfjNOLgLyI=;
	b=dXfvisrMyFlJlFGHMkKrzHjZ6xGbaXMEZ2KX22J3F3nrmKkW0lnU4mZKsWbrcLz111
	fYf3+j7K6NfYRiHEpZ7hLUv5LgXsfwBIuoceUcOI9zPkBGzELqax0M/hf1SDtoBYb+x5
	qul9BGmDYXU/cjqAlimiJicFUFLhM1BCKsvDaNKxGGD+iIqRH+4uMArqoqS2RUNuF3IC
	hJxiuv9FKLKXuI4VugpaxZ+8B6pm89TMg8OayuTJQB4nCp1y+FBvJVtRcVHO10JO5Cil
	mEJHGHltihh8y/fOGg7/auYhUPcVEhoUd/+5JE02iO+2qDcX5orymLyPDM+PGdCp5U9Q
	LCgg==
X-Gm-Message-State: APjAAAXRNy3dZnlEKhkGNmdk93mxHtb+l7/D69YOPSSFgNQy4SXnIZXf
	W8ltODVRM7D7nMDzeWqCcFMvqg==
X-Google-Smtp-Source: APXvYqyPvjwg9TO8JIdvc8aj+yAbOlocGdnL4UWttviVpgToyleXzV44i0XvZZe9jrynvuZ9/+yK7Q==
X-Received: by 2002:adf:b69f:: with SMTP id j31mr12793668wre.277.1570796222984;
	Fri, 11 Oct 2019 05:17:02 -0700 (PDT)
Received: from [10.94.250.119] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id l7sm9601878wrv.77.2019.10.11.05.17.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Oct 2019 05:17:02 -0700 (PDT)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: Guruswamy Basavaiah <guru2018@gmail.com>
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
	<ecf3c2cc-a0c0-ec34-7a74-8d715f774df9@arrikto.com>
	<CAHSpA5-wbyaNmnOMq+rTbuXh2eJ6y=iVjVR52OvmWLbLnUkTAw@mail.gmail.com>
	<b8246b84-957d-1903-4ab0-3f4b940b779d@arrikto.com>
Message-ID: <a1205abe-8675-a2d7-5ef8-3bcd00290f08@arrikto.com>
Date: Fri, 11 Oct 2019 15:17:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b8246b84-957d-1903-4ab0-3f4b940b779d@arrikto.com>
Content-Type: multipart/mixed; boundary="------------939F834D648965F2227A583A"
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 11 Oct 2019 12:17:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Fri, 11 Oct 2019 12:17:04 +0000 (UTC) for IP:'209.85.221.68'
	DOMAIN:'mail-wr1-f68.google.com' HELO:'mail-wr1-f68.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: -0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.68 mail-wr1-f68.google.com 209.85.221.68
	mail-wr1-f68.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>, agk@redhat.com,
	Mike Snitzer <snitzer@redhat.com>, iliastsi@arrikto.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Fri, 11 Oct 2019 12:20:52 +0000 (UTC)

This is a multi-part message in MIME format.
--------------939F834D648965F2227A583A
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 10/11/19 2:39 PM, Nikos Tsironis wrote:
> On 10/11/19 1:17 PM, Guruswamy Basavaiah wrote:
>> Hello Nikos,
>>  Applied these patches and tested.
>>  We still see hung_task_timeout back traces and the drbd Resync is blocked.
>>  Attached the back trace, please let me know if you need any other information.
>>
> 
> Hi Guru,
> 
> Can you provide more information about your setup? The output of
> 'dmsetup table', 'dmsetup ls --tree' and the DRBD configuration would
> help to get a better picture of your I/O stack.
> 
> Also, is it possible to describe the test case you are running and
> exactly what it does?
> 
> Thanks,
> Nikos
> 

Hi Guru,

I believe I found the mistake. The in_progress variable was never
initialized to zero.

I attach a new version of the second patch correcting this.

Can you please test again with this patch?

Thanks,
Nikos

>>  In patch "0002-dm-snapshot-rework-COW-throttling-to-fix-deadlock.patch"
>> I change "struct wait_queue_head" to "wait_queue_head_t" as i was
>> getting compilation error with former one.
>>
>> On Thu, 10 Oct 2019 at 17:33, Nikos Tsironis <ntsironis@arrikto.com> wrote:
>>>
>>> On 10/10/19 9:34 AM, Guruswamy Basavaiah wrote:
>>>> Hello,
>>>> We use 4.4.184 in our builds and the patch fails to apply.
>>>> Is it possible to give a patch for 4.4.x branch ?
>>> Hi Guru,
>>>
>>> I attach the two patches fixing the deadlock rebased on the 4.4.x branch.
>>>
>>> Nikos
>>>
>>>>
>>>> patching Logs.
>>>> patching file drivers/md/dm-snap.c
>>>> Hunk #1 succeeded at 19 (offset 1 line).
>>>> Hunk #2 succeeded at 105 (offset -1 lines).
>>>> Hunk #3 succeeded at 157 (offset -4 lines).
>>>> Hunk #4 succeeded at 1206 (offset -120 lines).
>>>> Hunk #5 FAILED at 1508.
>>>> Hunk #6 succeeded at 1412 (offset -124 lines).
>>>> Hunk #7 succeeded at 1425 (offset -124 lines).
>>>> Hunk #8 FAILED at 1925.
>>>> Hunk #9 succeeded at 1866 with fuzz 2 (offset -255 lines).
>>>> Hunk #10 succeeded at 2202 (offset -294 lines).
>>>> Hunk #11 succeeded at 2332 (offset -294 lines).
>>>> 2 out of 11 hunks FAILED -- saving rejects to file drivers/md/dm-snap.c.rej
>>>>
>>>> Guru
>>>>
>>>> On Thu, 10 Oct 2019 at 01:33, Guruswamy Basavaiah <guru2018@gmail.com> wrote:
>>>>>
>>>>> Hello Mike,
>>>>>  I will get the testing result before end of Thursday.
>>>>> Guru
>>>>>
>>>>> On Wed, 9 Oct 2019 at 21:34, Mike Snitzer <snitzer@redhat.com> wrote:
>>>>>>
>>>>>> On Wed, Oct 09 2019 at 11:44am -0400,
>>>>>> Nikos Tsironis <ntsironis@arrikto.com> wrote:
>>>>>>
>>>>>>> On 10/9/19 5:13 PM, Mike Snitzer wrote:> On Tue, Oct 01 2019 at  8:43am -0400,
>>>>>>>> Nikos Tsironis <ntsironis@arrikto.com> wrote:
>>>>>>>>
>>>>>>>>> On 10/1/19 3:27 PM, Guruswamy Basavaiah wrote:
>>>>>>>>>> Hello Nikos,
>>>>>>>>>>  Yes, issue is consistently reproducible with us, in a particular
>>>>>>>>>> set-up and test case.
>>>>>>>>>>  I will get the access to set-up next week, will try to test and let
>>>>>>>>>> you know the results before end of next week.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> That sounds great!
>>>>>>>>>
>>>>>>>>> Thanks a lot,
>>>>>>>>> Nikos
>>>>>>>>
>>>>>>>> Hi Guru,
>>>>>>>>
>>>>>>>> Any chance you could try this fix that I've staged to send to Linus?
>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.4&id=633b1613b2a49304743c18314bb6e6465c21fd8a
>>>>>>>>
>>>>>>>> Shiort of that, Nikos: do you happen to have a test scenario that teases
>>>>>>>> out this deadlock?
>>>>>>>>
>>>>>>>
>>>>>>> Hi Mike,
>>>>>>>
>>>>>>> Yes,
>>>>>>>
>>>>>>> I created a 50G LV and took a snapshot of the same size:
>>>>>>>
>>>>>>>   lvcreate -n data-lv -L50G testvg
>>>>>>>   lvcreate -n snap-lv -L50G -s testvg/data-lv
>>>>>>>
>>>>>>> Then I ran the following fio job:
>>>>>>>
>>>>>>> [global]
>>>>>>> randrepeat=1
>>>>>>> ioengine=libaio
>>>>>>> bs=1M
>>>>>>> size=6G
>>>>>>> offset_increment=6G
>>>>>>> numjobs=8
>>>>>>> direct=1
>>>>>>> iodepth=32
>>>>>>> group_reporting
>>>>>>> filename=/dev/testvg/data-lv
>>>>>>>
>>>>>>> [test]
>>>>>>> rw=write
>>>>>>> timeout=180
>>>>>>>
>>>>>>> , concurrently with the following script:
>>>>>>>
>>>>>>> lvcreate -n dummy-lv -L1G testvg
>>>>>>>
>>>>>>> while true
>>>>>>> do
>>>>>>>  lvcreate -n dummy-snap -L1M -s testvg/dummy-lv
>>>>>>>  lvremove -f testvg/dummy-snap
>>>>>>> done
>>>>>>>
>>>>>>> This reproduced the deadlock for me. I also ran 'echo 30 >
>>>>>>> /proc/sys/kernel/hung_task_timeout_secs', to reduce the hung task
>>>>>>> timeout.
>>>>>>>
>>>>>>> Nikos.
>>>>>>
>>>>>> Very nice, well done.  Curious if you've tested with the fix I've staged
>>>>>> (see above)?  If so, does it resolve the deadlock?  If you've had
>>>>>> success I'd be happy to update the tags in the commit header to include
>>>>>> your Tested-by before sending it to Linus.  Also, any review of the
>>>>>> patch that you can do would be appreciated and with your formal
>>>>>> Reviewed-by reply would be welcomed and folded in too.
>>>>>>
>>>>>> Mike
>>>>>
>>>>>
>>>>>
>>>>> --
>>>>> Guruswamy Basavaiah
>>>>
>>>>
>>>>
>>
>>
>>

--------------939F834D648965F2227A583A
Content-Type: text/x-patch;
	name="0002-dm-snapshot-rework-COW-throttling-to-fix-deadlock.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="0002-dm-snapshot-rework-COW-throttling-to-fix-deadlock.patch"

>From 80c68f059b5ce9828030569aadabb97085ffea5e Mon Sep 17 00:00:00 2001
From: Mikulas Patocka <mpatocka@redhat.com>
Date: Wed, 2 Oct 2019 06:15:53 -0400
Subject: [PATCH] dm snapshot: rework COW throttling to fix deadlock

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
 drivers/md/dm-snap.c | 79 ++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 65 insertions(+), 14 deletions(-)

diff --git a/drivers/md/dm-snap.c b/drivers/md/dm-snap.c
index a9c82fd036c6..9f127a4e26b5 100644
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
@@ -1207,7 +1206,8 @@ static int snapshot_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		goto bad_hash_tables;
 	}
 
-	sema_init(&s->cow_count, (cow_threshold > 0) ? cow_threshold : INT_MAX);
+	init_waitqueue_head(&s->in_progress_wait);
+	s->in_progress = 0;
 
 	s->kcopyd_client = dm_kcopyd_client_create(&dm_kcopyd_throttle);
 	if (IS_ERR(s->kcopyd_client)) {
@@ -1395,17 +1395,54 @@ static void snapshot_dtr(struct dm_target *ti)
 
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
@@ -1423,7 +1460,7 @@ static void flush_bios(struct bio *bio)
 	}
 }
 
-static int do_origin(struct dm_dev *origin, struct bio *bio);
+static int do_origin(struct dm_dev *origin, struct bio *bio, bool limit);
 
 /*
  * Flush a list of buffers.
@@ -1436,7 +1473,7 @@ static void retry_origin_bios(struct dm_snapshot *s, struct bio *bio)
 	while (bio) {
 		n = bio->bi_next;
 		bio->bi_next = NULL;
-		r = do_origin(s->origin, bio);
+		r = do_origin(s->origin, bio, false);
 		if (r == DM_MAPIO_REMAPPED)
 			generic_make_request(bio);
 		bio = n;
@@ -1728,6 +1765,11 @@ static int snapshot_map(struct dm_target *ti, struct bio *bio)
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
@@ -1877,7 +1919,7 @@ redirect_to_origin:
 
 	if (bio_rw(bio) == WRITE) {
 		up_write(&s->lock);
-		return do_origin(s->origin, bio);
+		return do_origin(s->origin, bio, false);
 	}
 
 out_unlock:
@@ -2213,15 +2255,24 @@ next_snapshot:
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
@@ -2334,7 +2385,7 @@ static int origin_map(struct dm_target *ti, struct bio *bio)
 		dm_accept_partial_bio(bio, available_sectors);
 
 	/* Only tell snapshots if this is a write */
-	return do_origin(o->dev, bio);
+	return do_origin(o->dev, bio, true);
 }
 
 /*
-- 
2.11.0


--------------939F834D648965F2227A583A
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--------------939F834D648965F2227A583A--

