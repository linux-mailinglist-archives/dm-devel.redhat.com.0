Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 266BE4D32BA
	for <lists+dm-devel@lfdr.de>; Wed,  9 Mar 2022 17:15:10 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-zBNcwXroNV2QBz__mFoLFg-1; Wed, 09 Mar 2022 11:15:07 -0500
X-MC-Unique: zBNcwXroNV2QBz__mFoLFg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E653801585;
	Wed,  9 Mar 2022 16:15:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24A4E4010FCE;
	Wed,  9 Mar 2022 16:15:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 43BFE1953556;
	Wed,  9 Mar 2022 16:15:03 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CF67C1953540
 for <dm-devel@listman.corp.redhat.com>; Wed,  9 Mar 2022 16:11:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 41155141ADA5; Wed,  9 Mar 2022 16:11:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CED1140242B
 for <dm-devel@redhat.com>; Wed,  9 Mar 2022 16:11:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F3F285A5BC
 for <dm-devel@redhat.com>; Wed,  9 Mar 2022 16:11:31 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-lJZfwAjZNAuGw44WAp97UQ-1; Wed, 09 Mar 2022 11:11:28 -0500
X-MC-Unique: lJZfwAjZNAuGw44WAp97UQ-1
Received: by mail-io1-f53.google.com with SMTP id q11so3290388iod.6
 for <dm-devel@redhat.com>; Wed, 09 Mar 2022 08:11:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b0ahshq8jtP5jj+9bckwpJQeh/J039pxeuDgi8d3ElM=;
 b=DjgTfRkBYZIBJt2gQDz9nHcrVDfcir1WKULM4Xc3/HxYcYWuh8vnG5fUBb7oNOaZY7
 D7Z9mtzJIFK1z5D0bIhr0cxxlyrwBIFox9lsm8Hwyo59g9Rz7D30X2O4E2pX+W84Uf1H
 LKAI4oMPus9MasbpU8HjrsrgLscEUnH46ly4kLn7dkNHsjhXU2RAfgn4BkOMoxQKaD6q
 NZzls2RlF1Ndb2S8m9HenwtK432KszdSBM/4/au9M14OVa7LqX61gD+k3sZsOr1ddwTX
 u1oiH99qTJERjigGedQ9g5UA3+qU3PsyG2Ivyqn+KbNyH/ppVXN5u5L24lfUSE/7WDM5
 BMkQ==
X-Gm-Message-State: AOAM530ZOo8hhM19vELRkEKy1klkKXviItV+jLEOlYweRCW56ekoDjyi
 tFY6rMf5qwyjlX4OPmit7Wng43egUgWMqrMU
X-Google-Smtp-Source: ABdhPJyuCEx9TJ1HTABAFYwxnOLexkyNmpi/HFpX2Qu5vQVfApcXiGSfeOYFYppShGJ7MJwiEtcIJw==
X-Received: by 2002:a05:6602:2b0b:b0:60f:6c6f:d114 with SMTP id
 p11-20020a0566022b0b00b0060f6c6fd114mr305470iov.157.1646842287961; 
 Wed, 09 Mar 2022 08:11:27 -0800 (PST)
Received: from [192.168.1.172] ([207.135.234.126])
 by smtp.gmail.com with ESMTPSA id
 p192-20020a6b8dc9000000b006412ce609edsm1187083iod.25.2022.03.09.08.11.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 08:11:27 -0800 (PST)
Message-ID: <d4657e24-4cc7-7372-bafe-d6c9c8005c6b@kernel.dk>
Date: Wed, 9 Mar 2022 09:11:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
To: Ming Lei <ming.lei@redhat.com>
References: <20220307185303.71201-1-snitzer@redhat.com>
 <20220307185303.71201-3-snitzer@redhat.com>
 <eac88ad5-3274-389b-9d18-9b6aa16fcb98@kernel.dk> <Yif/Or0s1rV87a5R@T590>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <Yif/Or0s1rV87a5R@T590>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [dm-devel] [PATCH v6 2/2] dm: support bio polling
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
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com, hch@lst.de,
 Mike Snitzer <snitzer@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/8/22 6:13 PM, Ming Lei wrote:
