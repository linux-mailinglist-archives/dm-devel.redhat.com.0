Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 299A87A270D
	for <lists+dm-devel@lfdr.de>; Fri, 15 Sep 2023 21:18:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694805486;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ueY8rRY/6ER0eE4islQ4S+7ZyO5htJTklCffMrzedcw=;
	b=irWWw2kTEtMZ9+avEF8mjDjvo87i11ICo51ZEAkg3G+6tohHXQ4/eMYIIJCFS6clqJAkl4
	PkBBYfDKq12+HkbXGL7Wu+rhJ/ow2WMVE7W+NTiP0HYlfx4QuzxgZ2i/fSvsYFbiDTS1F6
	KDY9jGZUvVQXM7j9hW1OppJW/2F1+cw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-py_7UDaQMOm_kFWbEI5LoA-1; Fri, 15 Sep 2023 15:18:03 -0400
X-MC-Unique: py_7UDaQMOm_kFWbEI5LoA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D05BB810BDE;
	Fri, 15 Sep 2023 19:18:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 678182026D76;
	Fri, 15 Sep 2023 19:18:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D8A2419465BB;
	Fri, 15 Sep 2023 19:17:59 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6E6A81946588
 for <dm-devel@listman.corp.redhat.com>; Fri, 15 Sep 2023 19:16:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5B7901054F81; Fri, 15 Sep 2023 19:16:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 538A21054F83
 for <dm-devel@redhat.com>; Fri, 15 Sep 2023 19:16:29 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 317CC94595B
 for <dm-devel@redhat.com>; Fri, 15 Sep 2023 19:16:29 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-khYr04vcOJa9oh7T3-DHyQ-1; Fri, 15 Sep 2023 15:16:27 -0400
X-MC-Unique: khYr04vcOJa9oh7T3-DHyQ-1
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1c4456d595cso753475ad.1
 for <dm-devel@redhat.com>; Fri, 15 Sep 2023 12:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694805386; x=1695410186;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4d0S/KrFFhuCEJPC/CFIxjtv4aOnfIY06CkfCl1jd24=;
 b=OteC+FIQOlYHCvPJa/B7l3SKwo+vqKYtNTftvd2j176PN068+8X3RCU+xCg7kwQ5Yh
 ODdchtabv1p/XCQ40+HgbWQtMALpZFbWIF6Nf9yDGaIkMRGUR5Ls4usi1BK7k4SwkTcz
 K4bVLuXyHXrsD0aGVeltn01vjS8gHmb2nvVWum93r4diCkDh9hcXm0aR7Krp36suqxfS
 Qck/Yxsro15WdYpbw2yzR533CzIfH+HaDmYHkkGFWPQWkJO2ck8OT5XYmKITIm0DW/th
 OKG/YOTBQNVmc2W4Ckrtfy78FiX+SdNYu5xd8YGAerm+2WGezgxCclYFDgpJh28spmHv
 q4Kg==
X-Gm-Message-State: AOJu0Yyc+VsV5dmUdVe6C5bpD2Qn/a8xKWjBn0ybyXwwqQUwrQLZywE/
 iOy5rdc7WVSwPrg36zMeoX2Qzg==
X-Google-Smtp-Source: AGHT+IFAseZpw+pqPT/RVVEFznlZ8ER5uIkgDYzTGZsKu2VzsiWOTj5+L1BrBSpWxlfa45+s2ofPZg==
X-Received: by 2002:a17:902:d4c7:b0:1c1:fbec:bc32 with SMTP id
 o7-20020a170902d4c700b001c1fbecbc32mr2673424plg.6.1694805385950; 
 Fri, 15 Sep 2023 12:16:25 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a170903110900b001bc930d4517sm3824972plh.42.2023.09.15.12.16.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 12:16:25 -0700 (PDT)
