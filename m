Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7924F31DC92
	for <lists+dm-devel@lfdr.de>; Wed, 17 Feb 2021 16:41:24 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-Rj4dQ9sqNZCmwwF9uDhBkg-1; Wed, 17 Feb 2021 10:41:19 -0500
X-MC-Unique: Rj4dQ9sqNZCmwwF9uDhBkg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10AF680197A;
	Wed, 17 Feb 2021 15:41:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB7966F7EA;
	Wed, 17 Feb 2021 15:41:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8FFD718095CC;
	Wed, 17 Feb 2021 15:41:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11HDFiQe026970 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Feb 2021 08:15:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 83649FED5B; Wed, 17 Feb 2021 13:15:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D31EFED2C
	for <dm-devel@redhat.com>; Wed, 17 Feb 2021 13:15:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32574100AFE9
	for <dm-devel@redhat.com>; Wed, 17 Feb 2021 13:15:42 +0000 (UTC)
Received: from out30-133.freemail.mail.aliyun.com
	(out30-133.freemail.mail.aliyun.com [115.124.30.133]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-351-8bgp2ikMNFO41eZjIpeBJg-1;
	Wed, 17 Feb 2021 08:15:39 -0500
X-MC-Unique: 8bgp2ikMNFO41eZjIpeBJg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R891e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
	TI=SMTPD_---0UOq-Y54_1613567732
Received: from admindeMacBook-Pro-2.local(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0UOq-Y54_1613567732) by smtp.aliyun-inc.com(127.0.0.1);
	Wed, 17 Feb 2021 21:15:32 +0800
From: JeffleXu <jefflexu@linux.alibaba.com>
To: snitzer@redhat.com, axboe@kernel.dk
References: <20210208085243.82367-1-jefflexu@linux.alibaba.com>
Message-ID: <7d440a6f-e533-f34c-90a2-4afd3c3d9b1c@linux.alibaba.com>
Date: Wed, 17 Feb 2021 21:15:32 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
	Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210208085243.82367-1-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 17 Feb 2021 10:31:26 -0500
Cc: caspar@linux.alibaba.com, hch@lst.de, linux-block@vger.kernel.org,
	joseph.qi@linux.alibaba.com, dm-devel@redhat.com, io-uring@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v3 00/11] dm: support IO polling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Any comment on this series?

Thanks,
Jeffle


