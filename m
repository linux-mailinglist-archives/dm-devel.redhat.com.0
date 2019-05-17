Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B2F22007
	for <lists+dm-devel@lfdr.de>; Sat, 18 May 2019 00:05:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B8E87308212A;
	Fri, 17 May 2019 22:05:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4227C1972A;
	Fri, 17 May 2019 22:05:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 34371C596;
	Fri, 17 May 2019 22:05:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4HM4vjL025201 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 May 2019 18:04:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B2F615D71A; Fri, 17 May 2019 22:04:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEAFF5D719
	for <dm-devel@redhat.com>; Fri, 17 May 2019 22:04:55 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2EB79307FBCB
	for <dm-devel@redhat.com>; Fri, 17 May 2019 22:04:46 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 15so3975410wmg.5
	for <dm-devel@redhat.com>; Fri, 17 May 2019 15:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=a8zrpRD4WQSC0bql+5SNwotLtSqhpQ2N+iyeA6G7890=;
	b=HDB4UjrnDkFOLde1idgGEA15LrxWSQOLEFVapsFCSGkZHfaTIO+ePjpK1Dyai31w2t
	OhweGJ+Fz620r7eOkdMQ5Ba4dd9UHwvIJuvKL7wTlTVzt4F8Ax452WIUiC4YxffMn9bp
	qwg+EuVf8hQN+4v608beAmrvjH2++A5Lsa+ZCJCj/dV43E2YJUWTni0a0jb5HpLB4khp
	mB/Fv/y+6Hur+nY1SBYJb6PUc5r6Ylyj2eDEo5mt3VHl0/m2Fop/jJ1QyuT95S2Q8nXU
	6PZFHDY5q6SHmjImQfzkuNLGhLEn7866OFh6+/nu9crUxN98aYGEyONuYfEznX6N+KNG
	9uqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=a8zrpRD4WQSC0bql+5SNwotLtSqhpQ2N+iyeA6G7890=;
	b=EQY01u/knMjMXIm6RcHc4Ty1hMYIQxo08liYy5CM8ZR7MzDvNl1qQpbtB7sk6MFIV8
	iK/8GSFvo8+c/jxD0XBIEpK1vcGuLSnCJwfcNecL3fcDqYvpi567zDlFFDAGDoCKYA/X
	W4AYPUvC/8cucTFYAp22uDzGhlkfCEiLZsou/MTVz4iWEJIFIJoFrwnDTh3g4yr5yC69
	M4/MFG8iZY7xWWLeGGU1cb7RcbUvR46K/8OoVLFB4rHOIdFNwfICYTCHu/wAYuIcWmi8
	NNPRuLhg+mR8yri4GJ6yrgEMuL54/NNXI1NZzpAjdXgWekDSQF5cOtx+/V4SmQgIYJu+
	iidA==
X-Gm-Message-State: APjAAAUBTrtylcwHrgE1TJkLSfpd7T2muU8dvPDFJYtCoWDnOcEam4/3
	Vy1Sg6C/TFA9Zzwt8oM2H/w/RHVnCfeSmDBu8iM=
X-Google-Smtp-Source: APXvYqzMrlVr79ILYiRFlMzmeGQnHyZo1wggiaGD9IG6AjeSL/odbeC8KCwqd1p9PccWL5zlVpiCHCfy++wHhd8kj7I=
X-Received: by 2002:a1c:760f:: with SMTP id r15mr20146659wmc.134.1558130684743;
	Fri, 17 May 2019 15:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190430223722.20845-1-gpiccoli@canonical.com>