Message-ID: <32db2dc2-1b9f-4c1e-a74f-e13997869548@kernel.dk>
Date: Fri, 15 Sep 2023 13:16:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <snitzer@kernel.org>
References: <4f5737f0-9299-4968-8cb5-07c7645bbffd@kernel.dk>
 <514767b4-5b2a-4f8e-a6ba-6722ddac5330@kernel.dk>
 <ZQSoWU78md88xFgB@redhat.com> <dbee74a-cb51-ad2-7cad-4ac67488c84@redhat.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <dbee74a-cb51-ad2-7cad-4ac67488c84@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [dm-devel] DM brokeness with NOWAIT
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
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.dk
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9/15/23 1:13 PM, Mikulas Patocka wrote:
> 
> 
> On Fri, 15 Sep 2023, Mike Snitzer wrote:
> 
>> On Fri, Sep 15 2023 at 12:14P -0400,
>> Jens Axboe <axboe@kernel.dk> wrote:
>>
>>> On 9/15/23 10:04 AM, Jens Axboe wrote:
>>>> Hi,
>>>>
>>>> Threw some db traffic into my testing mix, and that ended in tears
>>>> very quickly:
>>>>
>>>> CPU: 7 PID: 49609 Comm: ringbuf-read.t Tainted: G        W          6.6.0-rc1-g39956d2dcd81 #129
>>>> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
>>>> Call Trace:
>>>>  <TASK>
>>>>  dump_stack_lvl+0x11d/0x1b0
>>>>  __might_resched+0x3c3/0x5e0
>>>>  ? preempt_count_sub+0x150/0x150
>>>>  mempool_alloc+0x1e2/0x390
>>>>  ? sanity_check_pinned_pages+0x23/0x1010
>>>>  ? mempool_resize+0x7d0/0x7d0
>>>>  bio_alloc_bioset+0x417/0x8c0
>>>>  ? bvec_alloc+0x200/0x200
>>>>  ? __gup_device_huge+0x900/0x900
>>>>  bio_alloc_clone+0x53/0x100
>>>>  dm_submit_bio+0x27f/0x1a20
>>>>  ? lock_release+0x4b7/0x670
>>>>  ? pin_user_pages_fast+0xb6/0xf0
>>>>  ? blk_try_enter_queue+0x1a0/0x4d0
>>>>  ? dm_dax_direct_access+0x260/0x260
>>>>  ? rcu_is_watching+0x12/0xb0
>>>>  ? blk_try_enter_queue+0x1cc/0x4d0
>>>>  __submit_bio+0x239/0x310
>>>>  ? __bio_queue_enter+0x700/0x700
>>>>  ? kvm_clock_get_cycles+0x40/0x60
>>>>  ? ktime_get+0x285/0x470
>>>>  submit_bio_noacct_nocheck+0x4d9/0xb80
>>>>  ? should_fail_request+0x80/0x80
>>>>  ? preempt_count_sub+0x150/0x150
>>>>  ? folio_flags+0x6c/0x1e0
>>>>  submit_bio_noacct+0x53e/0x1b30
>>>>  blkdev_direct_IO.part.0+0x833/0x1810
>>>>  ? rcu_is_watching+0x12/0xb0
>>>>  ? lock_release+0x4b7/0x670
>>>>  ? blkdev_read_iter+0x40d/0x530
>>>>  ? reacquire_held_locks+0x4e0/0x4e0
>>>>  ? __blkdev_direct_IO_simple+0x780/0x780
>>>>  ? rcu_is_watching+0x12/0xb0
>>>>  ? __mark_inode_dirty+0x297/0xd50
>>>>  ? preempt_count_add+0x72/0x140
>>>>  blkdev_read_iter+0x2a4/0x530
>>>>  ? blkdev_write_iter+0xc40/0xc40
>>>>  io_read+0x369/0x1490
>>>>  ? rcu_is_watching+0x12/0xb0
>>>>  ? io_writev_prep_async+0x260/0x260
>>>>  ? __fget_files+0x279/0x410
>>>>  ? rcu_is_watching+0x12/0xb0
>>>>  io_issue_sqe+0x18a/0xd90
>>>>  io_submit_sqes+0x970/0x1ed0
>>>>  __do_sys_io_uring_enter+0x14d4/0x2650
>>>>  ? io_submit_sqes+0x1ed0/0x1ed0
>>>>  ? rcu_is_watching+0x12/0xb0
>>>>  ? __do_sys_io_uring_register+0x3f6/0x2190
>>>>  ? io_req_caches_free+0x500/0x500
>>>>  ? ksys_mmap_pgoff+0x85/0x5b0
>>>>  ? rcu_is_watching+0x12/0xb0
>>>>  ? trace_irq_enable.constprop.0+0xd0/0x100
>>>>  do_syscall_64+0x39/0xb0
>>>>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
>>>>
>>>> which seems to demonstrate a misunderstanding on what REQ_NOWAIT is
>>>> about. In particulary, it seems to assume you can then submit with
>>>> atomic context? DM does an rcu_read_lock() and happily proceeds to
>>>> attempt to submit IO under RCU being disabled.
>>>
>>> Did a quick check to see where this came from, and it got added with:
>>>
>>> commit 563a225c9fd207326c2a2af9d59b4097cb31ce70
>>> Author: Mike Snitzer <snitzer@kernel.org>
>>> Date:   Sat Mar 26 21:08:36 2022 -0400
>>>
>>>     dm: introduce dm_{get,put}_live_table_bio called from dm_submit_bio
>>>
>>> which conspiciously doesn't include any numbers on why this is necessary
>>> or a good thing, and notably probably wasn't tested? This landed in 5.19
>>> fwiw.
>>
>> Don't recall what I was thinking, and I clearly didn't properly test
>> either... should've consulted Mikulas.  Sorry for the trouble.
>>
>> Would you like to send a formal patch with your Signed-off-by and I'll
>> mark it for stable@ and get it to Linus?
>>
>> Mike
> 
> We could revert that commit or we could change the all the remaining 
> GFP_NOIOs in drivers/md/dm.c to "bio_opf & REQ_NOWAIT ? GFP_NOWAIT : 
> GFP_NOIO". I'm not sure which one of these possibilities is better.
> 
> Converting GFP_NOIOs would complicate dm.c a bit, but it would make sure 
> that requests with REQ_NOWAIT don't really sleep. What do you think?

I've sent out a patch for this now. Getting rid of SRCU for NOWAIT may
indeed make sense, but I think that should get introduced separately and
with actual numbers demonstrating it is a win and by how much. IMHO it
doesn't necessarily need to be a big win, the main benefit here would be
that NOWAIT is supported a lot better.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