On 2/8/21 4:52 PM, Jeffle Xu wrote:
> 
> [Performance]
> 1. One thread (numjobs=1) randread (bs=4k, direct=1) one dm-linear
> device, which is built upon 3 nvme devices, with one polling hw
> queue per nvme device.
> 
>      | IOPS (IRQ mode) | IOPS (iopoll=1 mode) | diff
> ---- | --------------- | -------------------- | ----
>   dm | 		  208k |		 279k | ~34%
> 
> 
> 2. Three threads (numjobs=3) randread (bs=4k, direct=1) one dm-linear
> device, which is built upon 3 nvme devices, with one polling hw
> queue per nvme device.
> 
> It's compared to 3 threads directly randread 3 nvme devices, with one
> polling hw queue per nvme device. No CPU affinity set for these 3
> threads. Thus every thread can access every nvme device
> (filename=/dev/nvme0n1:/dev/nvme1n1:/dev/nvme2n1), i.e., every thread
> need to competing for every polling hw queue.
> 
>      | IOPS (IRQ mode) | IOPS (iopoll=1 mode) | diff
> ---- | --------------- | -------------------- | ----
>   dm | 		  615k |		 728k | ~18%
> nvme | 		  728k |		 873k | ~20%
> 
> The result shows that the performance gain of bio-based polling is
> comparable as that of mq polling in the same test case.
> 
> 
> 3. Three threads (numjobs=3) randread (bs=12k, direct=1) one
> **dm-stripe** device, which is built upon 3 nvme devices, with one
> polling hw queue per nvme device.
> 
> It's compared to 3 threads directly randread 3 nvme devices, with one
> polling hw queue per nvme device. No CPU affinity set for these 3
> threads. Thus every thread can access every nvme device
> (filename=/dev/nvme0n1:/dev/nvme1n1:/dev/nvme2n1), i.e., every thread
> need to competing for every polling hw queue.
> 
>      | IOPS (IRQ mode) | IOPS (iopoll=1 mode) | diff
> ---- | --------------- | -------------------- | ----
>   dm | 		  314k |		 354k | ~13%
> nvme | 		  728k |		 873k | ~20%
> 
> 
> 4. This patchset shall do no harm to the performance of the original mq
> polling. Following is the test results of one thread (numjobs=1)
> randread (bs=4k, direct=1) one nvme device.
> 
> 	    	 | IOPS (IRQ mode) | IOPS (iopoll=1 mode) | diff
> ---------------- | --------------- | -------------------- | ----
> without patchset | 	      242k |		     332k | ~39%
> with patchset    |	      236k |		     332k | ~39%
> 
> 
> 
> [Changes since v2]
> 
> Patchset v2 caches all hw queues (in polling mode) of underlying mq
> devices in dm layer. The polling routine actually iterates through all
> these cached hw queues.
> 
> However, mq may change the queue mapping at runtime (e.g., NVMe RESET
> command), thus the cached hw queues in dm layer may be out-of-date. Thus
> patchset v3 falls back to the implementation of the very first RFC
> version, in which the mq layer needs to export one interface iterating
> all polling hw queues (patch 5), and the bio-based polling routine just
> calls this interface to iterate all polling hw queues.
> 
> Besides, several new optimization is proposed.
> 
> 
> - patch 1,2,7
> same as v2, untouched
> 
> - patch 3
> Considering advice from Christoph Hellwig, while refactoring blk_poll(),
> split mq and bio-based polling routine from the very beginning. Now
> blk_poll() is just a simple entry. blk_bio_poll() is simply copied from
> blk_mq_poll(), while the loop structure is some sort of duplication
> though.
> 
> - patch 4
> This patch is newly added to support turning on/off polling through
> '/sys/block/<dev>/queue/io_poll' dynamiclly for bio-based devices.
> Patchset v2 implemented this functionality by added one new queue flag,
> which is not preferred since the queue flag resource is quite short of
> nowadays.
> 
> - patch 5
> This patch is newly added, preparing for the following bio-based
> polling. The following bio-based polling will call this helper function,
> accounting on the corresponding hw queue.
> 
> - patch 6
> It's from the very first RFC version, preparing for the following
> bio-based polling.
> 
> - patch 8
> One fixing patch needed by the following bio-based polling. It's
> actually a v2 of [1]. I had sent the v2 singly in-reply-to [1], though
> it has not been visible on the mailing list maybe due to the delay.
> 
> - patch 9
> It's from the very first RFC version.
> 
> - patch 10
> This patch is newly added. Patchset v2 had ever proposed one
> optimization that, skipping the **busy** hw queues during the iteration
> phase. Back upon that time, one flag of 'atomic_t' is specifically
> maintained in dm layer, representing if the corresponding hw queue is
> busy or not. The idea is inherited, while the implementation changes.
> Now @nvmeq->cq_poll_lock is used directly here, no need for extra flag
> anymore.
> 
> This optimization can significantly reduce the competition for one hw
> queue between multiple polling instances. Following statistics is the
> test result when 3 threads concurrently randread (bs=4k, direct=1) one
> dm-linear device, which is built upon 3 nvme devices, with one polling
> hw queue per nvme device.
> 
> 	    | IOPS (IRQ mode) | IOPS (iopoll=1 mode) | diff
> ----------- | --------------- | -------------------- | ----
> without opt | 		 318k |		 	256k | ~-20%
> with opt    |		 314k |		 	354k | ~13%
> 							
> 
> - patch 11
> This is another newly added optimizatin for bio-based polling.
> 
> One intuitive insight is that, when the original bio submitted to dm
> device doesn't get split, then the bio gets enqueued into only one hw
> queue of one of the underlying mq devices. In this case, we no longer
> need to track all split bios, and one cookie (for the only split bio)
> is enough. It is implemented by returning the pointer to the
> corresponding hw queue in this case.
> 
> It should be safe by directly returning the pointer to the hw queue,
> since 'struct blk_mq_hw_ctx' won't be freed during the whole lifetime of
> 'struct request_queue'. Even when the number of hw queues may decrease
> when NVMe RESET happens, the 'struct request_queue' structure of decreased
> hw queues won't be freed, instead it's buffered into
> &q->unused_hctx_list list.
> 
> Though this optimization seems quite intuitive, the performance test
> shows that it does no benefit nor harm to the performance, while 3
> threads concurrently randreading (bs=4k, direct=1) one dm-linear
> device, which is built upon 3 nvme devices, with one polling hw queue
> per nvme device.
> 
> I'm not sure why it doesn't work, maybe because the number of devices,
> or the depth of the devcice stack is to low in my test case?
> 
> 
> [Remained Issue]
> It has been mentioned in patch 4 that, users could change the state of
> the underlying devices through '/sys/block/<dev>/io_poll', bypassing
> the dm device above. Thus it can cause a situation where QUEUE_FLAG_POLL
> is still set for the request_queue of dm device, while one of the
> underlying mq device may has cleared this flag.
> 
> In this case, it will pass the 'test_bit(QUEUE_FLAG_POLL, &q->queue_flags)'
> check in blk_poll(), while the input cookie may actually points to a hw
> queue in IRQ mode since patch 11. Thus for this hw queue (in IRQ mode),
> the bio-based polling routine will handle this hw queue acquiring
> 'spin_lock(&nvmeq->cq_poll_lock)' (refer
> drivers/nvme/host/pci.c:nvme_poll), which is not adequate since this hw
> queue may also be accessed in IRQ context. In other words,
> spin_lock_irq() should be used here.
> 
> I have not come up one simple way to fix it. I don't want to do sanity
> check (e.g., the type of the hw queue is HCTX_TYPE_POLL or not) in the
> IO path (submit_bio()/blk_poll()), i.e., fast path.
> 
> We'd better fix it in the control path, i.e., dm could be aware of the
> change when attribute (e.g., support io_poll or not) of one of the
> underlying devices changed at runtime.
> 
> [1] https://listman.redhat.com/archives/dm-devel/2021-February/msg00028.html
> 
> 
> changes since v1:
> - patch 1,2,4 is the same as v1 and have already been reviewed
> - patch 3 is refactored a bit on the basis of suggestions from
> Mike Snitzer.
> - patch 5 is newly added and introduces one new queue flag
> representing if the queue is capable of IO polling. This mainly
> simplifies the logic in queue_poll_store().
> - patch 6 implements the core mechanism supporting IO polling.
> The sanity check checking if the dm device supports IO polling is
> also folded into this patch, and the queue flag will be cleared if
> it doesn't support, in case of table reloading.
> 
> 
> 
> 
> Jeffle Xu (11):
>   block: move definition of blk_qc_t to types.h
>   block: add queue_to_disk() to get gendisk from request_queue
>   block: add poll method to support bio-based IO polling
>   block: add poll_capable method to support bio-based IO polling
>   block/mq: extract one helper function polling hw queue
>   block/mq: add iterator for polling hw queues
>   dm: always return BLK_QC_T_NONE for bio-based device
>   dm: fix iterate_device sanity check
>   dm: support IO polling for bio-based dm device
>   nvme/pci: don't wait for locked polling queue
>   dm: fastpath of bio-based polling
> 
>  block/blk-core.c              |  89 +++++++++++++-
>  block/blk-mq.c                |  27 +----
>  block/blk-sysfs.c             |  14 ++-
>  drivers/md/dm-table.c         | 215 ++++++++++++++++++----------------
>  drivers/md/dm.c               |  90 +++++++++++---
>  drivers/md/dm.h               |   2 +-
>  drivers/nvme/host/pci.c       |   4 +-
>  include/linux/blk-mq.h        |  21 ++++
>  include/linux/blk_types.h     |  10 +-
>  include/linux/blkdev.h        |   4 +
>  include/linux/device-mapper.h |   1 +
>  include/linux/fs.h            |   2 +-
>  include/linux/types.h         |   3 +
>  include/trace/events/kyber.h  |   6 +-
>  14 files changed, 333 insertions(+), 155 deletions(-)
> 

-- 
Thanks,
Jeffle

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