In-Reply-To: <20190430223722.20845-1-gpiccoli@canonical.com>
From: Ming Lei <tom.leiming@gmail.com>
Date: Sat, 18 May 2019 06:04:32 +0800
Message-ID: <CACVXFVNsOoJqipwivoCbH1jNs_5b0g9E6HWhh6kXYTzetALzQQ@mail.gmail.com>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 17 May 2019 22:04:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Fri, 17 May 2019 22:04:46 +0000 (UTC) for IP:'209.85.128.67'
	DOMAIN:'mail-wm1-f67.google.com' HELO:'mail-wm1-f67.google.com'
	FROM:'tom.leiming@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.109  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.67 mail-wm1-f67.google.com 209.85.128.67
	mail-wm1-f67.google.com <tom.leiming@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>,
	"open list:SOFTWARE RAID \(Multiple Disks\) SUPPORT"
	<linux-raid@vger.kernel.org>,
	Bart Van Assche <bvanassche@acm.org>, kernel@gpiccoli.net,
	stable <stable@vger.kernel.org>, linux-block <linux-block@vger.kernel.org>,
	"open list:DEVICE-MAPPER \(LVM\)" <dm-devel@redhat.com>,
	Jay Vosburgh <jay.vosburgh@canonical.com>,
	Gavin Guo <gavin.guo@canonical.com>
Subject: Re: [dm-devel] [PATCH 1/2] block: Fix a NULL pointer dereference in
	generic_make_request()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Fri, 17 May 2019 22:05:38 +0000 (UTC)

On Wed, May 1, 2019 at 6:38 AM Guilherme G. Piccoli
<gpiccoli@canonical.com> wrote:
>
> Commit 37f9579f4c31 ("blk-mq: Avoid that submitting a bio concurrently
> with device removal triggers a crash") introduced a NULL pointer
> dereference in generic_make_request(). The patch sets q to NULL and
> enter_succeeded to false; right after, there's an 'if (enter_succeeded)'
> which is not taken, and then the 'else' will dereference q in
> blk_queue_dying(q).
>
> This patch just moves the 'q = NULL' to a point in which it won't trigger
> the oops, although the semantics of this NULLification remains untouched.
>
> A simple test case/reproducer is as follows:
> a) Build kernel v5.1-rc7 with CONFIG_BLK_CGROUP=n.
>
> b) Create a raid0 md array with 2 NVMe devices as members, and mount it
> with an ext4 filesystem.
>
> c) Run the following oneliner (supposing the raid0 is mounted in /mnt):
> (dd of=/mnt/tmp if=/dev/zero bs=1M count=999 &); sleep 0.3;
> echo 1 > /sys/block/nvme0n1/device/device/remove
> (whereas nvme0n1 is the 2nd array member)
>
> This will trigger the following oops:
>
> BUG: unable to handle kernel NULL pointer dereference at 0000000000000078
> PGD 0 P4D 0
> Oops: 0000 [#1] SMP PTI
> RIP: 0010:generic_make_request+0x32b/0x400
> Call Trace:
>  submit_bio+0x73/0x140
>  ext4_io_submit+0x4d/0x60
>  ext4_writepages+0x626/0xe90
>  do_writepages+0x4b/0xe0
> [...]
>
> This patch has no functional changes and preserves the md/raid0 behavior
> when a member is removed before kernel v4.17.
>
> Cc: Bart Van Assche <bvanassche@acm.org>
> Cc: stable@vger.kernel.org # v4.17
> Fixes: 37f9579f4c31 ("blk-mq: Avoid that submitting a bio concurrently with device removal triggers a crash")

BTW, the legacy IO request path is removed since 5.0, the above fault
commit can be
removed as done by the following patches:

https://lore.kernel.org/linux-block/20190515030310.20393-1-ming.lei@redhat.com/T/#t

> Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
> ---
>  block/blk-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/block/blk-core.c b/block/blk-core.c
> index a55389ba8779..e21856a7f3fa 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -1076,7 +1076,6 @@ blk_qc_t generic_make_request(struct bio *bio)
>                                 flags = BLK_MQ_REQ_NOWAIT;
>                         if (blk_queue_enter(q, flags) < 0) {
>                                 enter_succeeded = false;
> -                               q = NULL;
>                         }

Please remove '{}'.

>                 }
>
> @@ -1108,6 +1107,7 @@ blk_qc_t generic_make_request(struct bio *bio)
>                                 bio_wouldblock_error(bio);
>                         else
>                                 bio_io_error(bio);
> +                       q = NULL;
>                 }
>                 bio = bio_list_pop(&bio_list_on_stack[0]);
>         } while (bio);
> --
> 2.21.0
>

Reviewed-by: Ming Lei <ming.lei@redhat.com>

Thanks,
Ming Lei

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
