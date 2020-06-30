Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC3D20F8BE
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 17:44:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-A1mQLhSDO96JRkUVTZa1wA-1; Tue, 30 Jun 2020 11:44:26 -0400
X-MC-Unique: A1mQLhSDO96JRkUVTZa1wA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D1B6A0C04;
	Tue, 30 Jun 2020 15:44:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C45905C1B0;
	Tue, 30 Jun 2020 15:44:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 26BBF6C9C4;
	Tue, 30 Jun 2020 15:44:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05UFhnkr008291 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jun 2020 11:43:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B278B2166BA2; Tue, 30 Jun 2020 15:43:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE20B217B438
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 15:43:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED2B0857CE8
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 15:43:37 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-349-rkHX2xz1MtegEKQ7QezQHg-1; Tue, 30 Jun 2020 11:43:34 -0400
X-MC-Unique: rkHX2xz1MtegEKQ7QezQHg-1
Received: by mail-pf1-f195.google.com with SMTP id x72so157341pfc.6
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 08:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Czyj7qztvQ/ET90pA6Cgm802J9mg/c4CrHX1EyYszQQ=;
	b=pE1iPJ+uRJgSf/+OUygapa5MvMR3mmjvL8QJaKLOo9bkS4gm2DD795Ur4V3RaEpoP7
	Nw4J2yYeg0Cfa7Pl1tWdE9gQtrUno9iSXWCVPUpr+cGTIsTIyzi2cBWxPVn1oP4B0rUw
	b4Z0uqc1PVCD5mmCQuyJ/JYKcFHYjhx5gw+51+O5f812yg5SCVTOucFb3SAruBZFAr4U
	S3sQ83CHDuZiySNIt0HByyh1E1Rv9LE2IoGZNBh2pNovbeGBOWVJ1Ex+jJfwcveWVtaL
	zxwnshNUgG0H6Uc3bAVL8ln5zGnf7zSI+2qyhF+IhIVZ3i3OPXSTF5SB46cULJRadY3e
	8weg==
X-Gm-Message-State: AOAM5332zSTLKQllondF2ryDNxwzOd/2lO/v355XZdWOIabSW4PYtlqy
	HQDprNlAOhcqTPDtjwF2ZS8euA==
X-Google-Smtp-Source: ABdhPJx6lEIGGyQAAazhh6sEGODM0EvGn2wcc8uAkFeSAVS9hqQhG93iUqi0nvo2CJcI+RwKQRfdOw==
X-Received: by 2002:a65:5a0f:: with SMTP id y15mr15197406pgs.6.1593531813542; 
	Tue, 30 Jun 2020 08:43:33 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:8c61:4113:50ea:3eb3:a39b?
	([2605:e000:100e:8c61:4113:50ea:3eb3:a39b])
	by smtp.gmail.com with ESMTPSA id
	w68sm3185027pff.191.2020.06.30.08.43.31
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 30 Jun 2020 08:43:32 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
References: <20200629193947.2705954-1-hch@lst.de>
	<bd1443c0-be37-115b-1110-df6f0e661a50@kernel.dk>
Message-ID: <6ddbe343-0fc2-58c8-3726-c4ba9952994f@kernel.dk>
Date: Tue, 30 Jun 2020 09:43:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <bd1443c0-be37-115b-1110-df6f0e661a50@kernel.dk>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-m68k@vger.kernel.org, linux-nvdimm@lists.01.org,
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-raid@vger.kernel.org,
	dm-devel@redhat.com, drbd-dev@tron.linbit.com,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [dm-devel] rename ->make_request_fn and move it to the
 block_device_operations
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6/30/20 7:57 AM, Jens Axboe wrote:
> On 6/29/20 1:39 PM, Christoph Hellwig wrote:
>> Hi Jens,
>>
>> this series moves the make_request_fn method into block_device_operations
>> with the much more descriptive ->submit_bio name.  It then also gives
>> generic_make_request a more descriptive name, and further optimize the
>> path to issue to blk-mq, removing the need for the direct_make_request
>> bypass.
> 
> Looks good to me, and it's a nice cleanup as well. Applied.

Dropped, insta-crashes with dm:

[   10.240134] BUG: kernel NULL pointer dereference, address: 0000000000000000
[   10.241000] #PF: supervisor instruction fetch in kernel mode
[   10.241666] #PF: error_code(0x0010) - not-present page
[   10.242280] PGD 0 P4D 0 
[   10.242600] Oops: 0010 [#1] PREEMPT SMP
[   10.243073] CPU: 1 PID: 2110 Comm: systemd-udevd Not tainted 5.8.0-rc3+ #6655
[   10.243939] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1 04/01/2014
[   10.245012] RIP: 0010:0x0
[   10.245322] Code: Bad RIP value.
[   10.245695] RSP: 0018:ffffc900002f7af8 EFLAGS: 00010246
[   10.246333] RAX: ffffffff81c83520 RBX: ffff8881b805dea8 RCX: ffff88819e844070
[   10.247227] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff88819e844070
[   10.248112] RBP: ffffc900002f7b48 R08: ffff8881b6f38800 R09: ffff88818ff0ea58
[   10.248994] R10: 0000000000000000 R11: ffff88818ff0ea58 R12: ffff88819e844070
[   10.250077] R13: 00000000ffffffff R14: 0000000000000000 R15: ffff888107812948
[   10.251168] FS:  00007f5c3ed66a80(0000) GS:ffff8881b9c80000(0000) knlGS:0000000000000000
[   10.252161] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   10.253189] CR2: ffffffffffffffd6 CR3: 00000001b2953003 CR4: 00000000001606e0
[   10.254157] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   10.255279] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   10.256365] Call Trace:
[   10.256781]  submit_bio_noacct+0x1f6/0x3d0
[   10.257297]  submit_bio+0x37/0x130
[   10.257780]  ? guard_bio_eod+0x2e/0x70
[   10.258418]  mpage_readahead+0x13c/0x180
[   10.259096]  ? blkdev_direct_IO+0x490/0x490
[   10.259654]  read_pages+0x68/0x2d0
[   10.260051]  page_cache_readahead_unbounded+0x1b7/0x220
[   10.260818]  generic_file_buffered_read+0x865/0xc80
[   10.261587]  ? _copy_to_user+0x6d/0x80
[   10.262171]  ? cp_new_stat+0x119/0x130
[   10.262680]  new_sync_read+0xfe/0x170
[   10.263155]  vfs_read+0xc8/0x180
[   10.263647]  ksys_read+0x53/0xc0
[   10.264209]  do_syscall_64+0x3c/0x70
[   10.264759]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   10.265200] RIP: 0033:0x7f5c3fcc9ab2
[   10.265510] Code: Bad RIP value.
[   10.265775] RSP: 002b:00007ffc8e0cf9c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[   10.266426] RAX: ffffffffffffffda RBX: 000055d5eca76c68 RCX: 00007f5c3fcc9ab2
[   10.267012] RDX: 0000000000000040 RSI: 000055d5eca76c78 RDI: 0000000000000006
[   10.267591] RBP: 000055d5eca44890 R08: 000055d5eca76c50 R09: 00007f5c3fd99a40
[   10.268168] R10: 0000000000000008 R11: 0000000000000246 R12: 000000003bd90000
[   10.268744] R13: 0000000000000040 R14: 000055d5eca76c50 R15: 000055d5eca448e0
[   10.269319] Modules linked in:
[   10.269562] CR2: 0000000000000000
[   10.269845] ---[ end trace f09b8963e5a3593b ]---

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

