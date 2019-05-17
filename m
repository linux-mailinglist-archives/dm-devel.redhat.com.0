Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F86221287
	for <lists+dm-devel@lfdr.de>; Fri, 17 May 2019 05:34:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8CD0A3084242;
	Fri, 17 May 2019 03:34:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B32A77A3FD;
	Fri, 17 May 2019 03:34:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E2FEC1806B10;
	Fri, 17 May 2019 03:34:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4H3Y09m013618 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 May 2019 23:34:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 44C5627191; Fri, 17 May 2019 03:34:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EB0A16BE1
	for <dm-devel@redhat.com>; Fri, 17 May 2019 03:33:58 +0000 (UTC)
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4419630832D3
	for <dm-devel@redhat.com>; Fri, 17 May 2019 03:33:57 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id i10so9750706ite.0
	for <dm-devel@redhat.com>; Thu, 16 May 2019 20:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Zlc1Z5RAkaS+PLi8IjlRp7vUkQUrPkJAKFClneQV0+4=;
	b=RL0qFDEMyN6iaevXm0sqvWWVZ7MEgondFX77P7G9i30niJ4a6ygBthzOQVm2COtdbm
	/lQ5bVfNdwMnO1oQHUR+msGw93+09086TMi9uvLI+WHB+njNlStrOh+N3bWjMoL/GKR+
	z2P+JD4HUeLrSBc3J5uYKc1bRqpW2lpa3iuYv7K6FKSMinPkVUCJqoGfKS5JvNB0aLKQ
	BoL/MlLGB9+2uC703qsVLYOgNDJMA5eopf2nTc3/ZPQlBQgA0pqsm6kejSYJ7Gast4f8
	FXk/k+1BaiXSmLGRjKdGGPARlBUwVJcCo+I9MDyaFXIzCC7jZMWlGMmwBA/caWju5lVh
	yRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Zlc1Z5RAkaS+PLi8IjlRp7vUkQUrPkJAKFClneQV0+4=;
	b=MoXHkZmXH8IsaSnkFzjLQzepqcqk8oQhfKeojxfL1KgoEkKkzdM/OqsqIr7OXrKCre
	CTgnwF3F8t0xGHCdlbr8EbsIhOpqi+X1bGGbOuXbRMa+5ZxwJnsyObmpglX3Fc3EfqBp
	8u3O2qxMdEqWKfi8amrafr/4HhHzVyo3eJ1WNhIxCmEY9top+o9fqcTYivSDVAdVGAVp
	1fOpJXjtCIgs6jn4nvHcmTrPzgEIdfhN/BpWYmdZ5x+8igu7uWyqkRBNVoJXST/Qy4ns
	2ZbpZ8WwjUHo8QofI0VuHxrSR0bksgTT60TR7VJiFq4VGYz4Ttljf7dDGfYUpGDprNyy
	ywAw==
X-Gm-Message-State: APjAAAXgyTTgAZJoq+K/ZZrcslqB/g9Y0g+pGE386JszvXvGqFiilTV1
	LF9K+Ot+NbbPuyv1Ft0E49Njl8+7FFZx5px4uHE=
X-Google-Smtp-Source: APXvYqzs0Bz8wmwYtNqOt4wvUGYHLM1ecN3L9b4rqTzExniCfH4inr5Kc4YZRlmrKsHhoVkGKXa5dQ82PQcOjVYPBfw=
X-Received: by 2002:a24:f983:: with SMTP id l125mr16700177ith.62.1558064036522;
	Thu, 16 May 2019 20:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190430223722.20845-1-gpiccoli@canonical.com>
In-Reply-To: <20190430223722.20845-1-gpiccoli@canonical.com>
From: Eric Ren <renzhengeek@gmail.com>
Date: Fri, 17 May 2019 11:33:45 +0800
Message-ID: <CAKM4Aez=eC96uyqJa+=Aom2M2eQnknQW_uY4v9NMVpROSiuKSg@mail.gmail.com>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 17 May 2019 03:33:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Fri, 17 May 2019 03:33:57 +0000 (UTC) for IP:'209.85.166.196'
	DOMAIN:'mail-it1-f196.google.com'
	HELO:'mail-it1-f196.google.com' FROM:'renzhengeek@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: -0.111  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_PASS) 209.85.166.196 mail-it1-f196.google.com 209.85.166.196
	mail-it1-f196.google.com <renzhengeek@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, linux-raid@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>, kernel@gpiccoli.net,
	stable@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, jay.vosburgh@canonical.com, gavin.guo@canonical.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Fri, 17 May 2019 03:34:34 +0000 (UTC)

Hello,

On Wed, 1 May 2019 at 06:38, Guilherme G. Piccoli
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
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>

Thanks for the bugfix. I also had a panic having very similar
calltrace below as this one,
when using devicemapper in container scenario and deleting many thin
snapshots by dmsetup
remove_all -f, meanwhile executing lvm command like vgs.

After applied this one, my testing doesn't crash kernel any more for
one week.  Could the block
developers please give more feedback/priority on this one?

My panic trace:
```
50515.136279] BUG: unable to handle kernel NULL pointer dereference at
00000000000003b8
[50515.144704] PGD 0 P4D 0
[50515.147576] Oops: 0000 [#1] SMP PTI
[50515.151403] CPU: 24 PID: 45287 Comm: vgs Kdump: loaded Not tainted
4.19.24-9.x86_64#1
[50515.169295] RIP: 0010:generic_make_request+0x24/0x350
[50515.174684] Code: e9 e1 45 42 00 90 0f 1f 44 00 00 55 48 89 e5 41
55 41 54 53 48 89 fb 48 83 e4 f0 48 83 ec 20 48 8b 47 08 f6 47 15 08
8b 77 10 <4c> 8b a0 b8 03 00 00 0f 84 82 00 00 00 49 8b 84 24 50 07 00
00 a8
[50515.194303] RSP: 0018:ffffa90862373a10 EFLAGS: 00010246
[50515.199869] RAX: 0000000000000000 RBX: ffff99d7338b7800 RCX: 0000000000000000
[50515.207347] RDX: ffff99d51d89c380 RSI: 0000000000000000 RDI: ffff99d7338b7800
[50515.214828] RBP: ffffa90862373a48 R08: 0000000000000000 R09: ffff99a840007300
[50515.222305] R10: ffffa90862373b88 R11: 0000000000000000 R12: ffff99d833592200
[50515.229782] R13: ffffa90862373b58 R14: 0000000000000001 R15: 0000000000000000
[50515.237264] FS:  00007fc36b322880(0000) GS:ffff99d83f000000(0000)
knlGS:0000000000000000
[50515.245944] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[50515.252036] CR2: 00000000000003b8 CR3: 0000005c53ed0001 CR4: 00000000003626a0
[50515.259519] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[50515.266996] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[50515.274473] Call Trace:
[50515.277264]  ? bio_add_page+0x42/0x50
[50515.281267]  submit_bio+0x6e/0x130
[50515.285013]  new_read+0xa2/0xf0 [dm_bufio]
[50515.289454]  dm_bm_read_lock+0x21/0x70 [dm_persistent_data]
[50515.295369]  ro_step+0x31/0x60 [dm_persistent_data]
[50515.300589]  dm_btree_find_key+0xb0/0x180 [dm_persistent_data]
[50515.306765]  dm_thin_get_highest_mapped_block+0x75/0x90 [dm_thin_pool]
[50515.313639]  thin_status+0x145/0x290 [dm_thin_pool]
...
```
Regards,
Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
