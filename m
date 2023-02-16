Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CB38D698918
	for <lists+dm-devel@lfdr.de>; Thu, 16 Feb 2023 01:08:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676506136;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XskK82DANZJy8KzK26gy6BwbwRb8PfBn2bX3IcBtvJE=;
	b=gNbx6pVp+sRSQb5D1x7YuStXpagaD7MfhlkfwIbT1XFOOnkG2GXFOp/x7LER29n8b/yRWT
	ronGZxRgM22yxZr5lTlQvMgGKB7bB6OZR5AngCO7am0EAXhu/+4dzFfzKfUsqEfV6IhjuN
	xIQqftuYf3Gx5L3ruIP+3OT6r8w4fzk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-DG1WxwAkOXSvSATaY1oszg-1; Wed, 15 Feb 2023 19:08:55 -0500
X-MC-Unique: DG1WxwAkOXSvSATaY1oszg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09D4785CBE0;
	Thu, 16 Feb 2023 00:08:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 884CB40ED76B;
	Thu, 16 Feb 2023 00:08:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AD6F719465A8;
	Thu, 16 Feb 2023 00:08:46 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7FD621946588
 for <dm-devel@listman.corp.redhat.com>; Thu, 16 Feb 2023 00:08:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3F4AB492B1B; Thu, 16 Feb 2023 00:08:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-8-17.pek2.redhat.com [10.72.8.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D70E6492B15;
 Thu, 16 Feb 2023 00:08:41 +0000 (UTC)
Date: Thu, 16 Feb 2023 08:08:35 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Pingfan Liu <piliu@redhat.com>
Message-ID: <Y+10AxZ8tcd6SemJ@T590>
References: <CAF+s44TZw40c_hNDi78VkMq6Xhp23h5j_cadHWirOnYW-wR=NQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAF+s44TZw40c_hNDi78VkMq6Xhp23h5j_cadHWirOnYW-wR=NQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [dm-devel] A hang bug of dm on s390x
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: dm-devel@redhat.com, Ming Lei <minlei@redhat.com>,
 Tao Liu <ltao@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 15, 2023 at 07:23:40PM +0800, Pingfan Liu wrote:
> Hi guys,
> 
> I encountered  a hang issue on a s390x system.  The tested kernel is
> not preemptible and booting with "nr_cpus=1"
> 
> The test steps:
>       umount /home
>       lvremove /dev/rhel_s390x-kvm-011/home
>       ## uncomment "snapshot_autoextend_threshold = 70" and
>       "snapshot_autoextend_percent = 20" in /etc/lvm/lvm.conf
> 
>       systemctl enable lvm2-monitor.service
>       systemctl start lvm2-monitor.service
> 
>       lvremove -y rhel_s390x-kvm-011/thinp
>       lvcreate -L 10M -T rhel_s390x-kvm-011/thinp
>       lvcreate -V 400M -T rhel_s390x-kvm-011/thinp -n src
>       mkfs.ext4 /dev/rhel_s390x-kvm-011/src
>       mount /dev/rhel_s390x-kvm-011/src /mnt
>       for((i=0;i<4;i++)); do dd if=/dev/zero of=/mnt/test$i.img
> bs=100M count=1; done
> 
> And the system hangs with the console log [1]
> 
> The related kernel config
> 
>     CONFIG_PREEMPT_NONE_BUILD=y
>     CONFIG_PREEMPT_NONE=y
>     CONFIG_PREEMPT_COUNT=y
>     CONFIG_SCHED_CORE=y
> 
> It turns out that when hanging, the kernel is stuck in the dead-loop
> in the function dm_wq_work()
>         while (!test_bit(DMF_BLOCK_IO_FOR_SUSPEND, &md->flags)) {
>                 spin_lock_irq(&md->deferred_lock);
>                 bio = bio_list_pop(&md->deferred);
>                 spin_unlock_irq(&md->deferred_lock);
> 
>                 if (!bio)
>                         break;
>                 thread_cpu = smp_processor_id();
>                 submit_bio_noacct(bio);
>         }
> where dm_wq_work()->__submit_bio_noacct()->...->dm_handle_requeue()
> keeps generating new bio, and the condition "if (!bio)" can not be
> meet.
> 
> 
> After applying the following patch, the issue is gone.
> 
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index e1ea3a7bd9d9..95c9cb07a42f 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -2567,6 +2567,7 @@ static void dm_wq_work(struct work_struct *work)
>                         break;
> 
>                 submit_bio_noacct(bio);
> +               cond_resched();
>         }
>  }
> 
> But I think it is not a proper solution. And without this patch, if
> removing nr_cpus=1 (the system has two cpus), the issue can not be
> triggered. That says when more than one cpu, the above loop can exit
> by the condition "if (!bio)"
> 
> Any ideas?

I think the patch is correct.

For kernel built without CONFIG_PREEMPT, in case of single cpu core,
if the dm target(such as dm-thin) needs another wq or kthread for
handling IO, then dm target side is blocked because dm_wq_work()
holds the single cpu, sooner or later, dm target may have not
resource to handle new io from dm core and returns REQUEUE.

Then dm_wq_work becomes one dead loop.


Thanks,
Ming
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