> On Tue, Mar 08, 2022 at 06:02:50PM -0700, Jens Axboe wrote:
>> On 3/7/22 11:53 AM, Mike Snitzer wrote:
>>> From: Ming Lei <ming.lei@redhat.com>
>>>
>>> Support bio(REQ_POLLED) polling in the following approach:
>>>
>>> 1) only support io polling on normal READ/WRITE, and other abnormal IOs
>>> still fallback to IRQ mode, so the target io is exactly inside the dm
>>> io.
>>>
>>> 2) hold one refcnt on io->io_count after submitting this dm bio with
>>> REQ_POLLED
>>>
>>> 3) support dm native bio splitting, any dm io instance associated with
>>> current bio will be added into one list which head is bio->bi_private
>>> which will be recovered before ending this bio
>>>
>>> 4) implement .poll_bio() callback, call bio_poll() on the single target
>>> bio inside the dm io which is retrieved via bio->bi_bio_drv_data; call
>>> dm_io_dec_pending() after the target io is done in .poll_bio()
>>>
>>> 5) enable QUEUE_FLAG_POLL if all underlying queues enable QUEUE_FLAG_POLL,
>>> which is based on Jeffle's previous patch.
>>
>> It's not the prettiest thing in the world with the overlay on bi_private,
>> but at least it's nicely documented now.
>>
>> I would encourage you to actually test this on fast storage, should make
>> a nice difference. I can run this on a gen2 optane, it's 10x the IOPS
>> of what it was tested on and should help better highlight where it
>> makes a difference.
>>
>> If either of you would like that, then send me a fool proof recipe for
>> what should be setup so I have a poll capable dm device.
> 
> Follows steps for setup dm stripe over two nvmes, then run io_uring on
> the dm stripe dev.

Thanks! Much easier when I don't have to figure it out... Setup:

CPU: 12900K
Drives: 2x P5800X gen2 optane (~5M IOPS each at 512b)

Baseline kernel:

sudo taskset -c 10 t/io_uring -d128 -b512 -s31 -c16 -p1 -F1 -B1 -n1 -R1 -X1 /dev/dm-0
Added file /dev/dm-0 (submitter 0)
polled=1, fixedbufs=1/0, register_files=1, buffered=0, QD=128
Engine=io_uring, sq_ring=128, cq_ring=128
submitter=0, tid=1004
IOPS=2794K, BW=1364MiB/s, IOS/call=31/30, inflight=(124)
IOPS=2793K, BW=1363MiB/s, IOS/call=31/31, inflight=(62)
IOPS=2789K, BW=1362MiB/s, IOS/call=31/30, inflight=(124)
IOPS=2779K, BW=1357MiB/s, IOS/call=31/31, inflight=(124)
IOPS=2780K, BW=1357MiB/s, IOS/call=31/31, inflight=(62)
IOPS=2779K, BW=1357MiB/s, IOS/call=31/31, inflight=(62)
^CExiting on signal
Maximum IOPS=2794K

generating about 500K ints/sec, and using 4k blocks:

sudo taskset -c 10 t/io_uring -d128 -b4096 -s31 -c16 -p1 -F1 -B1 -n1 -R1 -X1 /dev/dm-0
Added file /dev/dm-0 (submitter 0)
polled=1, fixedbufs=1/0, register_files=1, buffered=0, QD=128
Engine=io_uring, sq_ring=128, cq_ring=128
submitter=0, tid=967
IOPS=1683K, BW=6575MiB/s, IOS/call=24/24, inflight=(93)
IOPS=1685K, BW=6584MiB/s, IOS/call=24/24, inflight=(124)
IOPS=1686K, BW=6588MiB/s, IOS/call=24/24, inflight=(124)
IOPS=1684K, BW=6581MiB/s, IOS/call=24/24, inflight=(93)
IOPS=1686K, BW=6589MiB/s, IOS/call=24/24, inflight=(124)
IOPS=1687K, BW=6593MiB/s, IOS/call=24/24, inflight=(128)
IOPS=1687K, BW=6590MiB/s, IOS/call=24/24, inflight=(93)
^CExiting on signal
Maximum IOPS=1687K

