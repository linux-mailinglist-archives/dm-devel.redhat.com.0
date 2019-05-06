Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8E015F99
	for <lists+dm-devel@lfdr.de>; Tue,  7 May 2019 10:42:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0CE5A30821FF;
	Tue,  7 May 2019 08:42:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A24E95D9E1;
	Tue,  7 May 2019 08:42:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CAEA18089CA;
	Tue,  7 May 2019 08:42:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x46GpCUq022074 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 May 2019 12:51:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8446A6085B; Mon,  6 May 2019 16:51:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6268260857;
	Mon,  6 May 2019 16:51:08 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1969F3086227;
	Mon,  6 May 2019 16:51:07 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id f24so5082615qtk.11;
	Mon, 06 May 2019 09:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GIhzL1cw5MneYYR1EQW+ThAGljCkXhVHNDwUfQXFyo4=;
	b=XZ7HXSIsNo69QtJ5jHpPZ75ljYTcPnDgKDPz21kmeaw/B1JTzvLN+1Qbsdnl3sD+4b
	Yxs3e4OrpuJ0UShp8mQHhiHj3Q0dt2qwenr5zTaJHwu5qA1Y2lgjq4QNmbshYqjymvsw
	r3KxsMK+QQAdj1e4UIuiWyhenendNOyvrGwMlQbJzOAZn9RimZFNGAprD3d+FbDAhp+2
	kF9V/S25ORFhxQa9oEK68cJgfPT6wcGGB3qdM9grCSAwMs+CoG6tD+ScMSp0NtMzhPXG
	GgXBbYG3zwiHFNIlq9GucbIBi8cvklL3abzbD/VSl9jtkQt+zIDuRUtrLKOCm+oGfd3E
	MqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GIhzL1cw5MneYYR1EQW+ThAGljCkXhVHNDwUfQXFyo4=;
	b=bUNiSrOnW7jti4hISQEPWlF7fQeZBM9B4MUxf6an2ZRaVtJ1BH7k8BrvehZqXufzwe
	iQxpF5V4TtqL5wt7BlZgMaJWz6EK+N+fkrWI0IB4PvaDbYLLE2jOGNqM6t1r/4Qd15JV
	PKeUmWK9OmEy8InTqpDP3TH05llUV02BhBGMadmeylGFM4af+/n7D4fIlJoHwXqsB2ao
	zLv2GC5zj4lHEelF/451Si8+5EZBzE7+0oC8Hktnyq8r5W/gMUN/9FeFbFUIXk6FVL3P
	R6/Au8zagoxgDkFneBYhfysczSbgrCRlTgMneir28tk6CCx7itBtXCKbkNEpfaix8+6n
	frTw==
X-Gm-Message-State: APjAAAWfa1kWzw7F2/qcRD77gDg+75MOCOzZ1VoiZWNKUEP9iC2eO4rj
	1RyGJzgJcRZATq9zqxfKrGfMErEBIo77YwR+iFYf1g==
X-Google-Smtp-Source: APXvYqx/8sLYz9E3hw9/ZbdNldT9fuk82NXH6iaLHuikdyjkBZl+mwGqSoe187gvHcvsSa01UUHveUJ/BoKZjBmgjNo=
X-Received: by 2002:a0c:ba99:: with SMTP id x25mr22156674qvf.212.1557161466306;
	Mon, 06 May 2019 09:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190430223722.20845-1-gpiccoli@canonical.com>
	<20190430223722.20845-2-gpiccoli@canonical.com>
In-Reply-To: <20190430223722.20845-2-gpiccoli@canonical.com>
From: Song Liu <liu.song.a23@gmail.com>
Date: Mon, 6 May 2019 12:50:55 -0400
Message-ID: <CAPhsuW4SeUhNOJJkEf9wcLjbbc9qX0=C8zqbyCtC7Q8fdL91hw@mail.gmail.com>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Mon, 06 May 2019 16:51:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Mon, 06 May 2019 16:51:07 +0000 (UTC) for IP:'209.85.160.193'
	DOMAIN:'mail-qt1-f193.google.com'
	HELO:'mail-qt1-f193.google.com' FROM:'liu.song.a23@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.142  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
	SPF_PASS) 209.85.160.193 mail-qt1-f193.google.com 209.85.160.193
	mail-qt1-f193.google.com <liu.song.a23@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 07 May 2019 04:42:14 -0400
Cc: axboe@kernel.dk, linux-raid <linux-raid@vger.kernel.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	kernel@gpiccoli.net, stable@vger.kernel.org,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Jay Vosburgh <jay.vosburgh@canonical.com>,
	Gavin Guo <gavin.guo@canonical.com>
