Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B23426FA7F
	for <lists+dm-devel@lfdr.de>; Mon, 22 Jul 2019 09:41:53 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7B08EC0601F2;
	Mon, 22 Jul 2019 07:41:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F72061352;
	Mon, 22 Jul 2019 07:41:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2EBAF1800207;
	Mon, 22 Jul 2019 07:41:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6KCNbov006658 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 20 Jul 2019 08:23:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 22DC0608C1; Sat, 20 Jul 2019 12:23:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4D98608A4;
	Sat, 20 Jul 2019 12:23:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0EE9A5AFD9;
	Sat, 20 Jul 2019 12:23:30 +0000 (UTC)
Received: from localhost (unknown [23.100.24.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 45D0520873;
	Sat, 20 Jul 2019 12:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563625409;
	bh=7fPmhkAon7IxaHSzWlAC3fDbviJS4cDTR+eDtOIy0EU=;
	h=Date:From:To:To:To:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Subject:In-Reply-To:
	References:From;
	b=abZWAxXy4YUfjkZI7v32EsSL8ijr7MBUO6z10MRiTyYL1uahCJwTBcza9UO2s2OkH
	ELp+vKiFqSGYNNGhxUWGkQGnZykb+aIg3reab41ig19LysWIFPuv6UBGF/MQgDwhVZ
	ve54ckApFDcDHpZWlFWrQ0RvKC+88P3uyz5AaDzM=
Date: Sat, 20 Jul 2019 12:23:28 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20190720030637.14447-2-ming.lei@redhat.com>
References: <20190720030637.14447-2-ming.lei@redhat.com>
Message-Id: <20190720122329.45D0520873@mail.kernel.org>
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Sat, 20 Jul 2019 12:23:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Sat, 20 Jul 2019 12:23:30 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'sashal@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<sashal@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 22 Jul 2019 03:41:30 -0400
Cc: Hannes Reinecke <hare@suse.com>, Bart Van Assche <bvanassche@acm.org>,
	Mike Snitzer <snitzer@redhat.com>,
	"Ewan D. Milne" <emilne@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, stable@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH V2 1/2] blk-mq: add callback of .cleanup_rq
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Mon, 22 Jul 2019 07:41:52 +0000 (UTC)

Hi,

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag,
fixing commit: 396eaf21ee17 blk-mq: improve DM's blk-mq IO merging via blk_insert_cloned_request feedback.

The bot has tested the following trees: v5.2.1, v5.1.18, v4.19.59.

v5.2.1: Build OK!
v5.1.18: Build OK!
v4.19.59: Failed to apply! Possible dependencies:
    36e765392e48 ("blk-mq: complete req in softirq context in case of single queue")
    9ba20527f4d1 ("blk-mq: provide mq_ops->busy() hook")
    c7bb9ad1744e ("block: get rid of q->softirq_done_fn()")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

--
Thanks,
Sasha

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