which ends up being bw limited for me, because the devices aren't linked
gen4. That's about 1.4M ints/sec.

With the patched kernel, same test:

sudo taskset -c 10 t/io_uring -d128 -b512 -s31 -c16 -p1 -F1 -B1 -n1 -R1 -X1 /dev/dm-0
Added file /dev/dm-0 (submitter 0)
polled=1, fixedbufs=1/0, register_files=1, buffered=0, QD=128
Engine=io_uring, sq_ring=128, cq_ring=128
submitter=0, tid=989
IOPS=4151K, BW=2026MiB/s, IOS/call=16/15, inflight=(128)
IOPS=4159K, BW=2031MiB/s, IOS/call=15/15, inflight=(128)
IOPS=4193K, BW=2047MiB/s, IOS/call=15/15, inflight=(128)
IOPS=4191K, BW=2046MiB/s, IOS/call=15/15, inflight=(128)
IOPS=4202K, BW=2052MiB/s, IOS/call=15/15, inflight=(128)
^CExiting on signal
Maximum IOPS=4202K

with basically zero interrupts, and 4k:

sudo taskset -c 10 t/io_uring -d128 -b4096 -s31 -c16 -p1 -F1 -B1 -n1 -R1 -X1 /dev/dm-0
Added file /dev/dm-0 (submitter 0)
polled=1, fixedbufs=1/0, register_files=1, buffered=0, QD=128
Engine=io_uring, sq_ring=128, cq_ring=128
submitter=0, tid=1015
IOPS=1706K, BW=6666MiB/s, IOS/call=15/15, inflight=(128)
IOPS=1704K, BW=6658MiB/s, IOS/call=15/15, inflight=(128)
IOPS=1704K, BW=6658MiB/s, IOS/call=15/15, inflight=(128)
IOPS=1704K, BW=6658MiB/s, IOS/call=15/15, inflight=(128)
IOPS=1704K, BW=6658MiB/s, IOS/call=15/15, inflight=(128)
^CExiting on signal
Maximum IOPS=1706K

again with basically zero interrupts.

That's about a 50% improvement for polled IO. This is using 2 gen2
optanes, which are good for ~5M IOPS each. Using two threads on a single
core, baseline kernel:

sudo taskset -c 10,11 t/io_uring -d128 -b512 -s31 -c16 -p1 -F1 -B1 -n2 -R1 -X1 /dev/dm-0
Added file /dev/dm-0 (submitter 0)
Added file /dev/dm-0 (submitter 1)
polled=1, fixedbufs=1/0, register_files=1, buffered=0, QD=128
Engine=io_uring, sq_ring=128, cq_ring=128
submitter=0, tid=1081
submitter=1, tid=1082
IOPS=3515K, BW=1716MiB/s, IOS/call=31/30, inflight=(124 62)
IOPS=3515K, BW=1716MiB/s, IOS/call=31/31, inflight=(62 124)
IOPS=3517K, BW=1717MiB/s, IOS/call=30/30, inflight=(113 124)
IOPS=3517K, BW=1717MiB/s, IOS/call=31/31, inflight=(62 62)
^CExiting on signal
Maximum IOPS=3517K

and patched:

udo taskset -c 10,11 t/io_uring -d128 -b512 -s31 -c16 -p1 -F1 -B1 -n2 -R1 -X1 /dev/dm-0
Added file /dev/dm-0 (submitter 0)
Added file /dev/dm-0 (submitter 1)
polled=1, fixedbufs=1/0, register_files=1, buffered=0, QD=128
Engine=io_uring, sq_ring=128, cq_ring=128
submitter=0, tid=949
submitter=1, tid=950
IOPS=4988K, BW=2435MiB/s, IOS/call=15/15, inflight=(128 128)
IOPS=4985K, BW=2434MiB/s, IOS/call=15/15, inflight=(128 128)
IOPS=4970K, BW=2426MiB/s, IOS/call=15/15, inflight=(128 128)
IOPS=4985K, BW=2434MiB/s, IOS/call=15/15, inflight=(128 128)
^CExiting on signal
Maximum IOPS=4988K

which is about a 42% improvement in IOPS.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