Subject: Re: [dm-devel] [PATCH 2/2] md/raid0: Do not bypass blocking queue
 entered for raid0 bios
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Tue, 07 May 2019 08:42:37 +0000 (UTC)

On Tue, Apr 30, 2019 at 6:38 PM Guilherme G. Piccoli
<gpiccoli@canonical.com> wrote:
>
> Commit cd4a4ae4683d ("block: don't use blocking queue entered for
> recursive bio submits") introduced the flag BIO_QUEUE_ENTERED in order
> split bios bypass the blocking queue entering routine and use the live
> non-blocking version. It was a result of an extensive discussion in
> a linux-block thread[0], and the purpose of this change was to prevent
> a hung task waiting on a reference to drop.
>
> Happens that md raid0 split bios all the time, and more important,
> it changes their underlying device to the raid member. After the change
> introduced by this flag's usage, we experience various crashes if a raid0
> member is removed during a large write. This happens because the bio
> reaches the live queue entering function when the queue of the raid0
> member is dying.
>
> A simple reproducer of this behavior is presented below:
> a) Build kernel v5.1-rc7 with CONFIG_BLK_DEV_THROTTLING=y.
>
> b) Create a raid0 md array with 2 NVMe devices as members, and mount it
> with an ext4 filesystem.
>
> c) Run the following oneliner (supposing the raid0 is mounted in /mnt):
> (dd of=/mnt/tmp if=/dev/zero bs=1M count=999 &); sleep 0.3;
> echo 1 > /sys/block/nvme0n1/device/device/remove
> (whereas nvme0n1 is the 2nd array member)
>
> This will trigger the following warning/oops:
>
> ------------[ cut here ]------------
> no blkg associated for bio on block-device: nvme0n1
> WARNING: CPU: 9 PID: 184 at ./include/linux/blk-cgroup.h:785
> generic_make_request_checks+0x4dd/0x690
> [...]
> BUG: unable to handle kernel NULL pointer dereference at 0000000000000155
> PGD 0 P4D 0
> Oops: 0000 [#1] SMP PTI
> RIP: 0010:blk_throtl_bio+0x45/0x970
> [...]
> Call Trace:
>  generic_make_request_checks+0x1bf/0x690
>  generic_make_request+0x64/0x3f0
>  raid0_make_request+0x184/0x620 [raid0]
>  ? raid0_make_request+0x184/0x620 [raid0]
>  ? blk_queue_split+0x384/0x6d0
>  md_handle_request+0x126/0x1a0
>  md_make_request+0x7b/0x180
>  generic_make_request+0x19e/0x3f0
>  submit_bio+0x73/0x140
> [...]
>
> This patch changes raid0 driver to fallback to the "old" blocking queue
> entering procedure, by clearing the BIO_QUEUE_ENTERED from raid0 bios.
> This prevents the crashes and restores the regular behavior of raid0
> arrays when a member is removed during a large write.
>
> [0] https://marc.info/?l=linux-block&m=152638475806811
>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Ming Lei <ming.lei@redhat.com>
> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Cc: stable@vger.kernel.org # v4.18
> Fixes: cd4a4ae4683d ("block: don't use blocking queue entered for recursive bio submits")
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>

IIUC, we need this for all raid types. Is it possible to fix that in md.c so
all types get the fix?

Thanks,
Song

> ---
>  drivers/md/raid0.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
> index f3fb5bb8c82a..d5bdc79e0835 100644
> --- a/drivers/md/raid0.c
> +++ b/drivers/md/raid0.c
> @@ -547,6 +547,7 @@ static void raid0_handle_discard(struct mddev *mddev, struct bio *bio)
>                         trace_block_bio_remap(bdev_get_queue(rdev->bdev),
>                                 discard_bio, disk_devt(mddev->gendisk),
>                                 bio->bi_iter.bi_sector);
> +               bio_clear_flag(bio, BIO_QUEUE_ENTERED);
>                 generic_make_request(discard_bio);
>         }
>         bio_endio(bio);
> @@ -602,6 +603,7 @@ static bool raid0_make_request(struct mddev *mddev, struct bio *bio)
>                                 disk_devt(mddev->gendisk), bio_sector);
>         mddev_check_writesame(mddev, bio);
>         mddev_check_write_zeroes(mddev, bio);
> +       bio_clear_flag(bio, BIO_QUEUE_ENTERED);
>         generic_make_request(bio);
>         return true;
>  }
> --
> 2.21.0
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
