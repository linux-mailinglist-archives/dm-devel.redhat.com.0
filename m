Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E780A6AC76D
	for <lists+dm-devel@lfdr.de>; Mon,  6 Mar 2023 17:15:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678119329;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=88Z7hJIDHs0DtW5dTUbhUBwFAnEEUVdJXtBTveDj8no=;
	b=Vefw+41PjzUGKzTtuW7ZJAoSa8uMs6U9D/zRGhzX5rF1iic4RdBoQzjmTsw8R0ywYLwJRE
	ek5OZqA2itcF9Va/57XGvTFGZ0xsFDdp34O4DVTK9yGmP421fSGhxRtn1lOfjCPRQFH3A3
	5LnZRRSlQHw+mNhSQA0yTjDdxIQtRbI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-bmx-5GiZPyq3S1xBVqL9eA-1; Mon, 06 Mar 2023 11:15:28 -0500
X-MC-Unique: bmx-5GiZPyq3S1xBVqL9eA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BDAA1816EC0;
	Mon,  6 Mar 2023 16:15:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2DAAF1121314;
	Mon,  6 Mar 2023 16:15:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1750E19465B1;
	Mon,  6 Mar 2023 16:15:11 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6BC03194658C
 for <dm-devel@listman.corp.redhat.com>; Mon,  6 Mar 2023 16:15:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 49EEA112132D; Mon,  6 Mar 2023 16:15:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEC761121314;
 Mon,  6 Mar 2023 16:15:09 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 326GF96u027112; Mon, 6 Mar 2023 11:15:09 -0500
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 326GF9CC027108; Mon, 6 Mar 2023 11:15:09 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Mon, 6 Mar 2023 11:15:09 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: yangerkun <yangerkun@huaweicloud.com>
In-Reply-To: <20230306115648.3154696-1-yangerkun@huaweicloud.com>
Message-ID: <alpine.LRH.2.21.2303061108570.24847@file01.intranet.prod.int.rdu2.redhat.com>
References: <20230306115648.3154696-1-yangerkun@huaweicloud.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [dm-devel] [PATCH v2] dm-crypt: fix softlockup in dmcrypt_write
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
Cc: dm-devel@redhat.com, snitzer@kernel.org, yangerkun@huawei.com,
 agk@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Mon, 6 Mar 2023, yangerkun wrote:

> From: yangerkun <yangerkun@huawei.com>
> 
> We meet a softlockup:
> 
> localhost login: [ 3391.153255][   C12] watchdog: BUG: soft lockup - CPU#12 stuck for 23s! [dmcrypt_write/2:2897]
> ...
> [ 3391.258372][   C12] CPU: 12 PID: 2897 Comm: dmcrypt_write/2 Tainted: G             L    5.10.0+ #8
> [ 3391.267288][   C12] Hardware name: Huawei TaiShan 2280 V2/BC82AMDDA, BIOS 1.75 04/26/2021
> [ 3391.275428][   C12] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO BTYPE=--)
> [ 3391.282102][   C12] pc : blk_attempt_bio_merge.part.6+0x38/0x158
> [ 3391.288080][   C12] lr : blk_attempt_plug_merge+0xc0/0x1b0
> [ 3391.293540][   C12] sp : ffff8000718abc30
> [ 3391.297530][   C12] x29: ffff8000718abc30 x28: 0000000000000000
> [ 3391.303509][   C12] x27: ffff2020361d9ac0 x26: 0000000000000001
> [ 3391.309488][   C12] x25: 0000000000000001 x24: ffff8000718abd08
> [ 3391.315467][   C12] x23: ffff0020a10dbb00 x22: 0000000000000001
> [ 3391.321445][   C12] x21: ffff8000718abe20 x20: ffff0020a10dbb00
> [ 3391.327424][   C12] x19: ffff0020aed7b040 x18: 0000000000000000
> [ 3391.333402][   C12] x17: 0000000000000000 x16: fffffdffffe00000
> [ 3391.339381][   C12] x15: 0000000000001000 x14: 0000000000000000
> [ 3391.345359][   C12] x13: 0000000000002000 x12: ffff2060011f9070
> [ 3391.351338][   C12] x11: 0000000000000001 x10: 0000000000000002
> [ 3391.357316][   C12] x9 : ffff800010586c38 x8 : ffff202009a7f200
> [ 3391.363294][   C12] x7 : ffff8000718abd00 x6 : ffff20200df33750
> [ 3391.369274][   C12] x5 : 0000000000000001 x4 : 0000000000000000
> [ 3391.375252][   C12] x3 : 0000000000000001 x2 : ffff0020a10dbb00
> [ 3391.381230][   C12] x1 : ffff0020aed7b040 x0 : 0000000000001000
> [ 3391.387210][   C12] Call trace:
> [ 3391.390338][   C12]  blk_attempt_bio_merge.part.6+0x38/0x158
> [ 3391.395970][   C12]  blk_attempt_plug_merge+0xc0/0x1b0
> [ 3391.401085][   C12]  blk_mq_submit_bio+0x398/0x550
> [ 3391.405856][   C12]  submit_bio_noacct+0x308/0x380
> [ 3391.410630][   C12]  dmcrypt_write+0x1e4/0x208 [dm_crypt]
> [ 3391.416005][   C12]  kthread+0x130/0x138
> [ 3391.419911][   C12]  ret_from_fork+0x10/0x18
> 
> dmcrypt_write will be wakeup once there is a not empty write_tree, and
> before really submit_bio, the old write_tree will be peeled, so there
> may not so much bio, but every time we check RB_EMPTY_ROOT, it may be
> false since the heavy load write, so the softlockup can trigger.
> 
> We can add cond_resched every time before or after kcryptd_io_write, but
> dmcrypt_write seems performance sensitive since it will submit all
> pending write, so we choose cond_resched after 1s before the 'while'
> submit bio.
> 
> Fixes: dc2676210c42 ("dm crypt: offload writes to thread")
> Signed-off-by: yangerkun <yangerkun@huawei.com>

Hi

Thanks for the bug report.

I think that we don't have to count time and call cond_resched() only 
after being stuck for one second, we should call it always. There is no 
performance problem when calling cond_resched() - it does nothing if the 
scheduler hasn't decided that scheduling is needed.

cond_resched() should be called in the do-while loop because this loop can 
run for unbounded amount of time too.

Mikulas
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

