Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5433235860
	for <lists+dm-devel@lfdr.de>; Wed,  5 Jun 2019 10:18:00 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DAA63C18B2CD;
	Wed,  5 Jun 2019 08:17:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB5695D9D6;
	Wed,  5 Jun 2019 08:17:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 71AB01806B18;
	Wed,  5 Jun 2019 08:17:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x544LkAR027018 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 4 Jun 2019 00:21:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EA30119480; Tue,  4 Jun 2019 04:21:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A2BA196AD;
	Tue,  4 Jun 2019 04:21:42 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 296433092674;
	Tue,  4 Jun 2019 04:21:09 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 484EB9DA749370177C29;
	Tue,  4 Jun 2019 12:21:01 +0800 (CST)
Received: from [127.0.0.1] (10.177.244.145) by DGGEMS405-HUB.china.huawei.com
	(10.3.19.205) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 4 Jun 2019 12:20:54 +0800
To: Josef Bacik <josef@toxicpanda.com>, Mike Snitzer <snitzer@redhat.com>
References: <1559571534-16467-1-git-send-email-yi.zhang@huawei.com>
	<20190603144608.GA22116@redhat.com>
	<20190603190243.zqbfsgz22k3wghby@MacBook-Pro-91.local>
From: "zhangyi (F)" <yi.zhang@huawei.com>
Message-ID: <fae337b4-146e-743e-fe7d-6c796bfd560d@huawei.com>
Date: Tue, 4 Jun 2019 12:20:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20190603190243.zqbfsgz22k3wghby@MacBook-Pro-91.local>
X-Originating-IP: [10.177.244.145]
X-CFilter-Loop: Reflected
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Tue, 04 Jun 2019 04:21:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Tue, 04 Jun 2019 04:21:27 +0000 (UTC) for IP:'45.249.212.190'
	DOMAIN:'szxga04-in.huawei.com' HELO:'huawei.com'
	FROM:'yi.zhang@huawei.com' RCPT:''
X-RedHat-Spam-Score: -0.702  (RCVD_IN_DNSWL_LOW, SPF_HELO_PASS,
	SPF_PASS) 45.249.212.190 szxga04-in.huawei.com
	45.249.212.190 szxga04-in.huawei.com <yi.zhang@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 05 Jun 2019 04:13:38 -0400
Cc: Josef Bacik <jbacik@fb.com>, dm-devel@redhat.com, agk@redhat.com,
	houtao1@huawei.com
Subject: Re: [dm-devel] dm log writes: make sure the log super sectors are
 written in order
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Wed, 05 Jun 2019 08:17:59 +0000 (UTC)

On 2019/6/4 3:02, Josef Bacik Wrote:
> On Mon, Jun 03, 2019 at 10:46:08AM -0400, Mike Snitzer wrote:
>> On Mon, Jun 03 2019 at 10:18am -0400,
>> zhangyi (F) <yi.zhang@huawei.com> wrote:
>>
>>> Currently, although we submit super bios in log-write thread orderly
>>> (the super.nr_entries is incremented by each logged entry), the
>>> submit_bio() cannot make sure that each super sector is written to log
>>> device in order. So the submitting bio of each super sector may be
>>> out-of-order, and then the final nr_entries maybe small than the real
>>> entries submitted.
>>>
>>> This problem can be reproduced by the xfstests generic/455 with ext4,
>>> which may complained below after running the test:
>>>
>>>   QA output created by 455
>>>  -Silence is golden
>>>  +mark 'end' does not exist
>>>
>>> This patch serialize submitting super secotrs to make sure each super
>>> sectors are written to log disk in order.
>>>
>>> Signed-off-by: zhangyi (F) <yi.zhang@huawei.com>
>>
>> This doesn't feel right.
>>
>> You raised 2 things you're trying to address:
>> 1) IO is out of order
>> 2) accounting (nr_entries) isn't correct
>>
>> I'll need to reviewer closer but serializing "super" bios doesn't seem
>> like the best fix.
>>
>> Josef, any chance you can weigh in on this?  AFAIK you are still "the
>> man" for dm-log-writes ;)
>>
> 
> Well the #2 is caused by #1, we submit the bio for a super two times in a row
> and it's a crapshoot which one makes it to disk.  So he's right, and it's kind
> of funny because this is the sort of problem that dm-log-writes was written to
> catch, and I fucked it up here ;).  That being said this is a bit
> over-engineered, can we just add a completion to the log buff and do a
> wait_for_completion() when we're writing out the super?  It's not like this thing
> needs to be super performant.  Thanks,
> 

Hi, Josef

Thanks for your suggestions. It's fine by me to switch to use completion
instead. Some thing like this?

...
@@ -180,6 +182,15 @@ static void log_end_io(struct bio *bio)
        bio_put(bio);
 }

+static void log_end_super(struct bio *bio)
+{
+       struct log_writes_c *lc = bio->bi_private;
+
+       /* Wake up log-write kthread that super has been written */
+       complete(&lc->super_comp);
+       log_end_io(bio);
+}
+
 /*
  * Meant to be called if there is an error, it will free all the pages
  * associated with the block.
@@ -215,7 +226,8 @@ static int write_metadata(struct log_writes_c *lc, void *entry,
        bio->bi_iter.bi_size = 0;
        bio->bi_iter.bi_sector = sector;
        bio_set_dev(bio, lc->logdev->bdev);
-       bio->bi_end_io = log_end_io;
+       bio->bi_end_io = (sector == WRITE_LOG_SUPER_SECTOR) ?
+                         log_end_super : log_end_io;
        bio->bi_private = lc;
        bio_set_op_attrs(bio, REQ_OP_WRITE, 0);

@@ -418,11 +430,19 @@ static int log_super(struct log_writes_c *lc)
        super.nr_entries = cpu_to_le64(lc->logged_entries);
        super.sectorsize = cpu_to_le32(lc->sectorsize);

-       if (write_metadata(lc, &super, sizeof(super), NULL, 0, 0)) {
+       if (write_metadata(lc, &super, sizeof(super), NULL, 0,
+                          WRITE_LOG_SUPER_SECTOR)) {
                DMERR("Couldn't write super");
                return -1;
        }

+       /*
+        * Super sector should be writen in-order, or else the
+        * nr_entries could be rewritten by the old bio and small
+        * than the real submitted entries.
+        */
+       wait_for_completion_io(&lc->super_comp);
+
        return 0;
 }
...

But one thing need to mention is that, IIUC, If we use completion, the
log_writes_kthread have to wait on writing out every super bio, so it cannot
keep on submitting subsequent log bios. It maybe more performance impact
than my v1 (it only wait on previous super if it was not finished).

Thanks,
Yi.



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
